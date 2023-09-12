import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopwow/Const/constants.dart';
import 'package:shopwow/Provider/bottomNavProvider.dart';
import 'package:shopwow/Provider/cartProvider.dart';
import 'package:shopwow/Views/bottomNavigationBar.dart';
import 'Provider/counterProvider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CounterProvider()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => BottomBarProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ConnectivityResult? currentConnectivity;

  @override
  void initState() {
    super.initState();

    // Initialize the current connectivity status
    Connectivity().checkConnectivity().then((result) {
      setState(() {
        currentConnectivity = result;
      });
    });

    // Listen for connectivity changes
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        if (currentConnectivity != ConnectivityResult.none &&
            result == ConnectivityResult.none) {
          // Internet connection lost
          showToast('Internet connection lost');
        } else if (currentConnectivity == ConnectivityResult.none &&
            result != ConnectivityResult.none) {
          // Internet connection restored
          showToast('Internet connection restored');
        }
        currentConnectivity = result;
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shop wow',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Comfortaa",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
          useMaterial3: true,
        ),
        home: const BottomNavigationBars());
  }
}
