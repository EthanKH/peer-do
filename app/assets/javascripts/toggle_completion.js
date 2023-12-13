document.addEventListener('DOMContentLoaded', () => {
  const doneButtons = document.querySelectorAll('.done-button');

  doneButtons.forEach(button => {
    button.addEventListener('click', () => {
      const taskId = button.dataset.taskId;

      fetch(`/tasks/${taskId}/toggle_completion`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        }
      })
      .then(response => {
        if (response.ok) {
          // Handle success, maybe remove the task from the current list
          button.closest('.col-md-12').remove(); // Assuming the task is inside this element
          const flashMessage = document.createElement('div');
          flashMessage.classList.add('alert', 'alert-success');
          flashMessage.textContent = 'Task complete!';
          document.body.appendChild(flashMessage);
          setTimeout(() => {
            flashMessage.remove();
          }, 3000);
        } else {
          // Handle errors
        }
      })
      .catch(error => {
        console.error('Error:', error);
      });
    });
  });
});
