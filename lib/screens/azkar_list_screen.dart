import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzkarListScreen extends StatefulWidget {
  const AzkarListScreen({super.key});

  @override
  State<AzkarListScreen> createState() => _AzkarListScreenState();
}

class _AzkarListScreenState extends State<AzkarListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBFBFB),
        elevation: 0,
        leading: Card(
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
          color: Colors.white,
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "أذكـار الصبـاح",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(12, 15, 12, 0),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                  ),
                ],
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.1),
                //     blurRadius: 10,
                //   ),
                // ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.wb_twilight,
                        color: Color(0xFF13EC5B),
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'مستوى الإنجاز اليومي',
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D1B12),
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFE7FDEE),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '21/5',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF13EC5B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Color(0xFFF3F4F6),
                    color: Color(0xFF13EC5B),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
            ),
            //SizedBox(height: 10),
            buildAzkarItem(
              'اللّهُ لاَ إِلَـٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لا تَأْخُذُهُ سِنَةٌ وَلا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَن ذَا الَّذِي يَشْفَعُ عِندَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ',
              33,
              'آية الكرسي',
            ),
            SizedBox(height: 15),
            buildAzkarItem2(
              'اللَّهُمَّ أَنْتَ رَبِّي لا إِلَهَ إِلَّا أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَىٰ عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ بِذَنْبِي، فَاغْفِرْ لِي، فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ',
              33,
              'سيد الاستغفار',
              false,
            ),
            SizedBox(height: 15),
            buildAzkarItem2(
              'اللَّهُمَّ إِنِّي أَسْأَلُكَ العَافِيَةَ فِي الدُّنْيَا وَالآخِرَةِ. اللَّهُمَّ إِنِّي أَسْأَلُكَ العَفْوَ وَالعَافِيَةَ فِي دِينِي وَدُنْيَايَ وَأَهْلِي وَمَالِي. اللَّهُمَّ اسْتُرْ عَوْرَاتِي، وَآمِنْ رَوْعَاتِي، اللَّهُمَّ احْفَظْنِي مِنْ بَيْنِ يَدَيَّ، وَمِنْ خَلْفِي، وَعَنْ يَمِينِي، وَعَنْ شِمَالِي، وَمِنْ فَوْقِي، وَأَعُوذُ بِعَظَمَتِكَ أَنْ أُغْتَالَ مِنْ تَحْتِي',
              3,
              'دعاء العافية',
              true,
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildAzkarItem(String azkarText, int repeatCount, String titel) {
  return _continerZaker(
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _backgroundCount(
              Icon(Icons.vaccines_sharp, color: Color(0xFFFFD700)),
              Colors.white,
              10,
              false,
            ),
            Text(
              titel,
              style: GoogleFonts.cairo(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D1B12),
              ),
            ),
            Spacer(),
            Icon(Icons.star, color: Color(0xFFFFD700)),
          ],
        ),
        SizedBox(height: 25),
        Text(
          azkarText,
          style: GoogleFonts.cairo(fontSize: 16, color: Color(0xFF0D1B12)),
        ),
        SizedBox(height: 16),
        Divider(color: Color(0xFFE5E7EB), thickness: 1),
        SizedBox(height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$repeatCount مرة',
              style: GoogleFonts.cairo(fontSize: 15, color: Color(0xFF6B7280)),
            ),
            _backgroundCount(
              Text(
                '  15 / $repeatCount ',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Color(0xFFD0FBDE),
              20,
              true,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _continerZaker(Widget child, {bool isDone = false}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
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

Widget _backgroundCount(
  Widget child,
  Color bgColor,
  double radius,
  bool isBorder,
) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: bgColor == Colors.white ? Color(0xFFF3F4F6) : bgColor,
      borderRadius: BorderRadius.circular(radius),
      border: isBorder
          ? Border.all(color: Colors.green, width: 1) // إذا كان true
          : null,
    ),
    child: child,
  );
}

Widget buildAzkarItem2(
  String azkarText,
  int repeatCount,
  String title,
  bool isDone,
) {
  return Stack(
    alignment: Alignment.center, // لجعل نص "تمت القراءة" في المنتصف
    children: [
      // الطبقة الأولى: محتوى الذكر الأصلي
      AbsorbPointer(
        absorbing: isDone, // يمنع الضغط على الأزرار إذا تمت القراءة
        child: _continerZaker(
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _backgroundCount(
                    const Icon(
                      Icons.wb_sunny_outlined,
                      color: Color(0xFFFFD700),
                    ),
                    Colors.white,
                    10,
                    false,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0D1B12),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.star_border, color: Color(0xFFFFD700)),
                ],
              ),
              const SizedBox(height: 25),

              Opacity(
                opacity: isDone ? 0.2 : 1.0,
                child: Column(
                  children: [
                    Text(
                      azkarText,
                      style: GoogleFonts.cairo(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF0D1B12),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Color(0xFFE5E7EB), thickness: 1),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$repeatCount مرة',
                          style: GoogleFonts.cairo(
                            fontSize: 15,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                        _backgroundCount(
                          Text(
                            ' 15 / $repeatCount ',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDone ? Colors.green : Colors.black,
                            ),
                          ),
                          const Color(0xFFD0FBDE),
                          20,
                          true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          isDone: isDone,
        ),
      ),

      // الطبقة الثانية: نص "تمت القراءة" يظهر فقط عند الانتهاء
      if (isDone)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xFF13EC5B),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle),
              SizedBox(width: 8),
              Text(
                "تمت القراءة ",
                style: GoogleFonts.cairo(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
    ],
  );
}
