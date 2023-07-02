import 'dart:async';
import 'package:flutter_app/lib/models/goal.dart';

class GoalService {
  List<Goal> _goals = [];

  StreamController<List<Goal>> _goalController = StreamController<List<Goal>>.broadcast();

  Stream<List<Goal>> get goalStream => _goalController.stream;

  void dispose() {
    _goalController.close();
  }

  void addGoal(Goal goal) {
    _goals.add(goal);
    _goalController.add(_goals);
  }

  void removeGoal(Goal goal) {
    _goals.remove(goal);
    _goalController.add(_goals);
  }

  void updateGoal(Goal oldGoal, Goal newGoal) {
    int index = _goals.indexOf(oldGoal);
    _goals[index] = newGoal;
    _goalController.add(_goals);
  }
}