const CmsShopDB = require('./db/CmsShop');
const fs = require('fs');

const sqlScript = fs.readFileSync('cms_store.sql', 'utf8');

(async () => {
  try {
    await CmsShopDB.query(sqlScript);
    console.log('Database initialized successfully');
  } catch (err) {
    console.error('Error initializing database:', err);
    throw err;
  } finally {
    CmsShopDB.end(); // بستن اتصال (اختیاری، بسته به نیازت)
  }
})();