import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final VoidCallback onTap;
  const SocialAuthButton({super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
    height: 52,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: Colors.grey.shade300, width: 1),
      boxShadow: [
       BoxShadow(
        color: Colors.black.withOpacity(0.02),
        blurRadius: 10,
        offset: const Offset(0, 4),

       ),
      ],
    ),
    child: InkWell(
      onTap:onTap ,
      borderRadius: BorderRadius.circular(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width:10),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.32,
              color:Colors.black87,
            ),
          )
        ],
      ),
    ),
    );
  }
}