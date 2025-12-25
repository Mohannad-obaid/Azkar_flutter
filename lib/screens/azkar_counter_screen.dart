import 'package:flutter/material.dart';

class AzkarCounterScreen extends StatefulWidget {
  const AzkarCounterScreen({super.key});

  @override
  State<AzkarCounterScreen> createState() => AzkarCounterScreenState();
}

class AzkarCounterScreenState extends State<AzkarCounterScreen> {

  int _counter = 0;
  int _goal = 33;

void _incrementCounter() {
    setState(() {
      if (_counter < _goal) {
        _counter++;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading:_backgroundArrow(
          Icon(Icons.arrow_back, color: Colors.black87),
          Color(0xFFFAFCFB),
          22,
        ),
        title: Text(
          "عداد الأذكار",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFE4F7EC), // اللون العلوي
              Color(0xFFF6F8F7), // لون الوسط
              Color(0xFFEBF7F1), // اللون السفلي
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            _continerZaker(
              Column(
                children: [
                  Text(
                    "سُبْحَانَ اللهِ وَبِحَمْدِهِ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Colors.green[100],
                    thickness: 4,
                    indent: 100, // قللت المسافة ليظهر الخط بشكل أوضح
                    endIndent: 100,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: Text(
                      "من قالها مائة مرة حين يصبح وحين يمسي لم يأتي أحد يوم القيامة بأفضل مما جاء به.",
                      textAlign: TextAlign.center,
                      maxLines: 2, // لجعل النص في سطرين
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 260,
                  height: 260,
                  child: CircularProgressIndicator(
                    value: _counter / _goal,
                    strokeWidth: 12,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF13EC6D),
                    ),
                    strokeCap:
                        StrokeCap.round, // لجعل حواف الدائرة دائرية مثل الصورة
                  ),
                ),
            
                InkWell(
                  onTap: _incrementCounter,
                  child: Container(
                    width: 245, // أقل من عرض الدائرة الخارجية (260 - 24 للسمك)
                    height: 245,
                    decoration: BoxDecoration(
                      color: Colors.white, // اللون الأبيض الداخلي
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Icon(
                          Icons.fingerprint,
                          size: 40,
                          color: Color(0xFF13EC6D),
                        ), // أيقونة البصمة
                        Text(
                          _counter.toString(),
                          style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3E50),
                          ),
                        ),
                        Text(
                          " الهدف $_goal",
                          style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBottomAction(Icons.arrow_back, "التالي"),
                _buildResetButton(_resetCounter),
                _buildBottomAction(Icons.arrow_forward, "السابق"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _continerZaker(Widget child) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
      ],
    ),
    child: child,
  );
}

Widget _buildBottomAction(IconData icon, String label) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.white,
        radius: 30,
        child: Icon(icon, color: Colors.black54),
      ),
      SizedBox(height: 8),
      Text(label, style: TextStyle(color: Colors.grey[600])),
    ],
  );
}

Widget _buildResetButton(void Function() onPressed) {
  return Column(
    children: [
      IconButton(
        icon: Icon(Icons.refresh, color: Colors.redAccent, size: 35),
        onPressed: onPressed,
      ),
      Text("إعادة", style: TextStyle(color: Colors.grey[600])),
    ],
  );
}

Widget _backgroundArrow(
  Widget child,
  Color bgColor,
  double radius,
) {
  return Container(
   // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: bgColor == Colors.white ? Color(0xFFF3F4F6) : bgColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: child,
  );
}

