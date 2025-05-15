document.getElementById("myButton").addEventListener('click', function() {
  var navPanel = document.querySelector("header");
  if (navPanel.style.display === 'none' || navPanel.style.display === '') {
    navPanel.style.display = 'block';
  } else {
    navPanel.style.display = 'none';
  }
});

