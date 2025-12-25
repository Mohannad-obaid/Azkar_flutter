import 'package:flutter/material.dart';

class ShareAzkarScreen extends StatelessWidget {
  const ShareAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F9), // لون الخلفية الرمادي الفاتح
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("مشاركة الأذكار", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildMainImageCard(),
              SizedBox(height: 16),
              _buildShareAsImageTile(), 
              SizedBox(height: 16),
              _buildQuickShareCard(), 
              SizedBox(height: 20),
              _buildBottomRewardHint(), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainImageCard() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage('images/background_image_share.png'), // استبدلها بصورتك
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // طبقة تعتيم خفيفة لجعل النص واضحاً
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(alignment: Alignment.topRight, child: Row(
                  children: [
                    Text('ذكر اليوم', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Icon(Icons.format_quote, color: Colors.white),
                  ],
                )),
                Spacer(),
                Text(
                  "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ\nسُبْحَانَ اللَّهِ الْعَظِيمِ",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, height: 1.5),
                ),
                SizedBox(height: 10),
                Container(width: 40, height: 4, color: Colors.greenAccent),
                Spacer(),
                Text("حديث شريف", style: TextStyle(color: Colors.white70, fontSize: 14)),
                Text("تطبيق فسبح", style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareAsImageTile() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
          child: Icon(Icons.image, color: Colors.green),
        ),
        title: Text("مشاركة كبطاقة مصممة", style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_back_ios_new, size: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildQuickShareCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text("مشاركة سريعة", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSocialIcon(Icons.message, "واتساب", Colors.greenAccent),
              _buildSocialIcon(Icons.facebook, "فيسبوك", Colors.blueAccent),
              _buildSocialIcon(Icons.camera_alt, "إنستغرام", Colors.pinkAccent),
              _buildSocialIcon(Icons.chat_bubble, "رسائل", Colors.orangeAccent),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.copy, size: 18),
            label: Text("نسخ النص"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF3F4F6),
              foregroundColor: Colors.black,
              minimumSize: Size(double.infinity, 50),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildBottomRewardHint() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text("✨ الدال على الخير كفاعله", style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
          Text("شارك هذا الذكر مع أصدقائك واكسب الأجر", style: TextStyle(color: Colors.green[700], fontSize: 12)),
        ],
      ),
    );
  }
}