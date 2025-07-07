import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberOfAdultsInput extends StatelessWidget {
  final String initialValue;
  final Function(String) onChanged;

  const NumberOfAdultsInput({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Number of Adults",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter number of adults",
            ),
            onChanged: onChanged,
            controller: TextEditingController(text: initialValue),
          ),
        ),
      ],
    );
  }
}
