import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isHome;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isHome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          !isHome ? width : width / 5,
          50,
        ),
      ),
    );
  }
}
