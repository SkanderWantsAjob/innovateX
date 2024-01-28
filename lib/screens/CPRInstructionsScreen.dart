import 'package:flutter/material.dart';

class CPRInstructionsScreen extends StatelessWidget {
  final List<String> instructions = [
    'CHECK the scene for safety, form an initial impression and use personal protective equipment (PPE)',
    'If the person appears unresponsive, CHECK for responsiveness, breathing, life-threatening bleeding or other life-threatening conditions using shout-tap-shout',
    'If the person does not respond and is not breathing or only gasping, CALL 9-1-1 and get equipment, or tell someone to do so',
    'Kneel beside the person. Place the person on their back on a firm, flat surface',
    'Give 30 chest compressions\n\nHand position: Two hands centered on the chest\nBody position: Shoulders directly over hands; elbows locked\nDepth: At least 2 inches\nRate: 100 to 120 per minute\nAllow chest to return to normal position after each compression',
    'Give 2 breaths\n\nOpen the airway to a past-neutral position using the head-tilt/chin-lift technique\nPinch the nose shut, take a normal breath, and make complete seal over the person’s mouth with your mouth.\nEnsure each breath lasts about 1 second and makes the chest rise; allow air to exit before giving the next breath\nNote: If the 1st breath does not cause the chest to rise, retilt the head and ensure a proper seal before giving the 2nd breath If the 2nd breath does not make the chest rise, an object may be blocking the airway',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CPR Instructions'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: instructions.length,
        itemBuilder: (context, index) {
          return InstructionTile(number: index + 1, text: instructions[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // tarja3 lel home
          Navigator.pop(context);
        },

        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class InstructionTile extends StatelessWidget {
  final int number;
  final String text;

  const InstructionTile({Key? key, required this.number, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      color: Colors.red,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            number.toString(),
            style: TextStyle(color: Colors.red),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
