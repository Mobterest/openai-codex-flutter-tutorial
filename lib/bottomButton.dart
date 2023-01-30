import 'package:flutter/material.dart';
import 'package:openai_codex_flutter_tutorial/constants.dart';
import 'package:openai_codex_flutter_tutorial/screens/completionScreen.dart';
import 'package:openai_codex_flutter_tutorial/screens/designScreen.dart';
import 'package:openai_codex_flutter_tutorial/screens/landingScreen.dart';
import 'package:openai_codex_flutter_tutorial/screens/playgroundScreen.dart';

class BottomButton extends StatefulWidget {
  final String buttonText;
  final int screenNumber;
  const BottomButton(
      {Key? key, required this.buttonText, required this.screenNumber})
      : super(key: key);

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (widget.screenNumber == 1)
                    ? const PlaygroundScreen()
                    : (widget.screenNumber == 2)
                        ? const CompletionScreen()
                        : (widget.screenNumber == 3)
                            ? const DesignEvalScreen()
                            : const LandingScreen(),
              ));
        },
        label: Text(
          widget.buttonText,
          style: const TextStyle(fontSize: 18),
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
