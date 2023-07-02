import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/lib/services/prompt_service.dart';
import 'package:flutter_app/lib/models/prompt.dart';

void main() {
  group('PromptService', () {
    final promptService = PromptService();

    test('should decompose thought into prompts', () async {
      final thought = 'I want to learn Flutter';
      final prompts = await promptService.decomposeThought(thought);

      expect(prompts, isA<List<Prompt>>());
      expect(prompts.length, isNonZero);
    });

    test('should return empty list for empty thought', () async {
      final thought = '';
      final prompts = await promptService.decomposeThought(thought);

      expect(prompts, isA<List<Prompt>>());
      expect(prompts.isEmpty, isTrue);
    });

    test('should handle null thought', () async {
      final thought = null;
      final prompts = await promptService.decomposeThought(thought);

      expect(prompts, isA<List<Prompt>>());
      expect(prompts.isEmpty, isTrue);
    });
  });
}