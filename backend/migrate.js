// backend/migrate.js
const fs = require('fs');
const path = require('path');
const mysql = require('mysql');
require('dotenv').config();

async function runMigration() {
  const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,        // معمولاً 48747
    user: process.env.DB_USER,        // root
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
  });

  connection.connect(err => {
    if (err) {
      console.error('❌ DB connection error:', err);
      process.exit(1);
    }
  });

  const sqlFile = path.join(__dirname, 'database', 'cms_store.sql');
  const sql = fs.readFileSync(sqlFile, 'utf8');

  // تقسیم بر ; و اجرای هر قطعه
  const statements = sql
    .split(/;\s*$/m)
    .map(stmt => stmt.trim())
    .filter(stmt => stmt.length);

  for (const stmt of statements) {
    await new Promise((resolve, reject) => {
      connection.query(stmt, (err) => {
        if (err) {
          console.error('❌ Migration error:', err);
          return reject(err);
        }
        resolve();
      });
    });
  }

  console.log('✅ Migration completed successfully.');
  connection.end();
}

runMigration().catch(err => {
  console.error('❌ Migration failed:', err);
  process.exit(1);
});
