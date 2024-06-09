# Banking Website

This is a banking website project created using Handlebars, HTML, CSS, and Node.js with a MySQL database.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Database Setup](#database-setup)
- [Scripts](#scripts)
- [Technologies Used](#technologies-used)


## Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/jacobjohnxn/sbank.git
   cd sbank
   cd main( *make sure you are in main folder before proceding*)
   ```
2. Install the dependencies:

   ```sh
   npm install
   ```

## Usage

1. Create a `.env` file in the root directory of the project and add your environment variables:

   ```sh
   PORT=3000
   DATABASE_URL=mysql://user:password@localhost:3306/database_name
   ```

2. Start the application:

   ```sh
   npm start
   ```

3. Open your browser and go to `http://localhost:5000`.

## Database Setup

1. Make sure you have MySQL installed and running on your machine.

2. Import the database schema and data:
   - Open MySQL Workbench.
   - Connect to your local MySQL server.
   - Go to `Server > Data Import`.
   - Select `Import from Self-Contained File` and choose the SQL file you.
   - Select your target database or create a new one.
   - Click `Start Import`.

## Scripts

- `start`: Starts the application using `nodemon`.

To run the application in development mode:

   ```sh
   npm start
   ```

## Technologies Used

- Handlebars
- HTML
- CSS
- Node.js
- Express
- MySQL

#some sample usage

![image](https://github.com/jacobjohnxn/sbank/assets/89299580/536f6077-7d6f-4af6-8dcd-88a7627dadc6)
![image](https://github.com/jacobjohnxn/sbank/assets/89299580/ffc00a6c-9fc0-4d88-989c-75ad17f5f536)
![image](https://github.com/jacobjohnxn/sbank/assets/89299580/ffc767ff-557c-4aee-a8ae-c3d40eb45703)





This version should appear correctly formatted in GitHub without any issues with text escaping out of the code blocks. Save this content as `README.md` in your project's root directory.
