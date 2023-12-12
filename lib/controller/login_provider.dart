// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machinetest/view/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  login(BuildContext context, String email, String password) async {
    final response = await http.get(
      Uri.parse(
        "https://mobile.inaxus.com/api/Account/Login?Email=$email&Password=$password",
      ),
    );

    if (response.statusCode == 200) {
      // Save login state to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      throw Exception('Failed to load');
    }
  }
}
