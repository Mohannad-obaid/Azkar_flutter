import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({super.key});

  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  padding: const EdgeInsets.only(top: 30, left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'السلام عليكم',
                            style: GoogleFonts.notoSansArabic(
                              //Noto Sans Arabic
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '15 رمضان 1445 هـ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.notifications_none),
                          onPressed: () {
                            // Handle notification icon press
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                _cardTodaysTalk(),
                const SizedBox(height: 5),

                _cardPrayerTimes('ال', 'صلاة الفجر', DateTime.now()),
                SizedBox(height: 25),
                Text(
                  ' الأذكار اليومية',
                  style: GoogleFonts.notoSansArabic(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2,
                  ),
                ),
                const SizedBox(height: 15),
                // _cardAzkarCategory('أذكار الصباح', Icons.wb_sunny),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _cardAzkarCategory('أذكار الصباح', Icons.wb_sunny);
                  },
                ),
                SizedBox(height: 25),
                Text(
                  'أقسـام أخـرى',
                  style: GoogleFonts.notoSansArabic(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF6B7280),
                  ),
                ),
                const SizedBox(height: 15),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _cardAzkarCategory(
                      'أذكار المساء',
                      Icons.nights_stay,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1ED760), // لون النص الأخضر
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        currentIndex: 0, // مثال: اختيار "الرئيسية"
        items: [
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(Icons.home),
            icon: const Icon(Icons.home),
            label: "الرئيسية",
          ),
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(Icons.favorite),
            icon: Icon(Icons.favorite),
            label: "المفضلة",
          ),
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(Icons.circle),
            icon: const Icon(Icons.circle),
            label: "السبحة",
          ),
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(Icons.settings),
            icon: const Icon(Icons.settings),
            label: "الإعدادات",
          ),
        ],
      ),
    );
  }
}

// كارد ل عرض مواقيت الصلاة باستخدام listTitel
Widget _cardPrayerTimes(String title, String subTitel, DateTime time) {
  return SizedBox(
    height: 66,
    width: double.infinity,
    child: Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Color(0xFFF3F4F6),
      child: ListTile(
        title: Text(
          'الصلاة القادمة',
          style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
        ),
        subtitle: Text(
          subTitel,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: SizedBox(
          height: 40,
          width: 40,
          child: CircleAvatar(
            backgroundColor: Color(0xFFE8FCEF),
            child: Icon(Icons.timelapse_outlined, color: Color(0xFF19E65E)),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              width: 85,
              child: Card(
                color: Color(0xFFF8F9FA),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${time.hour}:${time.minute} م',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF19E65E),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _cardTodaysTalk() {
  return Card(
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    shadowColor: Color(0xFFF3F4F6),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 30, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny, size: 16, color: Color(0xFFD4AF37)),
              SizedBox(width: 5),
              Text(
                'حديث اليوم',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4AF37),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            '"أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ"',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'سورة الرعد آية 28',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
          ),
          SizedBox(height: 28),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'قراءة التفسير',
                style: TextStyle(fontSize: 14, color: Color(0xFF19E65E)),
              ),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward, size: 15, color: Color(0xFF19E65E)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _cardAzkarCategory(String title, IconData iconData) {
  return SizedBox(
    height: 130,
    width: 130,
    child: Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Color(0xFFF3F4F6),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFFE8FCEF),
              child: Icon(iconData, color: Color(0xFF19E65E), size: 30),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildActiveIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    decoration: BoxDecoration(
      color: const Color(0xFFE8F9F1), // اللون الأخضر الفاتح جداً في الخلفية
      borderRadius: BorderRadius.circular(25), // لجعل الحواف بيضاوية تماماً
    ),
    child: Icon(
      icon,
      color: const Color(0xFF1ED760), // اللون الأخضر القوي للأيقونة
      size: 28,
    ),
  );
}
