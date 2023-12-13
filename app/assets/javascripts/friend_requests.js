// document.addEventListener('DOMContentLoaded', () => {
//   const acceptButtons = document.querySelectorAll('.accept-request');
//   const rejectButtons = document.querySelectorAll('.reject-request');

//   acceptButtons.forEach(button => {
//     button.addEventListener('click', (event) => {
//       const requestId = event.currentTarget.dataset.requestId;

//       fetch(`/friend_requests/${requestId}/accept`, {
//         method: 'POST',
//         headers: {
//           'Content-Type': 'application/json',
//           'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
//         }
//       })
//       .then(response => {
//         if (response.ok) {
//           const listItem = document.getElementById(`friend-request-${requestId}`);
//           listItem.remove(); // Remove the request from the list
//           // Optionally, you can display a success message or handle UI updates here
//         } else {
//           // Handle errors
//         }
//       })
//       .catch(error => {
//         console.error('Error:', error);
//       });
//     });
//   });

//   rejectButtons.forEach(button => {
//     button.addEventListener('click', (event) => {
//       const requestId = event.currentTarget.dataset.requestId;

//       fetch(`/friend_requests/${requestId}/reject`, {
//         method: 'DELETE',
//         headers: {
//           'Content-Type': 'application/json',
//           'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
//         }
//       })
//       .then(response => {
//         if (response.ok) {
//           const listItem = document.getElementById(`friend-request-${requestId}`);
//           listItem.remove(); // Remove the request from the list
//           // Optionally, you can display a success message or handle UI updates here
//         } else {
//           // Handle errors
//         }
//       })
//       .catch(error => {
//         console.error('Error:', error);
//       });
//     });
//   });
// });
