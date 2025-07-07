import 'package:flutter/material.dart';
import 'package:booking_app/widgets/custom_dropdown.dart';

class LocationEventSection extends StatelessWidget {
  final List<String> eventTypes;
  final String selectedEvent;
  final ValueChanged<String> onEventChanged;

  final List<String> countryList;
  final String selectedCountry;
  final ValueChanged<String> onCountryChanged;

  final List<String> stateOptions;
  final String selectedState;
  final ValueChanged<String> onStateChanged;

  final List<String> cityOptions;
  final String? selectedCity;
  final ValueChanged<String> onCityChanged;

  const LocationEventSection({
    super.key,
    required this.eventTypes,
    required this.selectedEvent,
    required this.onEventChanged,
    required this.countryList,
    required this.selectedCountry,
    required this.onCountryChanged,
    required this.stateOptions,
    required this.selectedState,
    required this.onStateChanged,
    required this.cityOptions,
    required this.selectedCity,
    required this.onCityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdown(
          label: "Event Type",
          items: eventTypes,
          selectedValue: selectedEvent,
          onChanged: onEventChanged,
        ),
        const SizedBox(height: 20),
        CustomDropdown(
          label: "Country",
          items: countryList,
          selectedValue: selectedCountry,
          onChanged: onCountryChanged,
        ),
        const SizedBox(height: 20),
        CustomDropdown(
          label: "State",
          items: stateOptions,
          selectedValue: selectedState,
          onChanged: onStateChanged,
        ),
        const SizedBox(height: 20),
        if (cityOptions.isNotEmpty)
          Column(
            children: [
              CustomDropdown(
                label: "City",
                items: cityOptions,
                selectedValue: selectedCity ?? '',
                onChanged: onCityChanged,
              ),
              const SizedBox(height: 20),
            ],
          ),
      ],
    );
  }
}
