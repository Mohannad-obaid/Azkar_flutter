import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  double fontSize = 1.2;
  bool prayerNotification = true;
  bool hapticFeedback = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF6F8F7,
      ), // لون الخلفية الرمادي الفاتح جداً
      appBar: AppBar(
        title: const Text(
          "الإعدادات",
          style: TextStyle(
            color: Color(0xFF1E3A34),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Color(0xFF1E3A34)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 1. كرت الملف الشخصي
            _buildProfileCard(),
            const SizedBox(height: 24),

            // 2. قسم المظهر
            _buildSectionTitle("المظهر"),
            _buildSettingsGroup([
              _buildSwitchTile(
                "الوضع الليلي",
                Icons.dark_mode_outlined,
                const Color(0xFFE8F5F1),
                const Color(0xFF13EC6D),
                isDarkMode,
                (v) => setState(() => isDarkMode = v),
              ),
              _buildFontSizeTile(),
              _buildColorPickerTile(),
            ]),

            const SizedBox(height: 24),

            // 3. قسم التنبيهات
            _buildSectionTitle("التنبيهات والعبادة"),
            _buildSettingsGroup([
              _buildTimeTile(
                "أذكار الصباح",
                "تذكير يومي",
                "05:00 ص",
                Icons.wb_sunny_outlined,
                const Color(0xFFFFF7E6),
                Colors.orange,
              ),
              _buildTimeTile(
                "أذكار المساء",
                "تذكير يومي",
                "06:30 م",
                Icons.nightlight_outlined,
                const Color(0xFFEEF2FF),
                Colors.indigo,
              ),
              _buildSwitchTile(
                "تنبيه بعد الصلاة",
                Icons.mosque_outlined,
                const Color(0xFFE8F5F1),
                const Color(0xFF13EC6D),
                prayerNotification,
                (v) => setState(() => prayerNotification = v),
              ),
            ]),

            const SizedBox(height: 24),

            // 4. قسم عام
            _buildSectionTitle("عام"),
            _buildSettingsGroup([
              _buildNavigationTile(
                "اللغة",
                "العربية",
                Icons.language_outlined,
                const Color(0xFFF2F4F7),
              ),
              _buildSwitchTile(
                "الاهتزاز عند اللمس",
                Icons.vibration_outlined,
                const Color(0xFFF2F4F7),
                const Color(0xFF13EC6D),
                hapticFeedback,
                (v) => setState(() => hapticFeedback = v),
              ),
              _buildNavigationTile(
                "المساعدة والدعم",
                "",
                Icons.help_outline,
                const Color(0xFFF2F4F7),
              ),
            ]),

            const SizedBox(height: 32),
            // رقم الإصدار
            const Center(
              child: Column(
                children: [
                  Text(
                    "تطبيق أذكار v1.0.2",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "صنع بسلام",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- أدوات بناء الواجهة (Helper Widgets) ---

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // ignore: deprecated_member_use
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color(0xFF13EC6D),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: Image.asset('images/Image.png').image,
            ), // استبدلها بصورتك
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "مهند عبيد",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.orange,
                    size: 16,
                  ),
                  Text(
                    " ١٢ يوم متواصل",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: const Icon(
              Icons.edit_outlined,
              size: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 8),
      child: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(
    String title,
    IconData icon,
    Color bgColor,
    Color iconColor,
    bool value,
    Function(bool) onChanged,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: const Color(0xFF13EC6D),
      ),
    );
  }

  Widget _buildFontSizeTile() {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.text_fields, color: Color(0xFF13EC6D)),
      ),
      title: const Text("حجم الخط"),
      subtitle: Slider(
        value: fontSize,
        min: 1.0, // الحد الأدنى
        max: 3.0, // الحد الأقصى (مثلاً)
        onChanged: (v) {
          setState(() {
            fontSize = v;
          });
        },
        activeColor: const Color(0xFFD1FAE5),
        inactiveColor: const Color(0xFFD1FAE5),
      ),
    );
  }

  Widget _buildTimeTile(
    String title,
    String sub,
    String time,
    IconData icon,
    Color bgColor,
    Color iconColor,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title),
      subtitle: Text(sub, style: const TextStyle(fontSize: 12)),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F4F7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          time,
          style: const TextStyle(
            color: Color(0xFF13EC6D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationTile(
    String title,
    String trailingText,
    IconData icon,
    Color bgColor,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.grey[700]),
      ),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(trailingText, style: const TextStyle(color: Colors.grey)),
          const Icon(Icons.arrow_back_ios_new, size: 14, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildColorPickerTile() {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F5F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.palette_outlined, color: Color(0xFF13EC6D)),
      ),
      title: const Text("ألوان التصميم"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _colorDot(Colors.purple[200]!),
          _colorDot(Colors.orange[200]!),
          _colorDot(Colors.blue[200]!),
          _colorDot(const Color(0xFF13EC6D), selected: true),
        ],
      ),
    );
  }

  Widget _colorDot(Color color, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selected
            ? Border.all(color: const Color(0xFF13EC6D), width: 2)
            : null,
      ),
      child: CircleAvatar(radius: 8, backgroundColor: color),
    );
  }
}
