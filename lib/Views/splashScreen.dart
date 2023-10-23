import 'package:flutter/material.dart';
import 'package:shopwow/Views/bottomNavigationBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
           Navigator.of(context)
               .pushReplacement(MaterialPageRoute(builder: (context) => const BottomNavigationBars()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text("Splash Screen", style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 22
             ))
            ]
          ),
        ),
      ),
    );
  }
}
