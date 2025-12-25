import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'أذكار المسلم',
          style: GoogleFonts.amiri(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE8F5E9), // Very Light Green
              Color(0xFFC8E6C9), // Pastel Green
              Color(0xFFA5D6A7), // Medium Pastel Green
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(flex: 1),
            Text(
              'سبحان الله و بحمده',
              style: GoogleFonts.amiri(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFF388E3C),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(' التسبيحات : 100', style: GoogleFonts.amiri()),
            Spacer(flex: 1),
            SizedBox(
              width: 170,
              height: 170,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: 0.6,
                    color: Colors.amber,
                    strokeWidth: 6,
                    backgroundColor: Colors.white,
                  ),

                  Center(
                    child: Text(
                      '5',
                      style: const TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // لاستخدام HapticFeedback
//
// // الألوان المعتمدة
// const Color primaryGreen = Color(0xFF388E3C);
// const Color backgroundLightGreen = Color(0xFFE8F5E9);
// const Color accentGold = Color(0xFFFFC107);
//
// class TasbeehScreen extends StatefulWidget {
//   const TasbeehScreen({super.key});
//
//   @override
//   State<TasbeehScreen> createState() => _TasbeehScreenState();
// }
//
// class _TasbeehScreenState extends State<TasbeehScreen> {
//   int _currentCount = 0;
//   final int _totalCount = 100; // الهدف: 100 تسبيحة
//
//   // حساب النسبة المئوية
//   double get _progress {
//     if (_currentCount >= _totalCount) {
//       return 1.0;
//     }
//     return _currentCount / _totalCount;
//   }
//
//   // دالة العد عند النقر
//   void _incrementCounter() {
//     if (_currentCount < _totalCount) {
//       setState(() {
//         _currentCount++;
//       });
//       // تفعيل الاهتزاز الخفيف
//       HapticFeedback.lightImpact();
//     } else {
//       // إظهار رسالة عند اكتمال الهدف
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('ما شاء الله! لقد أكملت 100 تسبيحة.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }
//
//   // دالة إعادة التعيين
//   void _resetCounter() {
//     setState(() {
//       _currentCount = 0;
//     });
//     HapticFeedback.mediumImpact();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundLightGreen, // الخلفية الخضراء الفاتحة
//       appBar: AppBar(
//         title: const Text(
//           'أذكار الصباح',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: primaryGreen, // شريط العنوان الأخضر الداكن
//         actions: [
//           // زر إعادة التعيين
//           IconButton(
//             icon: const Icon(Icons.refresh, color: Colors.white),
//             onPressed: _resetCounter,
//             tooltip: 'إعادة التعيين',
//           ),
//         ],
//       ),
//       // استخدام ودجت InkWell لجعل الشاشة قابلة للنقر
//       body: InkWell(
//         onTap: _incrementCounter,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // نص الذكر الفعلي (كبير وواضح)
//               const Padding(
//                 padding: EdgeInsets.all(32.0),
//                 child: Text(
//                   'سبحان الله وبحمده سبحان الله العظيم',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'ArabicType', // استخدم خط عربي كبير وواضح هنا
//                     fontSize: 32,
//                     color: primaryGreen,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 50),
//
//               // *****************************************
//               // منطقة العداد الدائري (Progress Ring)
//               // *****************************************
//               SizedBox(
//                 width: 200,
//                 height: 200,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     // العداد الدائري المتحرك (الذهب)
//                     // يتم تطبيق الأنيميشن تلقائياً مع تحديث الـ progress
//                     CircularProgressIndicator(
//                       value: _progress,
//                       strokeWidth: 15,
//                       backgroundColor:
//                           Colors.grey.shade300, // لون الدائرة الخلفية
//                       valueColor: const AlwaysStoppedAnimation<Color>(
//                         accentGold,
//                       ),
//                     ),
//
//                     // الرقم في المنتصف
//                     Center(
//                       child: Text(
//                         '$_currentCount',
//                         style: const TextStyle(
//                           fontSize: 72,
//                           fontWeight: FontWeight.w900,
//                           color: primaryGreen,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               // *****************************************
//               const SizedBox(height: 50),
//               // عدد التسبيحات المطلوبة
//               Text(
//                 'المطلوب تكراره: $_totalCount مرة',
//                 style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
