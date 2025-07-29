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
  charset: 'utf8mb4'
});

// تبدیل متد query به Promise-based
CmsShopDB.query = util.promisify(CmsShopDB.query);

module.exports = CmsShopDB;



// const mysql = require("mysql");

// const CmsShopDB = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "",
//   database: "cms_store",
// });

// module.exports = CmsShopDB;
