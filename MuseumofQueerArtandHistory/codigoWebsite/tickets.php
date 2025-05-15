<!DOCTYPE html>
<html lang="pt">
<head>
    <title>Tickets</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="CSS/tickets.css"> 
  <link rel="stylesheet" type="text/css" href="CSS/all.css">
</head>
<body>
  <header>
    <nav class="navegation">
      <ul>
        <li class="navegation"><a href="index.html">Home</a></li>
        <li class="navegation"><a href="about.html">About</a></li>
        <li class="navegation"><a href="webstore.html">Webstore</a></li>
        <li class="navegation"><a href="tickets.php">Tickets</a></li>
      </ul>
    </nav>
  </header>
  <img id="myButton" class="image-button" src="Imagens/buttonpc.png" 
   srcset="Imagens/buttonmobile.png 55w,
           Imagens/buttontablet.png 75w,
           Imagens/buttonpc.png 100w" 
   sizes="(max-width: 768px) 55px,
          (max-width: 1024px) 75px,
          100px" 
   alt="Menu">
  <div>
    <img  id= "background" src="Imagens/ticketsbig.jpg" 
     srcset="Imagens/ticketssmall.jpg 480w,
             Imagens/ticketsmedium.jpg 768w,
             Imagens/ticketsbig.jpg 1024w" 
     sizes="(max-width: 768px) 300px,
            (max-width: 1024px) 600px,
            1920px" 
     alt="Pride_Parade">
    <h1>Museum of Queer Art and History</h1>
    </div>
    <main>
      <div class="info" id="one"> 
          <h2>Tickets</h2>
          <p>Here is section where the ticket information is going to be displayed</p>
          <ul>
            <li>Family Ticket (2 adults & 2 children) - 25€</li>
            <li>Student - 12€</li>
            <li>Children - 10€</li>
            <li>Adult - 18€</li>
          </ul>
        </div>
          <div  class="info" id="two">
            <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                    <label for="numero">Number of Tickets</label>
                    <input type="number" id="numero" name="numero" min="0" max="10" required /><br>
                    <label for="date">Date:</label>
                    <input type="date" id="date" name="date" value="2023-10-16" min="2023-10-20" max="2024-12-31" required /><br>
                    <label for="tipo">Ticket type:</label>
                    <select name="tipo" id="tipo" aria-required>
                        <option value="">--Please choose an option--</option>
                        <option value="Student">Student</option>
                        <option value="Children">Children</option>
                        <option value="Family">Family</option>
                        <option value="Adult">Adult</option>
                    </select><br>
                    <input type="submit" value="Check Availability" name="submit" />
                    <input type="submit" value="Buy Tickets" name="submit" />
                </form>
                <div id="resultado">
                    <?php
                    if ($_SERVER["REQUEST_METHOD"] == "POST") {
                        $numeroIngressos = $_POST['numero'];
                        $data = $_POST['date'];
                        $tipoIngresso = $_POST['tipo'];
                        echo "<p>Number of Tickets: $numeroIngressos</p>";
                        echo "<p>Date: $data</p>";
                        echo "<p>Ticket type: $tipoIngresso</p>";
                    }
                    ?>
                </div>
            </div>
      <div id="three">
        <h2>Profits</h2>
        <p>30% of the money from the tickets and webstore items goes to institutions that support the LGBT community, like the following</p>
        <div id="imgList">
        <img class="seta" id="esquerda" src="Imagens/seta1.png" alt="seta esquerda" >
        <div id="carrossel">
        <img class="institution" id="um" src="Imagens/glaad.png" alt="Glaad_Logo" >
        <img class="institution" id="dois" src="Imagens/glsen.png" alt="Glsen_Logo">
        <img class="institution" id="tres" src="Imagens/humanrights.png" alt="HumanRights_Logo">
        </div>
        <img class="seta" id="direita" src="Imagens/seta2.png" alt="seta direita" >
        </div>
      </div>
    </main>
  <footer>
    <small>
      Copyright © 2023 Museum of Queer Art and History. All Rights Reserved.
    </small>
      </footer>
  <script src="js/script.js"></script>
  <script src="js/carrossel.js"></script>
</body>
</html>
