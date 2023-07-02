import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/lib/prompt_decomposer.dart';
import 'package:flutter_app/lib/models/prompt.dart';

void main() {
  group('Prompt Decomposer', () {
    final decomposer = PromptDecomposer();

    test('Decompose thought into prompts', () {
      String thought = "I want to learn Flutter to develop mobile apps";
      List<Prompt> prompts = decomposer.decompose(thought);

      expect(prompts, isNotNull);
      expect(prompts, isNotEmpty);
      expect(prompts[0].content, equals("Learn Flutter"));
      expect(prompts[1].content, equals("Develop mobile apps"));
    });

    test('Decompose empty thought', () {
      String thought = "";
      List<Prompt> prompts = decomposer.decompose(thought);

      expect(prompts, isNotNull);
      expect(prompts, isEmpty);
    });

    test('Decompose null thought', () {
      String thought = null;
      List<Prompt> prompts = decomposer.decompose(thought);

      expect(prompts, isNotNull);
      expect(prompts, isEmpty);
    });
  });
}