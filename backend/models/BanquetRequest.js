import mongoose from "mongoose";

const banquetRequestSchema = new mongoose.Schema({
  eventType: {
    type: String,
    required: true,
  },
  country: {
    type: String,
    required: true,
  },
  state: {
    type: String,
    required: true,
  },
  city: {
    type: String,
    required: true,
  },
  eventDates: {
    type: [Date],
    required: true,
  },
  numberOfAdults: {
    type: Number,
    required: true,
  },
  cateringPreference: {
    veg: { type: Boolean, default: false },
    nonVeg: { type: Boolean, default: false },
  },
  cuisineType: {
    type: String,
    required: true,
  },
  budget: {
    currency: { type: String, enum: ["INR", "USD"], required: true },
    amount: { type: Number, required: true },
  },
  getOfferWithin: {
    type: String, 
    default: "",
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

export default mongoose.model("BanquetRequest", banquetRequestSchema);
