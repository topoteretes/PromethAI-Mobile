import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/ai_assistant.dart';
import 'package:flutter_app/models/goal.dart';
import 'package:flutter_app/models/prompt.dart';
import 'package:flutter_app/services/goal_service.dart';
import 'package:flutter_app/services/prompt_service.dart';

void main() {
  group('AI Assistant', () {
    final aiAssistant = AiAssistant(GoalService(), PromptService());

    test('should decompose thoughts into prompts', () {
      final thought = 'I want to learn Flutter';
      final expectedPrompts = [
        Prompt('Have you installed Flutter SDK?'),
        Prompt('Have you read Flutter documentation?'),
        Prompt('Have you started building a Flutter app?'),
      ];

      expect(aiAssistant.decomposeThought(thought), expectedPrompts);
    });

    test('should help reach goals', () {
      final goal = Goal('Learn Flutter');
      final expectedSteps = [
        'Install Flutter SDK',
        'Read Flutter documentation',
        'Build a Flutter app',
      ];

      expect(aiAssistant.helpReachGoal(goal), expectedSteps);
    });
  });
}