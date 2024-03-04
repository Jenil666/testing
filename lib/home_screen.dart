// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        commonTextField(
          controller: TextEditingController(),
          hintText: "Hi Corat",
          titleText: "Required Field",
          isRequired: true,
        ),
        SizedBox(height: 10),
        commonTextField(
          controller: TextEditingController(),
          hintText: "Hi Corat",
          titleText: "Not Required Field",
          isRequired: false,
        ),
      ],
    );
  }

  Widget commonTextField({
    required TextEditingController controller,
    required String hintText,
    required String titleText,
    bool? isRequired,
  }) {
    return Column(
      children: [
        commonTitle(text: titleText, isRequired: isRequired ?? false),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }

  Widget commonTitle({
    required String text,
    required bool isRequired,
  }) {
    return Row(
      children: [
        Text(
          text,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
        const Text(
          "*",
          style: TextStyle(color: Colors.red, fontSize: 15),
        ),
      ],
    );
  }
}
