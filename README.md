# DhruvPanchal-CrickScore_FullStack
A real-time cricket scoring system built with PHP, MySQL, Zamp Server, and modern web technologies. Features include live score updates, ball-by-ball tracking, over statistics, and separate admin and user interfaces.

Features
🏏 Real-time score updates using WebSocket
📊 Live ball-by-ball tracking
📈 Over-by-over statistics
🎯 Visual representation of each ball
👑 Separate admin panel for score management
👥 Public view for audience
🎨 Responsive and modern UI design
Tech Stack
Frontend: HTML, CSS, JavaScript
Backend: PHP
Database: MySQL
Server: XAMPP
Prerequisites
XAMPP (with PHP 7.4+ and MySQL)
Web browser
Setup Instructions
Install XAMPP

Download and install XAMPP from https://www.apachefriends.org/
Start Apache and MySQL services from XAMPP Control Panel
Clone the Repository

cd C:/xampp/htdocs/
git clone https://github.com/your-username/crickscore.git
cd crickscore
Database Setup

Open phpMyAdmin (http://localhost/phpmyadmin)
Create a new database named 'crickscore'
Import the database structure using the provided crickscore.sql file
Configure Database Connection

Open db_connect.php
Update the database credentials if needed:
$host = 'localhost';
$dbname = 'crickscore';
$username = 'root';
$password = '';
Access the Application

Admin Panel: http://localhost/crickscore/admin.html
Public View: http://localhost/crickscore/user.html
Project Structure
crickscore/
├── admin.html           # Admin interface for scoring
├── user.html           # Public interface for viewing
├── db_connect.php      # Database connection configuration
├── get_match.php       # API endpoint for match data
├── update_score.php    # API endpoint for updating scores
└── database.sql        # Database structure and initial data
Usage
Admin Panel (admin.html)

Access the admin panel to manage scoring
Use buttons to add runs (0-6) or wickets
View over-by-over statistics
Track current over progress
Public View (user.html)

Real-time score updates
Ball-by-ball animations
Over statistics and history
Current match status
Contributing
Fork the repository
Create a new branch (git checkout -b feature/improvement)
Commit your changes (git commit -am 'Add new feature')
Push to the branch (git push origin feature/improvement)
Create a Pull Request
Acknowledgments
XAMPP development team
PHP development team
Contributors and testers
