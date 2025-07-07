import 'package:flutter/material.dart';
import 'package:booking_app/data/country_states.dart';
import 'package:booking_app/data/state_cities.dart';
import 'package:booking_app/widgets/cuisine_selector.dart';
import 'package:booking_app/widgets/budget_input.dart';
import 'package:booking_app/widgets/catering_preference_selector.dart';
import 'package:booking_app/widgets/number_of_adults_input.dart';
import 'package:booking_app/widgets/event_dates_selector.dart';
import 'package:booking_app/widgets/location_event_section.dart';
import 'package:booking_app/widgets/final_actions_section.dart';
import 'package:booking_app/widgets/banquet_screen_header.dart';

class BanquetsAndVenuesScreen extends StatefulWidget {
  const BanquetsAndVenuesScreen({super.key});

  @override
  State<BanquetsAndVenuesScreen> createState() =>
      _BanquetsAndVenuesScreenState();
}

class _BanquetsAndVenuesScreenState extends State<BanquetsAndVenuesScreen> {
  final List<String> eventTypes = [
    'Wedding',
    'Birthday',
    'Corporate',
    'Engagement',
  ];
  final List<String> countryList = ['India', 'China', 'Japan', 'Russia'];

  late String selectedEvent;
  late String selectedCountry;
  late String selectedState;
  String? selectedCity;
  String numberOfAdults = '';
  bool isVegSelected = false;
  bool isNonVegSelected = false;
  String? selectedCuisine;
  String selectedCurrency = 'INR';
  String budgetAmount = '';
  final TextEditingController getOfferController = TextEditingController();

  List<String> stateOptions = [];
  List<String> cityOptions = [];
  List<DateTime> selectedDates = [];

  final List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  String formatDateWithSuffix(DateTime date) {
    int day = date.day;
    String suffix;
    if (day >= 11 && day <= 13) {
      suffix = 'th';
    } else {
      switch (day % 10) {
        case 1:
          suffix = 'st';
          break;
        case 2:
          suffix = 'nd';
          break;
        case 3:
          suffix = 'rd';
          break;
        default:
          suffix = 'th';
      }
    }
    String month = monthNames[date.month - 1];
    return "$day$suffix $month ${date.year}";
  }

  @override
  void initState() {
    super.initState();
    _initializeDefaults();
  }

  void _initializeDefaults() {
    selectedEvent = eventTypes.first;
    selectedCountry = countryList.first;
    stateOptions = (countryStates[selectedCountry] ?? [])..sort();
    selectedState = stateOptions.first;
    cityOptions = (stateCities[selectedState] ?? [])..sort();
    selectedCity = cityOptions.isNotEmpty ? cityOptions.first : null;
    numberOfAdults = '';
    isVegSelected = false;
    isNonVegSelected = false;
    selectedCuisine = null;
    selectedCurrency = 'INR';
    budgetAmount = '';
    getOfferController.clear();
    selectedDates.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF007AFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const BanquetScreenHeader(),

                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tell Us Your Venue Requirements",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Location and Event Section
                      LocationEventSection(
                        eventTypes: eventTypes,
                        selectedEvent: selectedEvent,
                        onEventChanged: (val) =>
                            setState(() => selectedEvent = val),
                        countryList: countryList,
                        selectedCountry: selectedCountry,
                        onCountryChanged: (val) {
                          setState(() {
                            selectedCountry = val;
                            stateOptions = (countryStates[val] ?? [])..sort();
                            selectedState = stateOptions.first;
                            cityOptions = (stateCities[selectedState] ?? [])
                              ..sort();
                            selectedCity = cityOptions.isNotEmpty
                                ? cityOptions.first
                                : null;
                          });
                        },
                        stateOptions: stateOptions,
                        selectedState: selectedState,
                        onStateChanged: (val) {
                          setState(() {
                            selectedState = val;
                            cityOptions = (stateCities[selectedState] ?? [])
                              ..sort();
                            selectedCity = cityOptions.isNotEmpty
                                ? cityOptions.first
                                : null;
                          });
                        },
                        cityOptions: cityOptions,
                        selectedCity: selectedCity,
                        onCityChanged: (val) =>
                            setState(() => selectedCity = val),
                      ),

                      
                      EventDatesSelector(
                        selectedDates: selectedDates,
                        onDateAdded: (pickedDate) {
                          setState(() => selectedDates.add(pickedDate));
                        },
                        formatDate: formatDateWithSuffix,
                      ),
                      const SizedBox(height: 20),

                      
                      NumberOfAdultsInput(
                        initialValue: numberOfAdults,
                        onChanged: (value) {
                          setState(() => numberOfAdults = value);
                        },
                      ),
                      const SizedBox(height: 20),

                      CateringPreferenceSelector(
                        isVegSelected: isVegSelected,
                        isNonVegSelected: isNonVegSelected,
                        onVegChanged: (val) =>
                            setState(() => isVegSelected = val),
                        onNonVegChanged: (val) =>
                            setState(() => isNonVegSelected = val),
                      ),
                      const SizedBox(height: 20),

                      CuisineSelector(
                        onCuisineSelected: (selected) =>
                            setState(() => selectedCuisine = selected),
                      ),

                      BudgetInput(
                        onBudgetChanged: (currency, amount) {
                          setState(() {
                            selectedCurrency = currency;
                            budgetAmount = amount;
                          });
                        },
                      ),

                      FinalActionsSection(
                        getOfferController: getOfferController,
                        banquetData: {
                          "eventType": selectedEvent,
                          "country": selectedCountry,
                          "state": selectedState,
                          "city": selectedCity,
                          "eventDates": selectedDates
                              .map((d) => d.toIso8601String().split('T').first)
                              .toList(),
                          "numberOfAdults": int.tryParse(numberOfAdults) ?? 0,
                          "cateringPreference": {
                            "veg": isVegSelected,
                            "nonVeg": isNonVegSelected,
                          },
                          "cuisineType": selectedCuisine,
                          "budget": {
                            "currency": selectedCurrency,
                            "amount": int.tryParse(budgetAmount) ?? 0,
                          },
                          "getOfferWithin": getOfferController.text.trim(),
                        },
                        onSuccess: () {
                          setState(() {
                            _initializeDefaults();
                            numberOfAdults = '';
                            isVegSelected = false;
                            isNonVegSelected = false;
                            selectedCuisine = null;
                            selectedCurrency = 'INR';
                            budgetAmount = '';
                            getOfferController.clear();
                            selectedDates.clear();
                          });
                        },

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
