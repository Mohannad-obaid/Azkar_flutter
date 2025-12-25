import 'package:flutter/material.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => TasbeehScreenState();
}

class TasbeehScreenState extends State<TasbeehScreen> {
  int _counter = 0;
  final int _goal = 33;

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
        title: Text(
          "المسبحة",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
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
            _backgroundCount(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.flag, color: Color(0xFF0BB544)),
                  SizedBox(width: 7),
                  Text(
                    'الهدف: $_goal',
                    style: TextStyle(fontSize: 16, color: Color(0xFF0BB544)),
                  ),
                ],
              ),
              Color.fromARGB(
                223,
                182,
                221,
                195,
              ), //Color(0xFFDDCE82).withOpacity(0.5),
              20,
            ),

            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: _buildResetButton(_resetCounter),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 260,
                  height: 260,
                  child: CircularProgressIndicator(
                    value: _counter / _goal,
                    strokeWidth: 7,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Spacer(),

            SizedBox(
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'المجموع',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '1234',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Text(
                        'المتبقي',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${_goal - _counter}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

Widget _buildResetButton(void Function() onPressed) {
  return Column(
    children: [
      IconButton(
        icon: Icon(Icons.refresh, color: Colors.redAccent, size: 35),
        onPressed: onPressed,
      ),
      Text("تصفير العداد", style: TextStyle(color: Colors.grey[600])),
    ],
  );
}

Widget _backgroundCount(Widget child, Color bgColor, double radius) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: bgColor == Colors.white ? Color(0xFFF3F4F6) : bgColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: child,
  );
}
