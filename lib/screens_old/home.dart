import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryGreen = Color(0xFF388E3C);
const Color backgroundLightGreen = Color(0xFFE8F5E9);
const Color accentGold = Color(0xFFFFC107);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreen,
        title: Text(
          'أذكار المسلم',
          style: GoogleFonts.amiri(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_sharp, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _cardWelcomHome(
            'مساء الخير، لنبدأ بالذكر!',
            'اللهم اجعلني من التوابين واجعلني من المتطهرين',
            0.6,
          ),

          // prayerAndAyahCard(
          //   ayah: '﴿أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ﴾',
          //   surah: 'سورة الرعد - آية 28',
          //   nextPrayerName: 'صلاة المغرب',
          //   nextPrayerTime: '5:32 م',
          //   remainingTime: '00:18 دقيقة',
          // ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _quickAccessButtons(
                  Icons.wb_sunny,
                  'أذكار الصباح',
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _quickAccessButtons(
                  Icons.nights_stay,
                  'أذكار المساء',
                  Colors.indigo,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(height: 20),
          Text(
            'قوائم الأذكار الأخرى ',
            style: GoogleFonts.cabin(
              fontSize: 22,
              color: primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.bedtime, color: primaryGreen),
            title: const Text('أذكار النوم'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.explore, color: primaryGreen),
            title: const Text('أذكار السفر'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.mosque, color: primaryGreen),
            title: const Text('أذكار الصلاة'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, '/categoryContentScreen');
            },
          ),
          const Divider(height: 1),
          // اذكار النوم
          ListTile(
            leading: const Icon(Icons.bedtime, color: primaryGreen),
            title: const Text('أذكار النوم'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(height: 1),
          // أذكار الصباح
          ListTile(
            leading: const Icon(Icons.wb_sunny, color: primaryGreen),
            title: const Text('أذكار الصباح'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _cardWelcomHome(String welcom, String zkar, double progress) {
  return Card(
    elevation: 4,
    color: backgroundLightGreen,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            welcom,
            style: GoogleFonts.amiri(
              fontSize: 23,
              color: primaryGreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            zkar,
            style: GoogleFonts.amiri(
              height: 2,
              fontSize: 16,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w100,
            ),
          ),
          Divider(height: 30),

          Row(
            children: [
              SizedBox(
                height: 45,
                width: 45,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey.shade300,
                  value: 0.6,
                  strokeWidth: 5,
                  valueColor: const AlwaysStoppedAnimation<Color>(accentGold),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                children: [
                  Text(
                    'إنجاز الورد اليومي',
                    style: TextStyle(fontSize: 16, color: primaryGreen),
                  ),
                  Text(
                    '${(progress * 100).toInt()}% مكتمل',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: accentGold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _quickAccessButtons(IconData icon, String title, Color color) {
  return Card(
    color: color,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}

// Widget prayerAndAyahCard({
//   required String ayah,
//   required String surah,
//   required String nextPrayerName,
//   required String nextPrayerTime,
//   required String remainingTime,
// }) {
//   return Card(
//     elevation: 4,
//     color: backgroundLightGreen,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//     child: Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // الآية
//           Center(
//             child: Text(
//               ayah,
//               style: GoogleFonts.amiri(
//                 fontSize: 20,
//                 height: 2,
//                 color: primaryGreen,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 6),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               surah,
//               style: GoogleFonts.amiri(
//                 fontSize: 14,
//                 color: Colors.grey.shade600,
//               ),
//             ),
//           ),

//           const Divider(height: 30),

//           /// الصلاة القادمة
//           Row(
//             children: [
//               const Icon(Icons.access_time, color: primaryGreen, size: 28),
//               const SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'الصلاة القادمة',
//                     style: GoogleFonts.amiri(
//                       fontSize: 16,
//                       color: Colors.grey.shade700,
//                     ),
//                   ),
//                   Text(
//                     nextPrayerName,
//                     style: GoogleFonts.amiri(
//                       fontSize: 22,
//                       color: primaryGreen,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               Text(
//                 nextPrayerTime,
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: accentGold,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 15),

//           /// الوقت المتبقي
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Center(
//               child: Text(
//                 'متبقي $remainingTime',
//                 style: GoogleFonts.amiri(
//                   fontSize: 18,
//                   color: primaryGreen,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
