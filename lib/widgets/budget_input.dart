import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class BudgetInput extends StatefulWidget {
  final Function(String currency, String amount) onBudgetChanged;

  const BudgetInput({super.key, required this.onBudgetChanged});

  @override
  State<BudgetInput> createState() => _BudgetInputState();
}

class _BudgetInputState extends State<BudgetInput> {
  String selectedCurrency = 'INR';
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  void _onAmountChanged(String value) {
    widget.onBudgetChanged(selectedCurrency, value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Budget",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    hintText: "Enter amount",
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: _onAmountChanged,
                ),
              ),

              const SizedBox(width: 10),

              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  value: selectedCurrency,
                  isDense: true,
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    height: 40,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    offset: const Offset(0,-12), 
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                  items: ['INR', 'USD'].map((currency) {
                    return DropdownMenuItem(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedCurrency = value;
                      });
                      widget.onBudgetChanged(
                        selectedCurrency,
                        amountController.text,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
