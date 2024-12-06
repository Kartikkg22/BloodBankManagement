// main.js

// Wait until the document is fully loaded before executing
document.addEventListener('DOMContentLoaded', function() {

    // Navigation menu toggle for smaller screens
    const menuButton = document.getElementById('menuButton');
    const navMenu = document.getElementById('navMenu');

    if (menuButton) {
        menuButton.addEventListener('click', function() {
            navMenu.classList.toggle('active');  // Toggle the 'active' class to show/hide the menu
        });
    }

    // General form validation for all forms on the page
    const allForms = document.querySelectorAll('form');
    allForms.forEach(form => {
        form.addEventListener('submit', function(event) {
            let isValid = true;
            const formElements = form.querySelectorAll('input[required], select[required], textarea[required]');
            formElements.forEach(element => {
                if (!element.value.trim()) {
                    isValid = false;
                    alert("Please fill out all required fields.");
                }
            });

            if (!isValid) {
                event.preventDefault();  // Prevent form submission if validation fails
            }
        });
    });

    // Example of confirmation message before submitting sensitive forms
    const deleteButtons = document.querySelectorAll('.deleteButton');
    deleteButtons.forEach(button => {
        button.addEventListener('click', function(event) {
            if (!confirm('Are you sure you want to delete this record?')) {
                event.preventDefault();  // Prevent the action if the user cancels
            }
        });
    });

});
