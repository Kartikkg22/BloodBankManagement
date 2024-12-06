// backend/db_config.js
const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',     // Replace with your DB host if not running locally
    user: 'root',          // Replace with your MySQL username
    password: 'K4g@230404',          // Replace with your MySQL password
    database: 'blood_bank_management' // The name of your database
});

connection.connect(err => {
    if (err) {
        console.error('Error connecting to the database:', err);
    } else {
        console.log('Connected to the database');
    }
});

module.exports = connection;
