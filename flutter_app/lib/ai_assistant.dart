import 'dart:async';
import 'package:flutter_app/models/goal.dart';
import 'package:flutter_app/models/prompt.dart';
import 'package:flutter_app/services/goal_service.dart';
import 'package:flutter_app/services/prompt_service.dart';

class AIAssistant {
  final GoalService _goalService;
  final PromptService _promptService;

  AIAssistant(this._goalService, this._promptService);

  Future<List<Goal>> getGoals() async {
    return await _goalService.getGoals();
  }

  Future<List<Prompt>> decomposeThought(String thought) async {
    return await _promptService.decomposeThought(thought);
  }

  Future<bool> addGoal(Goal goal) async {
    return await _goalService.addGoal(goal);
  }

  Future<bool> updateGoal(Goal goal) async {
    return await _goalService.updateGoal(goal);
  }

  Future<bool> deleteGoal(Goal goal) async {
    return await _goalService.deleteGoal(goal);
  }
}