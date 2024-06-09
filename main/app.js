const express = require('express');
const session = require('express-session');
const mysql = require("mysql")
const path = require("path")
const dotenv = require('dotenv')
const jwt = require("jsonwebtoken")
const bcrypt = require("bcryptjs")
const methodOverride = require('method-override')

dotenv.config({ path: './.env'})

const app = express();

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'scott',
    database: 'sbank'
  });

const publicPath = path.join(__dirname, "public");

app.use(express.static(publicPath));
app.use(express.static(__dirname + './public'))
app.use(express.urlencoded({extended: 'false'}))
app.use(express.json())
app.use(methodOverride('_method'))
app.use(session({
    secret: '1000', // Change this to a secure random string
    resave: false,
    saveUninitialized: true
  }));
 

app.set('view engine', 'hbs')


db.connect((error) => {
    if(error) {
        console.log(error)
    } else {
        console.log("MySQL connected!")
    }
})

app.get("/", (req, res) => {
    res.render("index")
})

app.get("/register", (req, res) => {
    res.render("register")
})
app.get("/about", (req, res) => {
    res.render("about")
})
app.get("/customercare", (req, res) => {
    res.render("customercare")
})
app.get("/welcome", (req, res) => {
    const name = req.session.name; // Assuming you store user info in req.session.user
    res.render("welcome", { name });
})
app.get("/login", (req, res) => {
    res.render("login")
})
app.get("/tran", (req, res) => {
    res.render("tran")
})

app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
      if (err) {
        return res.redirect('/welcome'); // Handle error if needed
      }
      res.redirect('/login');
    });
  });
app.get("/loan", (req, res) => {
    res.render("loan")
})

app.get('/userinfo', (req, res) => {
    // Assuming you have a session variable 'userEmail' that contains the current user's email
    const user = req.session.email;
    
    // Fetch the user's amount from the database
    const query = 'SELECT * FROM users WHERE email = ?';
    db.query(query, [user], (error, results) => {
        if (error) {
            console.log('Error executing query:', error.sqlMessage);
            res.status(500).send('Internal Server Error');
            return;
        }
    
        const user = results[0]; // Assuming there's only one user with the given email
    
        res.render('userinfo', { user }); // Assuming your Handlebars file is named 'profile.hbs'
    });
});  
app.post("/auth/register", (req, res) => {    
    const { name, email, password, password_confirm,accno,amount } = req.body

    db.query('SELECT email FROM users WHERE email = ?', [email], async (error, result) => {
        if(error){
            console.log(error)
        }

        if( result.length > 0 ) {
            return res.render('register', {
                message: 'This email is already in use'
            })
        } else if(password !== password_confirm) {
            return res.render('register', {
                message: 'Password Didn\'t Match!'
            })
        }

        let hashedPassword = await bcrypt.hash(password, 8)

        console.log(hashedPassword)
       
        db.query('INSERT INTO users SET?', {name: name, email: email, password: hashedPassword,accno: accno,amount: amount,loanamount:0}, (err, result) => {
            if(error) {
                console.log(error)
            } else {
                return res.render('register', {
                    message: 'User registered!'
                })
            }
        })        
    })
})

app.post("/auth/login", (req, res) => { 
    const {  email, password} = req.body

    db.query('SELECT * FROM users WHERE email = ?',[email], async function (error, results, fields) {
        console.log('Database Results:', results);
        console.log('Email:', email);
      if (error) {
        res.send({
          "code":400,
          "failed":"error ocurred"
        })
      }else{
        if(results.length >0){
          const comparision = await bcrypt.compare(password, results[0].password)
          if(comparision){
            req.session.email = email;
            const name = email; // Replace with the actual name from the database
            req.session.name = name;
            res.redirect('/welcome')          }
          else{
            res.send({
                 "code":204,
                 "success":"Email and password does not match"
            })
          }
        }
        else{
          res.send({
            "code":206,
            "success":"Email does not exits"
              });
        }
      }
      });
    })

    app.post("/auth/tran", (req, res) => {
        const { accno, amount } = req.body;
    
        // Assuming you have a session variable 'email' that contains the current user's email
        const email = req.session.email;
    
        // Fetch the user's amount from the database
        const query = 'SELECT amount FROM users WHERE email = ?';
        const values = [email];
    
        db.query(query, values, (fetchError, fetchResults) => {
            if (fetchError) {
                console.log(fetchError);
                res.status(500).send('Internal Server Error');
                return;
            }
    
            const userAmount = fetchResults[0].amount;
    
            // Check if the current user has enough funds for the transaction
            if (userAmount >= amount) {
                // Update the sender's amount (subtract)
                const debitQuery = 'UPDATE users SET amount = amount - ? WHERE email = ?';
                const debitValues = [amount, email];
    
                db.query(debitQuery, debitValues, (debitError, debitResults) => {
                    if (debitError) {
                        console.log(debitError);
                        res.status(500).send('Internal Server Error');
                        return;
                    }
    
                    // Update the receiver's amount (add)
                    const creditQuery = 'UPDATE users SET amount = amount + ? WHERE accno = ?';
                    const creditValues = [amount, accno];
    
                    db.query(creditQuery, creditValues, (creditError, creditResults) => {
                        if (creditError) {
                            console.log(creditError);
    
                            // Roll back the debit operation if credit operation fails
                            const rollbackDebitQuery = 'UPDATE users SET amount = amount + ? WHERE email = ?';
                            const rollbackDebitValues = [amount, email];
    
                            db.query(rollbackDebitQuery, rollbackDebitValues, (rollbackError, rollbackResults) => {
                                if (rollbackError) {
                                    console.log(rollbackError);
                                }
                            });
    
                            res.status(500).send('Internal Server Error');
                            return;
                        }
    
                        console.log('Transaction successful');
                        res.send('<script>alert("Transaction is successfully done"); window.location="/welcome";</script>');
                    });
                });
            } else {
                console.log('Insufficient funds');
                res.status(400).send('Insufficient funds');
            }
        });
    });
    
 
        app.post("/auth/loan", (req, res) => {    
            const {loanamount, LDATE } = req.body;   
            const email = req.session.email;     
            const query = 'UPDATE users SET loanamount = loanamount + ?, LDATE = ? WHERE email = ?';
            const values = [loanamount, LDATE, email];

            
            db.query(query, values, (error, results) => {
                    console.log('Database Results:', results);
                    console.log('email:', email);
                    console.log('loanamount:', loanamount);
                   
                    if(error) {
                        console.log(error)
                    } else {
                        res.send('<script>alert("loan is initiated done and will be transacted once manager agree"); window.location="/welcome";</script>');
                    }
                    
                })        
            })
            


app.delete('/logout', (req, res) => {
        req.logOut()
        res.redirect('/login')
      })

      
app.listen(5000, ()=> {
    console.log("server started on port 5000")
})
