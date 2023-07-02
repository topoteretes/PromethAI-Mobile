import 'package:flutter/material.dart';
import 'package:flutter_app/ai_assistant.dart';

class AssistantWidget extends StatefulWidget {
  @override
  _AssistantWidgetState createState() => _AssistantWidgetState();
}

class _AssistantWidgetState extends State<AssistantWidget> {
  final AiAssistant _aiAssistant = AiAssistant();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'AI Assistant',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            'Enter your thoughts:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          TextField(
            onSubmitted: (String input) {
              setState(() {
                _aiAssistant.decomposeThoughts(input);
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            'Your prompts:',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _aiAssistant.prompts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_aiAssistant.prompts[index].text),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}