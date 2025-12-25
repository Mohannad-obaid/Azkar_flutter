import 'package:flutter/material.dart';

const Color primaryGreen = Color(0xFF388E3C);
const Color backgroundLightGreen = Color(0xFFE8F5E9);
const Color accentGold = Color(0xFFFFC107);

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    // نسبة إنجاز تجريبية (يجب ربطها ببيانات التطبيق الحقيقية)
    const double dailyProgress = 0.65; // 65% إنجاز

    return Scaffold(
      backgroundColor: backgroundLightGreen,
      appBar: AppBar(
        title: const Text(
          'أذكار المسلم',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryGreen,
        // أزرار التنقل (البحث والإعدادات)
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // توجيه لصفحة الإعدادات
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          // --- أ. لوحة الترحيب ومؤشر الإنجاز ---
          _buildWelcomeCard(dailyProgress),
          const SizedBox(height: 20),

          // --- ب. أزرار الوصول السريع (الصباح والمساء) ---
          _buildQuickAccessButtons(context),
          const SizedBox(height: 20),

          // --- ج. قوائم الأذكار الأخرى ---
          _buildAzkarList(),
        ],
      ),
    );
  }

  // ودجت (Widget) لوحة الترحيب ومؤشر الإنجاز
  Widget _buildWelcomeCard(double progress) {
    return Card(
      color: backgroundLightGreen,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أهلاً بك، لنبدأ بالذكر!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryGreen,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'الطمأنينة في القلوب',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const Divider(height: 30),

            // مؤشر التقدم اليومي
            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 5,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(accentGold),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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

  // ودجت (Widget) أزرار الوصول السريع
  Widget _buildQuickAccessButtons(BuildContext context) {
    return Row(
      children: [
        // بطاقة أذكار الصباح
        Expanded(
          child: _buildQuickActionButton(
            context,
            'أذكار الصباح',
            Icons.wb_sunny,
            primaryGreen,
            () {
              // توجيه لصفحة أذكار الصباح
            },
          ),
        ),
        const SizedBox(width: 15),
        // بطاقة أذكار المساء
        Expanded(
          child: _buildQuickActionButton(
            context,
            'أذكار المساء',
            Icons.nights_stay,
            const Color(0xFF424242), // لون داكن للمساء
            () {
              // توجيه لصفحة أذكار المساء
            },
          ),
        ),
      ],
    );
  }

  // ودجت (Widget) لتصميم زر الوصول السريع
  Widget _buildQuickActionButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Card(
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
      ),
    );
  }

  // ودجت (Widget) قوائم الأذكار الأخرى
  Widget _buildAzkarList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'قوائم الأذكار الأخرى',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryGreen,
          ),
        ),
        const SizedBox(height: 10),
        // مثال لبعض الأذكار الأخرى (يمكن استخدام ListView.builder أو GridView.count لتوليدها)
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
          onTap: () {},
        ),
      ],
    );
  }
}
