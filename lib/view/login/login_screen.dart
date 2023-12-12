// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:machinetest/controller/login_provider.dart';
import 'package:machinetest/view/login/widget/textform_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginProvider loginProvider = LoginProvider();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Inaxus",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              TextFormWidget(
                textcontroller: emailController,
                placeHolder: "Enter your email",
                prefixIcon: Icons.mail,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextFormWidget(
                textcontroller: passwordController,
                placeHolder: "Enter your password",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  loginProvider.login(
                    context,
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: null,
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor: const Color.fromARGB(255, 216, 122, 233),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  side: BorderSide(color: Colors.grey.shade300),
                  minimumSize: const Size(double.maxFinite, 48), // NEW
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
