import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:openai_codex_flutter_tutorial/bottomButton.dart';
import 'package:openai_codex_flutter_tutorial/constants.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({super.key});

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(APP_TITLE)),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Prompt",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                minLines: 8,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: DUMMY_PROMPT,
                    hintMaxLines: 4,
                    hintStyle: TextStyle(fontSize: 18)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text("Send"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Completion",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: BRAND_COLOR),
              ),
            ),
            AnimatedTextKit(animatedTexts: [
              TypewriterAnimatedText(DUMMY_COMPLETION,
                  curve: Curves.ease,
                  speed: const Duration(milliseconds: 80),
                  textStyle: const TextStyle(fontSize: 18, color: BRAND_COLOR))
            ])
          ],
        ),
      )),
      bottomNavigationBar: const BottomAppBar(child: BottomButton(screenNumber: 2, buttonText: PLAYGROUND_BUTTON,)),
    );
  }
}
