// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: Navigation to home screen after 3 seconds
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        '/homeScreen',
        (Route<dynamic> route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: const Color(0xFFE8F5E9),
      child: Image.asset('images/logo2.png'),
    );
  }
}
