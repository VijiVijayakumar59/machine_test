// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:machinetest/controller/login_provider.dart';
import 'package:machinetest/view/login/widget/textform_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginProvider loginProvider = LoginProvider();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 100),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your email";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Enter valid email";
                    } else {
                      return null;
                    }
                  },
                  textcontroller: emailController,
                  placeHolder: "Enter your email",
                  prefixIcon: Icons.mail,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TextFormWidget(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return "Enter Valid Password";
                    } else {
                      return null;
                    }
                  },
                  textcontroller: passwordController,
                  placeHolder: "Enter your password",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                ElevatedButton(
                  onPressed: () {
                    log("$formKey.currentState!.validate()");
                    if (formKey.currentState!.validate()) {
                      loginProvider.login(
                        context,
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      log("validation success");
                    }
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
      ),
    ));
  }
}
