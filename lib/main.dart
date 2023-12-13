import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:machinetest/controller/dashboard_provider.dart';
import 'package:machinetest/controller/login_provider.dart';
import 'package:machinetest/model/hive_model.dart';
import 'package:machinetest/view/home/home_screen.dart';
import 'package:machinetest/view/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(DashboardAdapter());
  await Hive.initFlutter();
  await Hive.openBox<DashboardHive>('dashboardss');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isLoggedIn});
  final bool? isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isLoggedIn! ? const HomeScreen() : LoginScreen(),
      ),
    );
  }
}
