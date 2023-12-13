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
        const pingsCountElement = document.querySelector('.current-pings');
        if (pingsCountElement) {
          // Update the UI with the new count
          pingsCountElement.innerText = data.pings_count;
        } else {
          console.error('Element with class .current-pings not found.');
        }
      })
      .catch(error => {
        console.error('Error:', error);
        // Handle error if needed
      });
    });
  });
});
