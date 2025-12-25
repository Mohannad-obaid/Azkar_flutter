// import 'package:flutter/material.dart';

// // الألوان الموحدة للتطبيق
// const Color primaryGreen = Color(0xFF2E7D32);
// const Color bgLight = Color(0xFFF1F8E9);
// const Color accentGold = Color(0xFFFFC107);

// class AzkarListScreen extends StatelessWidget {
//   final String categoryTitle;

//   const AzkarListScreen({super.key, required this.categoryTitle});

//   @override
//   Widget build(BuildContext context) {
 
//      final List<Map<String, dynamic>> azkarItems = [
//       {'text': 'أَصْبَحْنَا وَأَصْبَحَ المُلْكُ لِلَّهِ وَالحَمْدُ لِلَّهِ...', 'count': 1, 'isDone': true},
//       {'text': 'اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ...', 'count': 1, 'isDone': false},
//       {'text': 'بِسْمِ اللهِ الَّذِي لاَ يَضُرُّ مَعَ اسْمِهِ شَيْءٌ...', 'count': 3, 'isDone': false},
//       {'text': 'سُبْحَانَ اللهِ وَبِحَمْدِهِ: عَدَدَ خَلْقِهِ، وَرِضَا نَفْسِهِ...', 'count': 3, 'isDone': false},
//     ];

//     return Scaffold(
//       backgroundColor: bgLight,
//       appBar: AppBar(
//         title: Text(categoryTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: primaryGreen,
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // إحصائية سريعة بالأعلى
//           _buildProgressHeader(azkarItems),
          
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(12),
//               itemCount: azkarItems.length,
//               itemBuilder: (context, index) {
//                 return _buildAzkarCard(context,azkarItems[index]);
//               },
//             ),
//           ),
//         ],
//       ),      
//     );
//   }

//   Widget _buildProgressHeader(List list) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text('الأذكار المنجزة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//           Text('1 من ${list.length}', style: const TextStyle(color: primaryGreen, fontWeight: FontWeight.bold, fontSize: 18)),
//         ],
//       ),
//     );
//   }

//   Widget _buildAzkarCard(BuildContext context, Map<String, dynamic> item) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.only(bottom: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         title: Text(
//           item['text'],
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(fontSize: 16, height: 1.5),
//         ),
//         subtitle: Padding(
//           padding: const EdgeInsets.only(top: 8.0),
//           child: Row(
//             children: [
//               const Icon(Icons.repeat, size: 16, color: Colors.grey),
//               const SizedBox(width: 5),
//               Text('التكرار: ${item['count']}'),
//             ],
//           ),
//         ),
//         trailing: item['isDone'] 
//           ? const Icon(Icons.check_circle, color: primaryGreen, size: 30)
//           : const Icon(Icons.circle_outlined, color: Colors.grey, size: 30),
//         onTap: () {
//           Navigator.pushNamed(context, '/tasbeehScreen');
//         },
//       ),
//     );
//   }
// }