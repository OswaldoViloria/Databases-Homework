const express = require('express')
const app = express()

const {Pool} = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'cyf_ecommerce',
    password: 'postgres',
    port: 5432
});


app.get('/customers', (req,res) => {
    pool.query('select * from customers', (error, result) => {
        res.json(result.rows)
    })
})

app.get('/suppliers', (req,res) => {
    pool.query('select * from suppliers', (error, result) => {
        res.json(result.rows)
    })
})

let queryProducts = 'select products.product_name, suppliers.supplier_name ' + 
                    'from suppliers ' + 
                    'join products ' + 
                    'on suppliers.id = products.supplier_id '
app.get('/products', (req,res) => {
    pool.query(queryProducts, (error, result) => {
        res.json(result.rows)
    })
})

app.listen(3000, function(){
    console.log('server is running');
})