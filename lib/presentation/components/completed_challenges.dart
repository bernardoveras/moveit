import 'package:flutter/material.dart';

class CompletedChallenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFD7D8DA),
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Desafios completos',
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Text(
            '00',
            style: TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
