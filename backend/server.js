import express from "express";
import mongoose from "mongoose";
import cors from "cors";
import dotenv from "dotenv";

import banquetRoutes from "./routes/banquetRoutes.js"; 

dotenv.config(); 

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.get("/", (req, res) => {
  res.send("Api route is working");
});

app.use("/api/banquets", banquetRoutes);

// DB & Server startup
mongoose
  .connect(process.env.MONGO_URI)
  .then(() => {
    app.listen(process.env.PORT || 5000, () => {
      console.log("Server running and DB connected to port 5000");
    });
  })
  .catch((err) => console.error("MongoDB connection error:", err));
