document.addEventListener('DOMContentLoaded', () => {
  const commentsList = document.getElementById('comments-list');
  fetch('https://jsonplaceholder.typicode.com/comments')
    .then(response => response.json())
    .then(comments => {
      comments.slice(0, 10).forEach(comment => {
        const commentItem = document.createElement('li');
        commentItem.classList.add('comment');
        commentItem.innerHTML = `
          <p>Email: ${comment.email}</p>
          <p>${comment.body}</p>
        `;
        commentsList.appendChild(commentItem);
      });
    })
    .catch(error => {
      console.error('Ocorreu um erro ao buscar os comentários:', error);
    });
});