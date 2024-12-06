// backend/routes/donor_routes.js
const express = require('express');
const router = express.Router();
const db = require('../db_config');

// Route to register a donor
router.post('/register', (req, res) => {
    const { name, email, phone, blood_type, address, donation_date } = req.body;

    // SQL query to insert a new donor
    const query = `INSERT INTO Donor (name, address, phoneno, dob, blood_group) VALUES (?, ?, ?, ?, ?)`;

    db.query(query, [name, address, phone, donation_date, blood_type], (err, results) => {
        if (err) {
            console.error('Error inserting donor:', err);
            return res.status(500).json({ success: false, message: 'Failed to register donor' });
        }
        res.json({ success: true, message: 'Donor registered successfully' });
    });
});

module.exports = router;
