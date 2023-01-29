import 'package:flutter/material.dart';
import 'package:openai_codex_flutter_tutorial/constants.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        label: const Text(
          LANDING_BUTTON,
          style: TextStyle(fontSize: 18),
        ),
        icon: const Icon(
          Icons.arrow_right_rounded,
          size: 50,
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(120, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
