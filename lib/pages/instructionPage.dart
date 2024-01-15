import 'package:dog_catcher/widgets/instructionCard.dart';
import 'package:flutter/material.dart';

class InstructionPage extends StatefulWidget {
  const InstructionPage({super.key});

  @override
  State<InstructionPage> createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          children: [
            Instructioncard(
                heading: 'RULE OF STRAY DOGS',
                discription:
                    'In the case of stray dogs or abandoned dogs or street dogs, Section 11 (i) of the PCA Act states that it is an act of cruelty “If any person without reasonable cause, abandons, any animals in circumstances which tender it likely that it will suffer pain by reason of starvation thirst”.'),
            Instructioncard(
              heading:
                  'HOW TO HELP STRAY DOGS IN YOUR\n                          LOCALITY',
              discription:
                  '1-Take care and wait for professional help\n 2-Find a temporary shelter for them\n 3-Arrange for some food\n 4-Contact an animal shelter or a community dog cente\n 5-Identify the dogs incapable of surviving on their ow”.',
            )
          ],
        ),
      ),
    );
  }
}
