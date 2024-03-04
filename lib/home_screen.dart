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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              commonTextField(
                controller: TextEditingController(),
                hintText: "Hi Corat",
                titleText: "Required Field",
                isRequired: true,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              commonTextField(
                controller: TextEditingController(),
                hintText: "Hi Corat",
                titleText: "Not Required Field",
                isRequired: false,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              commonTextField(
                controller: TextEditingController(),
                hintText: "Hi Corat",
                titleText: "Number validation",
                isRequired: true,
                keyboardType: TextInputType.numberWithOptions(),
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "This field is required";
                  } else if (p0.contains("-") ||
                      p0.contains(",") ||
                      p0.contains(".")) {
                    return "Enter valid Value";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonTextField({
    required TextEditingController controller,
    required String hintText,
    required String titleText,
    String? Function(String?)? validator,
    bool? isRequired,
    TextInputType? keyboardType,
  }) {
    return Column(
      children: [
        commonTitle(text: titleText, isRequired: isRequired ?? false),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType ?? TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.black26),
            hintText: hintText,
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
        SizedBox(width: 5),
        Visibility(
          visible: isRequired,
          child: const Text(
            "*",
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
