Database Lab

This repository contains a database lab setup using Docker, MySQL, and CI/CD automation. The lab includes:

A docker-compose.yml file to orchestrate the database container.
Initialization scripts to set up tables and seed data.
A configuration file (my.cnf) to customize MySQL settings.
A CI/CD pipeline to automate deployment and testing.

Project Structure
database-lab/
├── docker-compose.yml
├── init-scripts/
│   ├── 01-create-table.sql
│   ├── 02-seed-data.sql
├── config/
│   ├── my.cnf
├── .github/
│   ├── workflows/
│   │   ├── ci-cd-pipeline.yml
├── README.md

Setting Up and Running the Database
Start the MySQL database using Docker Compose:

docker-compose up -d
Verify that the container is running:
docker ps
Connect to the MySQL database:
docker exec -it database-container-name mysql -u root -p

Files Description
docker-compose.yml
This file defines a MySQL service container and applies initialization scripts.

init-scripts/
01-create-table.sql: Contains SQL commands to create the necessary database tables.
02-seed-data.sql: Populates the tables with initial sample data.

config/my.cnf
This file allows customization of MySQL configuration settings such as max connections, buffer sizes, and character sets.

CI/CD Pipeline
A GitHub Actions workflow (.github/workflows/ci-cd-pipeline.yml) automates the process of building, testing, and deploying the database setup. The workflow includes:
Building the MySQL container
Running database migrations and seed scripts
Running automated tests to ensure data integrity
Deploying the database setup to a staging or production environment
