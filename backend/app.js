const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

// Initialize Express app
const app = express();

// Enable CORS for multiple origins (localhost and 127.0.0.1)
app.use(cors({
  origin: function (origin, callback) {
    if (!origin || origin === 'http://localhost:5500' || origin === 'http://127.0.0.1:5500') {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  }
}));

// Middleware to parse JSON data from POST requests
app.use(bodyParser.json());

// MySQL Database connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',  // Your MySQL username
  password: 'K4g@230404',  // Your MySQL password
  database: 'blood_bank_management'  // Your MySQL database name
});

// Connect to the MySQL database
db.connect((err) => {
  if (err) {
    console.error('Database connection error: ' + err.stack);
    return;
  }
  console.log('Connected to the database.');
});

// Donor registration API route
app.post('/submit_donor', (req, res) => {
    const { name, email, phone, bloodType, address, donationDate } = req.body;

    // Validate the incoming data
    if (!name || !email || !phone || !bloodType || !address || !donationDate) {
        return res.status(400).json({ success: false, message: 'All fields are required' });
    }

    // Insert donor data into the database
    const query = 'INSERT INTO Donor (name, address, phoneno, dob, blood_group) VALUES (?, ?, ?, ?, ?)';

    db.query(query, [name, address, phone, donationDate, bloodType], (err, result) => {
        if (err) {
            console.error('Error inserting donor data: ' + err.message);
            return res.status(500).json({ success: false, message: 'Database error' });
        }

        // Return success message if insertion is successful
        res.status(200).json({ success: true, message: 'Donor registered successfully' });
    });
});

  
// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
