import 'package:flutter/material.dart';
import 'package:booking_app/services/banquet_api_service.dart';
import 'package:booking_app/widgets/get_offer_input.dart';

class FinalActionsSection extends StatelessWidget {
  final TextEditingController getOfferController;
  final Map<String, dynamic> banquetData;
  final VoidCallback onSuccess;

  const FinalActionsSection({
    super.key,
    required this.getOfferController,
    required this.banquetData,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetOfferInput(controller: getOfferController),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Color(0xFF4A90E2), Color(0xFF007AFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ElevatedButton(
            onPressed: () async {
              final isValid =
                  banquetData["numberOfAdults"] > 0 &&
                  (banquetData["eventDates"] as List).isNotEmpty &&
                  banquetData["city"] != null &&
                  banquetData["cuisineType"] != null &&
                  banquetData["budget"]["amount"] > 0 &&
                  (banquetData["cateringPreference"]["veg"] ||
                      banquetData["cateringPreference"]["nonVeg"]) &&
                  getOfferController.text.trim().isNotEmpty;

              if (!isValid) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please fill all the required fields"),
                  ),
                );
                return;
              }

              final success = await BanquetApiService.submitBanquetRequest(
                banquetData,
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    success
                        ? "Request submitted successfully"
                        : "Failed to submit request",
                  ),
                ),
              );

              if (success) onSuccess();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Submit Request",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
