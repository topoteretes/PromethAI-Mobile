import 'dart:async';
import 'package:flutter_app/models/prompt.dart';

class PromptService {
  List<Prompt> _prompts = [];

  Future<List<Prompt>> getPrompts() async {
    return _prompts;
  }

  Future<void> addPrompt(Prompt prompt) async {
    _prompts.add(prompt);
  }

  Future<void> deletePrompt(Prompt prompt) async {
    _prompts.remove(prompt);
  }

  Future<void> updatePrompt(Prompt oldPrompt, Prompt newPrompt) async {
    int index = _prompts.indexOf(oldPrompt);
    if (index != -1) {
      _prompts[index] = newPrompt;
    }
  }
}