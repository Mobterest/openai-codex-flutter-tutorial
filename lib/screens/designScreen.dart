import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';
import 'package:openai_codex_flutter_tutorial/constants.dart';

class DesignEvalScreen extends StatelessWidget {
  const DesignEvalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EvalWidget(
      assetPath: 'assets/program.evc',
      library:
          'package:openai_codex_flutter_tutorial/screens/designScreen.dart',
      packages: {
        'openai_codex_flutter_tutorial/screens': {
          'designScreen.dart': '''
              import 'package:flutter/material.dart';
              class DesignScreen extends StatefulWidget {
                const DesignScreen({super.key});
                @override
                State<DesignScreen> createState() => _DesignScreenState();
              }
              class _DesignScreenState extends State<DesignScreen> {
                @override
                Widget build(BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(title: const Text("Coding AI")),
                  body: Column(children: $DUMMY_LIST),
                  );
                }
              }
          '''
        }
      },
      function: 'DesignScreen.',
      args: [null],
    );
  }
}
