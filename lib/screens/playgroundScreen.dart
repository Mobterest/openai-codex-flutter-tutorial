import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:openai_codex_flutter_tutorial/api.dart';
import 'package:openai_codex_flutter_tutorial/bottomButton.dart';
import 'package:openai_codex_flutter_tutorial/constants.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({super.key});

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  HttpService httpService = HttpService();
  final TextEditingController _promptController = TextEditingController();
  String _completion = DUMMY_COMPLETION;
  String? dropdownValue;
  List<String> widgets = ["Text"];
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
              "Select Widget",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                  focusColor: const Color(0xffffffff),
                  dropdownColor: const Color(0xffffffff),
                  isExpanded: true,
                  value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: widgets.map<DropdownMenuItem<String>>((String nvalue) {
                    return DropdownMenuItem<String>(
                        value: nvalue, child: Text(nvalue));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      _promptController.text =
                          "Create $dropdownValue Widget with ";
                    });
                  },
                ),
              ),
            ),
            const Text(
              "Enter Prompt",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _promptController,
                minLines: 8,
                maxLines: null,
                decoration: const InputDecoration(
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
                  onPressed: () async {
                    httpService.init(BaseOptions(
                        baseUrl: BASEURL, contentType: "application/json"));

                    final response = await httpService.request(
                        endpoint: "request",
                        params: {
                          "prompt": _promptController.text,
                          "widget": dropdownValue
                        });

                    setState(() {
                      _completion = response['data'];
                    });
                  },
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
            AnimatedTextKit(key: Key(_completion), animatedTexts: [
              TypewriterAnimatedText(_completion,
                  curve: Curves.ease,
                  speed: const Duration(milliseconds: 80),
                  textStyle: const TextStyle(fontSize: 18, color: BRAND_COLOR))
            ])
          ],
        ),
      )),
      bottomNavigationBar: const BottomAppBar(
          child: BottomButton(
        screenNumber: 2,
        buttonText: PLAYGROUND_BUTTON,
      )),
    );
  }
}
