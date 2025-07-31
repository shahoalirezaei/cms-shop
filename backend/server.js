require("dotenv").config();
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const CmsShopDB = require("./db/CmsShop");

// Import routers
const productsRouter = require("./routes/productsRoutes");
const commentsRouter = require("./routes/commentsRoutes");
const usersRouter = require("./routes/usersRoutes");
const ordersRouter = require("./routes/ordersRoutes");
const offsRouter = require("./routes/offsRoutes");
const adminsRouter = require("./routes/adminsRoutes");
const monthlySalesRouter = require("./routes/monthlySalesRoutes");
const categoriesRouter = require("./routes/categoriesRouter");
const authRouter = require("./routes/auth");
const setupRouter = require("./routes/setupDemo");

const app = express();

// List of allowed origins for CORS
const allowedOrigins = [
  'http://localhost:5173',
  'https://stotre-panel-admin.vercel.app'
];

const corsOptions = {
  origin: function (origin, callback) {
    // allow requests with no origin (like Postman)
    if (!origin || allowedOrigins.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error("Not allowed by CORS"));
    }
  },
  credentials: true,
};

app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(express.json());

// Store DB connection in app if needed
app.set("db", CmsShopDB);

// API routes
app.use("/api/products", productsRouter);
app.use("/api/comments", commentsRouter);
app.use("/api/users", usersRouter);
app.use("/api/orders", ordersRouter);
app.use("/api/offs", offsRouter);
app.use("/api/monthly-sales", monthlySalesRouter);
app.use("/api/categories", categoriesRouter);
app.use("/api/setup", setupRouter);
app.use("/api/auth", authRouter);
app.use("/api/admins", adminsRouter);

const PORT = process.env.PORT || 8001;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
