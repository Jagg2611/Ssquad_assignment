import 'package:flutter/material.dart';

class CuisineSelector extends StatefulWidget {
  final Function(String?) onCuisineSelected;

  const CuisineSelector({super.key, required this.onCuisineSelected});

  @override
  State<CuisineSelector> createState() => _CuisineSelectorState();
}

class _CuisineSelectorState extends State<CuisineSelector> {
  String? selectedCuisine;

  final Map<String, String> cuisineOptions = {
    'Indian': 'assets/images/indian.jpeg',
    'Italian': 'assets/images/italian.jpeg',
    'Asian': 'assets/images/asian.jpeg',
    'Mexican': 'assets/images/mexican.jpeg',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Please Select Your Cuisine",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),

        ...cuisineOptions.entries.map((entry) {
          final cuisine = entry.key;
          final imagePath = entry.value;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCuisine = cuisine;
                widget.onCuisineSelected(cuisine);
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: selectedCuisine == cuisine
                      ? Colors.blue
                      : Colors.grey.shade300,
                  width: selectedCuisine == cuisine ? 2 : 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: cuisine,
                    groupValue: selectedCuisine,
                    onChanged: (val) {
                      setState(() {
                        selectedCuisine = val;
                        widget.onCuisineSelected(val);
                      });
                    },
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(cuisine, style: const TextStyle(fontSize: 15)),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imagePath,
                      width: 180,
                      height: 52,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
