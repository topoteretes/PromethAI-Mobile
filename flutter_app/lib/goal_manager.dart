import 'package:flutter/material.dart';
import 'goal.dart';
import 'services/goal_service.dart';

class GoalManager extends ChangeNotifier {
  List<Goal> _goals = [];
  final GoalService _goalService = GoalService();

  List<Goal> get goals => _goals;

  void addGoal(Goal goal) {
    _goals.add(goal);
    _goalService.saveGoals(_goals);
    notifyListeners();
  }

  void removeGoal(Goal goal) {
    _goals.remove(goal);
    _goalService.saveGoals(_goals);
    notifyListeners();
  }

  void updateGoal(Goal goal) {
    int index = _goals.indexWhere((g) => g.id == goal.id);
    if (index != -1) {
      _goals[index] = goal;
      _goalService.saveGoals(_goals);
      notifyListeners();
    }
  }

  void loadGoals() async {
    _goals = await _goalService.loadGoals();
    notifyListeners();
  }
}