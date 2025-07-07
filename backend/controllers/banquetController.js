import BanquetRequest from "../models/BanquetRequest.js";

const submitBanquetRequest = async (req, res) => {
  try {
    const {
      eventType,
      country,
      state,
      city,
      eventDates,
      numberOfAdults,
      cateringPreference,
      cuisineType,
      budget,
      getOfferWithin,
    } = req.body;

    if (
      !eventType ||
      !country ||
      !state ||
      !city ||
      !Array.isArray(eventDates) ||
      eventDates.length === 0 ||
      !numberOfAdults ||
      !cateringPreference ||
      !cuisineType ||
      !budget ||
      !budget.currency ||
      !budget.amount
    ) {
      return res
        .status(400)
        .json({ message: "Please fill in all required fields." });
    }

    const newRequest = new BanquetRequest({
      eventType,
      country,
      state,
      city,
      eventDates,
      numberOfAdults,
      cateringPreference,
      cuisineType,
      budget,
      getOfferWithin,
    });

    await newRequest.save();

    res.status(201).json({ message: "Request submitted successfully!" });
  } catch (error) {
    console.error("Submit Banquet Request Error:", error);
    res.status(500).json({ message: "Server error. Please try again later." });
  }
};

export { submitBanquetRequest };
