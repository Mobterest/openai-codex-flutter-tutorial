import 'package:flutter/material.dart';
import 'package:openai_codex_flutter_tutorial/bottomButton.dart';
import 'package:openai_codex_flutter_tutorial/constants.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.code,
                size: 50,
                color: BRAND_COLOR,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                HEADLINE,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                TAGLINE,
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
        bottomNavigationBar: const BottomAppBar(
          child: BottomButton(
            screenNumber: 1,
            buttonText: LANDING_BUTTON,
          ),
        ));
  }
}
