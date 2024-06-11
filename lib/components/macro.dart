import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MacroWidget extends StatelessWidget {

  final String title;
  final int value;
  final IconData icon;
  const MacroWidget({
    required this.title, required this.value, required this.icon,super.key
  });

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(20),
            boxShadow:  [BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(3,3),
            )]
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              FaIcon(
                icon,
                color:Colors.deepOrange ,
              ),
              const SizedBox(height: 12,),
              Text(
                "$value",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,

                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}