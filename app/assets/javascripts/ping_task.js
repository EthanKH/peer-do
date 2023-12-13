document.addEventListener('DOMContentLoaded', () => {
  const pingButtons = document.querySelectorAll('.ping-button');

  pingButtons.forEach(button => {
    button.addEventListener('click', () => {
      const taskId = button.dataset.taskId;

      fetch(`/tasks/${taskId}/ping_task`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': Rails.csrfToken()
        }
      })
      .then(response => response.json())
      .then(data => {
        // Log the element to check if it's found
        const pingsCountElement = document.querySelector('.pings-count');
        console.log('Pings Count Element:', pingsCountElement);

        if (pingsCountElement) {
          pingsCountElement.innerText = data.pings_count;
        }
      })
      .catch(error => {
        console.error('Error:', error);
        // Handle error if needed
      });
    });
  });
});
