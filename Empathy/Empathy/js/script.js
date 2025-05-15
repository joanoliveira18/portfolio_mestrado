let video;
let bodyPose;
let poses = [];
let bodyParts = [];
let fadeAmounts = 255;
let fadeSpeed = 3;
let allImagesFaded = false;
const POSTER_WIDTH = 353;
const POSTER_HEIGHT = 500;
let c = false;
let bd = false;
let be = false;
let pd = false;
let pe = false;
let t = false;
let keypoints;


function preload() {
    bodyParts = [
        loadImage('imagens/body_part_0.png'), // Cabeça
        loadImage('imagens/body_part_1.png'), // Braço direito
        loadImage('imagens/body_part_2.png'), // Braço esquerdo
        loadImage('imagens/body_part_3.png'), // Perna direita
        loadImage('imagens/body_part_4.png'), // Perna esquerda
        loadImage('imagens/body_part_5.png')  // Tronco
    ];
    bodyPose = ml5.bodyPose("MoveNet", { flipped: true });
}


function gotPoses(results) {
    poses = results;
}


function setup() {
    createCanvas(POSTER_WIDTH, POSTER_HEIGHT);
    video = createCapture(VIDEO, { flipped: true });
    video.size(353, 500);
    video.hide();
    bodyPose.detectStart(video, gotPoses);
}


function draw() {
    drawBlackAndWhiteVideo();
    if (poses.length > 0) {
        keypoints = poses[0].keypoints;
        if (keypoints) {
            drawBodyPart(keypoints[0], bodyParts[0], dist(keypoints[3].x, keypoints[3].y, keypoints[4].x, keypoints[4].y) * 2, dist(keypoints[3].x, keypoints[3].y, keypoints[4].x, keypoints[4].y) * 2 + 90, 0);  // Cabeça
            drawBodyPart(keypoints[5], bodyParts[1], 60, dist(keypoints[5].x, keypoints[5].y, keypoints[9].x, keypoints[9].y), 1); // Braço esquerda
            drawBodyPart(keypoints[6], bodyParts[2], 60, dist(keypoints[6].x, keypoints[6].y, keypoints[10].x, keypoints[10].y), 2); // Braço direito
            drawBodyPart(keypoints[5], bodyParts[5], dist(keypoints[6].x, keypoints[6].y, keypoints[5].x, keypoints[5].y), dist(keypoints[6].x, keypoints[6].y, keypoints[12].x, keypoints[12].y), 5); // Tronco
            drawBodyPart(keypoints[11], bodyParts[3], 40, dist(keypoints[11].x, keypoints[11].y, keypoints[15].x, keypoints[15].y), 3); // Perna direita
            drawBodyPart(keypoints[12], bodyParts[4], 40, dist(keypoints[12].x, keypoints[12].y, keypoints[16].x, keypoints[16].y), 4); // Perna esquerda 
        }

    }
    if (bd && be && t && c && pd && pe) {

        if (fadeAmounts > 0) {
            fadeAmounts -= fadeSpeed;
        } else {
            bd = false;
            be = false;
            pe = false;
            pd = false;
            t = false;
            c = false;
            allImagesFaded = true;
        }
    } else {
        fadeAmounts = 255;
        allImagesFaded = false;
    }

    if (allImagesFaded && fadeAmounts == 0) {
        fill(255);
        textSize(16);
        textStyle(BOLD);
        textAlign(CENTER, CENTER);
        textFont("Montserrat");
        text("Have you helped yourself today?", width / 2, POSTER_HEIGHT - 60);
        text("Empathy without boundaries", width / 2, POSTER_HEIGHT - 40);
        text("Is self-destruction", width / 2, POSTER_HEIGHT - 20);
    }
}


function drawBodyPart(keypoint, img, w, h, index) {
    if (keypoint) {
        let x = keypoint.x;
        let y = keypoint.y;

        if (index == 0) {//Cabeça
            if (keypoint.confidence >= 0.5) {
                c = true;
                tint(255, fadeAmounts);
                image(img, x - w / 2, y - (h / 2 + 20), w, h);
            } else {
                c = false;
            }
        }

        if (index == 1) {//Braço esquerdo
            if (keypoint.confidence >= 0.5) {
                be = true;
                x = 0;
                y = 0;
                push();
                let center, corner, v, a;
                center = createVector(keypoints[5].x + w, keypoints[5].y);
                corner = createVector(keypoints[7].x, keypoints[7].y);
                v = corner.sub(center);
                a = v.heading();
                translate(keypoints[5].x, keypoints[5].y);
                rotate(a - HALF_PI);
                tint(255, fadeAmounts);
                image(img, x, y, w, h);
                pop();
            } else {
                be = false;
            }
        }

        if (index == 2) { //Braço direito
            if (keypoint.confidence >= 0.5) {
                bd = true;
                x = 0;
                y = 0;
                push();
                let center, corner;
                center = createVector(keypoints[6].x, keypoints[6].y);
                corner = createVector(keypoints[8].x, keypoints[8].y);
                let v, a;
                v = corner.sub(center);
                a = v.heading();
                translate(keypoints[6].x, keypoints[6].y);
                rotate(a - HALF_PI);
                tint(255, fadeAmounts);
                image(img, x - w / 2, y, w, h);
                pop();
            } else {
                bd = false;
            }
        }

        if (index == 3) {//Perna Direita
            if (keypoint.confidence >= 0.5) {
                pd = true;
                tint(255, fadeAmounts);
                image(img, x - w / 2, y, w, h);
            } else {
                pd = false;
            }
        }

        if (index == 4) {//Perna Esquerda
            if (keypoint.confidence >= 0.5) {
                pe = true;
                tint(255, fadeAmounts);
                image(img, x - w / 2, y, w, h);
            } else {
                pe = false;
            }
        }

        if (index == 5) {//Tronco
            if (keypoint.confidence >= 0.5) {
                t = true;
                tint(255, fadeAmounts);
                image(img, x, y, w, h);
            } else {
                t = false;
            }
        }
    }

}


function drawBlackAndWhiteVideo() {
    video.loadPixels();
    let bwVideo = createImage(video.width, video.height);
    bwVideo.loadPixels();
    for (let y = 0; y < video.height; y++) {
        for (let x = 0; x < video.width; x++) {
            let index = (x + y * video.width) * 4;
            let r = video.pixels[index];
            let g = video.pixels[index + 1];
            let b = video.pixels[index + 2];
            let gray = (r + g + b) / 3; 
            bwVideo.pixels[index] = gray;     
            bwVideo.pixels[index + 1] = gray; 
            bwVideo.pixels[index + 2] = gray; 
            bwVideo.pixels[index + 3] = 255;  
        }
    }

    bwVideo.updatePixels();
    image(bwVideo, 0, 0);
}
