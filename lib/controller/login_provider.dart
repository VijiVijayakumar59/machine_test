// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:machinetest/controller/dashboard_provider.dart';
import 'package:machinetest/view/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  Future<void> login(
      BuildContext context, String email, String password) async {
    final response = await http.get(
      Uri.parse(
        "https://mobile.inaxus.com/api/Account/Login?Email=$email&Password=$password",
      ),
    );

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      final provider = Provider.of<DashboardProvider>(context, listen: false);
      await provider.fetchDashboardItems();
      print("Login successful");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      print("Login failed: ${response.statusCode}");
      throw Exception('Failed to load');
    }
  }
}
