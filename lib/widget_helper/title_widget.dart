import 'package:flutter/material.dart';

class PageTitleWidget extends StatelessWidget {
  final String pageTitle;
  const PageTitleWidget({
    super.key,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: [
            TextSpan(
              text: pageTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const TextSpan(
              text: '.',
              style: TextStyle(
                color: Color(0xFFFFC700),
                fontSize: 30,
              ),
            )
          ],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
