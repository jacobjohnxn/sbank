
```markdown
# Banking Website

This is a banking website project created using Handlebars, HTML, CSS, and Node.js with a MySQL database.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Database Setup](#database-setup)
- [Scripts](#scripts)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)

## Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/jacobjohnxn/sbank.git
   cd sbank
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

3. Open your browser and go to `http://localhost:3000`.

## Database Setup

1. Make sure you have MySQL installed and running on your machine.

2. Import the database schema and data:
   - Open MySQL Workbench.
   - Connect to your local MySQL server.
   - Go to `Server > Data Import`.
   - Select `Import from Self-Contained File` and choose the SQL file you exported.
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



This version should appear correctly formatted in GitHub without any issues with text escaping out of the code blocks. Save this content as `README.md` in your project's root directory.
