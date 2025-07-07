import express from "express";
import { submitBanquetRequest } from "../controllers/banquetController.js";

const router = express.Router();


router.post("/request", submitBanquetRequest);

export default router;
