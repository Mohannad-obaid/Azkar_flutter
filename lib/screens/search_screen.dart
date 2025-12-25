import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzkarSearchScreen extends StatelessWidget {
  const AzkarSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA), // لون خلفية مريح
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "بحث الأذكار",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          SizedBox(height: 0),
          _buildCategoriesBar(),
          SizedBox(height: 0),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildSearchResults(
                  'أذكار الصباح',
                  "اللَّهُمَّ أَنْتَ رَبِّي لا إِلَهَ إِلَّا أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ بِذَنْبِي، فَاغْفِرْ لِي، فَإِنَّهُ لا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ.",
                  Icons.wb_sunny,
                  Color(0xFFFFF3CD),
                  Color(0xFF856404),
                ),
                SizedBox(height: 16),
                _buildSearchResults(
                  'أذكار المساء',
                  "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ. قُلْ هُوَ اللَّهُ أَحَدٌ. اللَّهُ الصَّمَدُ. لَمْ يَلِدْ وَلَمْ يُولَدْ. وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ.",
                  Icons.nightlight_round,
                  Color(0xFFD1E7DD),
                  Color(0xFF0F5132),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "ابحث عن ذكر، دعاء، آية...",
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesBar() {
    // قائمة الفئات المتاحة
    List<String> categories = ["الكل", "الصباح", "المساء", "الصلاة"];
    int selectedIndex = 0; // تحديد العنصر النشط حالياً

    return Container(
      height: 50, // تحديد ارتفاع الشريط
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // جعل التمرير عرضياً
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          bool isSelected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(left: 8.0), // مسافة بين العناصر
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: isSelected,
              onSelected: (selected) {
                // هنا يمكنك تحديث الحالة لتغيير العنصر النشط
                if (selected) {
                  selectedIndex = index;
                  // تحديث الواجهة لإظهار التغيير
                  (context as Element).markNeedsBuild();
                }
              },
              // تنسيق اللون عند الاختيار وعدم الاختيار
              selectedColor: Color(0xFF4CAF50),
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey.shade200),
              ),
              showCheckmark: false, // لإخفاء علامة الـ (صح) التي تظهر افتراضياً
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchResults(
    String category,
    String azkarText,
    IconData icon,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTimeTile(icon, bgColor, iconColor),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      category,
                      style: GoogleFonts.notoSansArabic(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF618972),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      azkarText,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0D1B12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.grey,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(color: Colors.grey.shade300, height: 1),
          SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _backgroundCount(
                Text('33 مرة ', style: TextStyle(color: Colors.black)),
                Color(0xFFF3F4F6),
                15,
                false,
                false,
              ),
              Spacer(),

              SizedBox(
                width: 35,
                height: 35,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, size: 14, color: Colors.green),
                ),
              ),

              SizedBox(width: 8),
              _backgroundCount(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.fingerprint, size: 15, color: Color(0xFF166534)),
                    SizedBox(width: 4),
                    Text(
                      'تسبيح',
                      style: TextStyle(color: Color(0xFF166534), fontSize: 14),
                    ),
                  ],
                ),
                Color(0xFFF3F4F6),
                15,
                false,
                true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeTile(IconData icon, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: iconColor),
    );
  }

  Widget _backgroundCount(
    Widget child,
    Color bgColor,
    double radius,
    bool isBorder,
    bool tasbeeh,
  ) {
    return Container(
      // width: 70,
      // height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: tasbeeh == true ? Color(0xFFE7FDF0) : bgColor, //#E7FDF0
        borderRadius: BorderRadius.circular(radius),
        border: isBorder
            ? Border.all(color: Colors.green, width: 1) // إذا كان true
            : null,
      ),
      child: child,
    );
  }
}
