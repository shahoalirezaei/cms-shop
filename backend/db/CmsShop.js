const mysql = require("mysql2");
const util = require("util");

let CmsShopDB = null;

function getConnection() {
  if (!CmsShopDB) {
    CmsShopDB = mysql.createConnection({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DATABASE,
      port: process.env.DB_PORT,
      ssl: {
        rejectUnauthorized: false
      },
      charset: 'utf8mb4',
      connectTimeout: 60000
    });

    // تبدیل متد query به Promise-based
    CmsShopDB.query = util.promisify(CmsShopDB.query);

    // Handle connection errors
    CmsShopDB.on('error', function(err) {
      console.log('Database connection error:', err);
      CmsShopDB = null; // Reset connection on error
    });
  }
  return CmsShopDB;
}

module.exports = { 
  query: (sql, params) => {
    const connection = getConnection();
    return connection.query(sql, params);
  },
  end: () => {
    if (CmsShopDB) {
      CmsShopDB.end();
      CmsShopDB = null;
    }
  }
};



// const mysql = require("mysql");

// const CmsShopDB = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "",
//   database: "cms_store",
// });

// module.exports = CmsShopDB;
