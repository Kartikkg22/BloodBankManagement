document.getElementById('donorForm').addEventListener('submit', function (e) {
    e.preventDefault(); // Prevent the default form submission

    const formData = {
        name: document.getElementById('donorName').value,
        email: document.getElementById('donorEmail').value,
        phone: document.getElementById('donorPhone').value,
        bloodType: document.getElementById('donorBloodType').value,
        address: document.getElementById('donorAddress').value,
        donationDate: document.getElementById('donationDate').value
    };

    fetch('http://localhost:3000/submit_donor', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json', // Ensure correct content type
        },
        body: JSON.stringify(formData)  // Convert the form data to JSON
    })
    .then(response => response.json())  // Parse the JSON response from the server
    .then(data => {
        console.log('Success:', data);  // Log success
    })
    .catch((error) => {
        console.error('Error:', error);  // Log errors
    });
});
