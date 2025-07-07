import 'package:booking_app/widgets/header_section.dart';
import 'package:booking_app/widgets/category_card.dart'; 
import 'package:flutter/material.dart';
import 'package:booking_app/screens/banquets_and_venues_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 178, 178),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderSection(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            CategoryCard(
              imagePath: 'assets/images/travel_banner.jpeg',
              icon: Icons.hotel,
              title: 'Travel & Stay',
              onTap: () {
                
              },
            ),
            CategoryCard(
              imagePath: 'assets/images/banquet_banner.jpeg',
              icon: Icons
                  .celebration,
              title: 'Banquets & Venues',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const BanquetsAndVenuesScreen(), 
                  ),
                );
              },
            ),
            CategoryCard(
              imagePath: 'assets/images/retail_banner.jpeg',
              icon: Icons.storefront, 
              title: 'Retail Stores',
              onTap: () {
                // Navigate to Retail screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
