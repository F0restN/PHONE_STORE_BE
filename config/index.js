require("dotenv").config();
const { Pool } = require("pg");
const fs = require('fs')
const path = require('path')

const isProduction = process.env.NODE_ENV === "production";
const database =
  process.env.NODE_ENV === "test"
    ? process.env.PGDATABASE_TEST
    : process.env.PGDATABASE;

const connectionString = `postgresql://${process.env.PGUSER}:${process.env.PGPASSWORD}@${process.env.PGHOST}:${process.env.PGPORT}/${database}`;
console.log(connectionString)
const pool = new Pool({
  connectionString: connectionString,
  /*
    SSL is not supported in development
    Alternatively, you can omit the ssl configuration object if you specify the PGSSLMODE config var: heroku config:set PGSSLMODE=no-verify
    See https://devcenter.heroku.com/articles/heroku-postgresql#connecting-in-node-js
    */
  ssl: false
});
console.log(path.join(__dirname, "init.sql"))
var sql = fs.readFileSync(path.join(__dirname, "user.sql")).toString()
pool.query(sql, function (err, result) {
  if (err) {
    console.log(err)
  }
})
module.exports = {
  query: (text, params) => pool.query(text, params),
  end: () => pool.end(),
};
