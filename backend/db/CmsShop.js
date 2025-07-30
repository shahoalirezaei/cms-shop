const mysql = require("mysql2");
const util = require("util");

const CmsShopDB = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DATABASE,
  port: process.env.DB_PORT,
  ssl: {
    rejectUnauthorized: false
  },
  charset: 'utf8mb4',
  connectTimeout: 60000,
  acquireTimeout: 60000,
  timeout: 60000
});

// تبدیل متد query به Promise-based
CmsShopDB.query = util.promisify(CmsShopDB.query);

// Handle connection errors
CmsShopDB.on('error', function(err) {
  console.log('Database connection error:', err);
  if(err.code === 'PROTOCOL_CONNECTION_LOST') {
    console.log('Database connection was closed.');
  }
  if(err.code === 'ER_CON_COUNT_ERROR') {
    console.log('Database has too many connections.');
  }
  if(err.code === 'ECONNREFUSED') {
    console.log('Database connection was refused.');
  }
});

module.exports = CmsShopDB;



// const mysql = require("mysql");

// const CmsShopDB = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "",
//   database: "cms_store",
// });

// module.exports = CmsShopDB;
