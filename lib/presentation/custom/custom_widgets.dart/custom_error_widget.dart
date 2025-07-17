import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMsg;
  const CustomErrorWidget({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMsg,
        style: TextStyle(color: Colors.red, fontSize: 28, fontWeight: FontWeight.w600),
      ),
    );
  }
}
