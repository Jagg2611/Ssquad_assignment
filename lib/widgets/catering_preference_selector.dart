import 'package:flutter/material.dart';

class CateringPreferenceSelector extends StatelessWidget {
  final bool isVegSelected;
  final bool isNonVegSelected;
  final Function(bool) onVegChanged;
  final Function(bool) onNonVegChanged;

  const CateringPreferenceSelector({
    super.key,
    required this.isVegSelected,
    required this.isNonVegSelected,
    required this.onVegChanged,
    required this.onNonVegChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Catering Preference",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 🟢 Veg Box
            Expanded(
              child: GestureDetector(
                onTap: () => onVegChanged(!isVegSelected),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 6,
                  ),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isVegSelected
                          ? Colors.green
                          : Colors.grey.shade300,
                      width: isVegSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isVegSelected,
                        onChanged: (val) => onVegChanged(val!),
                      ),
                      const SizedBox(width: 6),
                      Image.asset(
                        'assets/images/green_dot.jpeg',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 10),
                      const Text("Veg"),
                    ],
                  ),
                ),
              ),
            ),

            // 🔴 Non-Veg Box
            Expanded(
              child: GestureDetector(
                onTap: () => onNonVegChanged(!isNonVegSelected),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 6,
                  ),
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isNonVegSelected
                          ? Colors.red
                          : Colors.grey.shade300,
                      width: isNonVegSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isNonVegSelected,
                        onChanged: (val) => onNonVegChanged(val!),
                      ),
                      const SizedBox(width: 6),
                      Image.asset(
                        'assets/images/red_dot.png',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 10),
                      const Text("Non-Veg"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
