import 'package:flutter/material.dart';
import 'package:openai_codex_flutter_tutorial/bottomButton.dart';
import 'package:openai_codex_flutter_tutorial/constants.dart';

class CompletionScreen extends StatefulWidget {
  const CompletionScreen({super.key});

  @override
  State<CompletionScreen> createState() => _CompletionScreenState();
}

class _CompletionScreenState extends State<CompletionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(COMPLETION_TITLE)),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }

            final String item = DUMMY_LIST.removeAt(oldIndex);
            DUMMY_LIST.insert(newIndex, item);
          });
        },
        children: DUMMY_LIST
            .map((item) => ListTile(
                  key: Key(item),
                  title: Text(item),
                  leading: const Icon(Icons.drag_indicator),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: BRAND_COLOR,
                    ),
                    onPressed: () {
                      setState(() {
                        DUMMY_LIST.remove(item);
                      });
                    },
                  ),
                ))
            .toList(),
      ),
      bottomNavigationBar: const BottomAppBar(
          child: BottomButton(
        screenNumber: 3,
        buttonText: COMPLETION_BUTTON,
      )),
    );
  }
}
