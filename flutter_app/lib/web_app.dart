import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'ai_assistant.dart';
import 'goal_manager.dart';
import 'prompt_decomposer.dart';
import 'widgets/assistant_widget.dart';
import 'widgets/goal_card.dart';
import 'widgets/prompt_card.dart';
import 'utils/constants.dart';
import 'utils/helper_functions.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(WebApp());
}

class WebApp extends StatelessWidget {
  final AiAssistant aiAssistant = AiAssistant();
  final GoalManager goalManager = GoalManager();
  final PromptDecomposer promptDecomposer = PromptDecomposer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Assistant Web App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AI Assistant Web App'),
        ),
        body: Column(
          children: <Widget>[
            AssistantWidget(aiAssistant: aiAssistant),
            Expanded(
              child: ListView.builder(
                itemCount: goalManager.goals.length,
                itemBuilder: (context, index) {
                  return GoalCard(goal: goalManager.goals[index]);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: promptDecomposer.prompts.length,
                itemBuilder: (context, index) {
                  return PromptCard(prompt: promptDecomposer.prompts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}