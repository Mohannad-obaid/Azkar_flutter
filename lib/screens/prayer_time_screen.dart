import 'package:flutter/material.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFFFBFBFB),
        elevation: 0,
        leading: Card(
            margin: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(21),
            ),
            color: Colors.white,
          child: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text(
          "مواقيت الصلاة",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            width: 55,
            height: 55,
            child: Card(
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              color: Colors.white,
            child: const Icon(Icons.location_on, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          const Text(
            "الرياض، المملكة العربية السعودية ✎",
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const Text(
            "15 رمضان 1445 هـ | 25 مارس 2024",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildPrayerCard(
                  "صلاة الفجر",
                  "04:52 ص",
                  Icons.wb_twilight,
                  false,
                  isPast: true,
                ),
                _buildPrayerCard(
                  "صلاة الظهر",
                  "12:05 م",
                  Icons.wb_sunny_outlined,
                  false,
                  isPast: true,
                ),
                _buildActivePrayerCard(), // الكارت الأخضر المميز
                _buildPrayerCard(
                  "صلاة المغرب",
                  "06:15 م",
                  Icons.wb_sunny,
                  true,
                ),
                _buildPrayerCard(
                  "صلاة العشاء",
                  "07:45 م",
                  Icons.nightlight_round,
                  true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// كارت الصلاة العادي
Widget _buildPrayerCard(
  String title,
  String time,
  IconData icon,
  bool isSwitchOn, {
  bool isPast = false,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
      ],
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFF5F5F5),
          child: Icon(icon, color: isPast ? Colors.grey : Colors.orange),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isPast ? Colors.grey : Colors.black,
              ),
            ),
            Text(time, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const Spacer(),
        Switch(
          value: isSwitchOn,
          onChanged: (v) {
          },
          activeThumbColor: Colors.green,
        ),
      ],
    ),
  );
}

// كارت الصلاة القادمة (الأخضر)
Widget _buildActivePrayerCard() {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFF00E676), Color(0xFF00C853)],
      ),
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.green.withOpacity(0.3),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
          backgroundColor: const Color(0xFF47EB7E),
          child: Icon(Icons.access_time_filled, color:  Colors.black54),
        ),
        SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "الصلاة القادمة",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
                Text(
                  "صلاة العصر",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xFF17D255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Text("نشط "),
                  Icon(Icons.notifications, size: 16),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "03:45 م",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("الوقت المتبقي", style: TextStyle(color: Colors.black54, fontSize: 12)),
                Text(
                  "00:30:15",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
