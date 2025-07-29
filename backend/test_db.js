// Test Database Connection
require("dotenv").config();
const CmsShopDB = require("./db/CmsShop");

async function testConnection() {
  try {
    console.log("🔍 Testing database connection...");
    
    // Test connection
    await CmsShopDB.query("SELECT 1");
    console.log("✅ Database connection successful!");
    
    // Test tables exist
    console.log("\n📋 Checking tables...");
    const tables = await CmsShopDB.query("SHOW TABLES");
    console.log("Tables found:", tables.length);
    tables.forEach(table => {
      console.log("- " + Object.values(table)[0]);
    });
    
    // Test data in categories
    console.log("\n📊 Testing data in categories...");
    const categories = await CmsShopDB.query("SELECT * FROM categories LIMIT 3");
    console.log("Categories:", categories);
    
    // Test data in products
    console.log("\n📱 Testing data in products...");
    const products = await CmsShopDB.query("SELECT id, title, price FROM products LIMIT 3");
    console.log("Products:", products);
    
    console.log("\n🎉 All tests passed! Database is ready!");
    
  } catch (error) {
    console.error("❌ Database test failed:", error.message);
  } finally {
    CmsShopDB.end();
  }
}

testConnection();