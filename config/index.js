require('dotenv').config();
const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');

const isProduction = process.env.NODE_ENV === 'production';
const database =
  process.env.NODE_ENV === 'test'
    ? process.env.PGDATABASE_TEST
    : process.env.PGDATABASE;

// const connectionString = `postgresql://${process.env.PGUSER}:${process.env.PGPASSWORD}@${process.env.PGHOST}:${process.env.PGPORT}/${database}`;
const connectionString = `postgres://jckpuspkoirklj:79b5a278edc1185fe1c0fc2e3147e569cf12227a82f65eaed21f2633686c35ac@ec2-18-215-96-22.compute-1.amazonaws.com:5432/dasgh94dho6v05`;

const pool = new Pool({
  connectionString: connectionString,
  /*
    SSL is not supported in development
    Alternatively, you can omit the ssl configuration object if you specify the PGSSLMODE config var: heroku config:set PGSSLMODE=no-verify
    See https://devcenter.heroku.com/articles/heroku-postgresql#connecting-in-node-js
    */
  ssl: false,
});

// run this to create schema
// var file = fs.readFileSync(path.join(__dirname, "init.sql")).toString()
// pool.query(file, function (err) {
//   if (err) {
//     console.log(err)
//   }
// })

// Run this for inserting data
// var file = fs.readFileSync(path.join(__dirname, "data.sql")).toString()
// pool.query(file, function (err) {
//   if (err) {
//     console.log(err)
//   }
// })

module.exports = {
  query: (text, params) => pool.query(text, params),
  end: () => pool.end(),
};
