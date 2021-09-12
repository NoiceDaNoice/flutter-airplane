import 'package:flutter/material.dart';
import 'package:flutter_app_airplane/shared/theme.dart';

class InterestItem extends StatelessWidget {
  final String text;

  const InterestItem({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(
            text,
            style: blackTextStyle.copyWith(),
          )
        ],
      ),
    );
  }
}
