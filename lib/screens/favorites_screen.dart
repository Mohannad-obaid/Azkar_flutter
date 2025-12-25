import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8F6), //#F6F8F6
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F8F6),
        elevation: 0,
        leading: _backgroundArrow(
          Icon(Icons.arrow_back, color: Colors.black87),
          Colors.white,
          30,
        ),
        title: Text(
          'المفضلة',
          style: GoogleFonts.notoSansArabic(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _continerZaker(
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
                        style: GoogleFonts.notoSansArabic(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite),
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  _backgroundCount(
                    Text(
                      '33 مرة',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF0BB544),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Color(0xFFE7FCEE),
                    12,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Spacer(),
            _backgroundCount(
              Text(
                'اضافة ذكر جديد +',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Color(0xFF0FE656),
              16,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _continerZaker(Widget child, {bool isDone = false}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
      ],
      border: isDone
          ? Border.all(color: Colors.green, width: 1) // إذا كان true
          : null,
    ),
    child: child,
  );
}

Widget _backgroundCount(Widget child, Color bgColor, double radius) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: bgColor == Colors.white ? Color(0xFFF3F4F6) : bgColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: child,
  );
}

Widget _backgroundArrow(Widget child, Color bgColor, double radius) {
  return Container(
    // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: bgColor == Colors.white ? Color(0xFFF3F4F6) : bgColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: child,
  );
}
