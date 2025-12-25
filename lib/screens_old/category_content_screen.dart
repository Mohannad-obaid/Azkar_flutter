import 'package:flutter/material.dart';

const Color primaryGreen = Color(0xFF388E3C);
const Color backgroundLightGreen = Color(0xFFE8F5E9);
const Color accentGold = Color(0xFFFFC107);

class CategoryContentScreen extends StatefulWidget {
  const CategoryContentScreen({super.key});

  @override
  State<CategoryContentScreen> createState() => _CategoryContentScreenState();
}

class _CategoryContentScreenState extends State<CategoryContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('أذكار الصباح')),
      body: Center(
        child: categoryContentCard(context, (){}, 'أذكار الصباح', 'عدد الأذكار: 15', 0.4),
      ),
    );
  }
}

Widget categoryContentCard(BuildContext context,VoidCallback onPressedd, String title, String subtitle, double progress) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressedd,
            icon: Icon(Icons.logo_dev, size: 40, color: primaryGreen),
          ),
        ],
      ),
    ),
  );
}
