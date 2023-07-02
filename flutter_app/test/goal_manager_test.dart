import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/lib/goal_manager.dart';
import 'package:flutter_app/lib/models/goal.dart';
import 'package:flutter_app/lib/services/goal_service.dart';

void main() {
  group('GoalManager', () {
    GoalManager goalManager;
    GoalService goalService;

    setUp(() {
      goalService = GoalService();
      goalManager = GoalManager(goalService: goalService);
    });

    test('should add a goal', () {
      Goal goal = Goal(title: 'Test Goal', description: 'This is a test goal');
      goalManager.addGoal(goal);
      expect(goalManager.goals.contains(goal), true);
    });

    test('should remove a goal', () {
      Goal goal = Goal(title: 'Test Goal', description: 'This is a test goal');
      goalManager.addGoal(goal);
      goalManager.removeGoal(goal);
      expect(goalManager.goals.contains(goal), false);
    });

    test('should update a goal', () {
      Goal goal = Goal(title: 'Test Goal', description: 'This is a test goal');
      goalManager.addGoal(goal);
      Goal updatedGoal = Goal(title: 'Updated Goal', description: 'This is an updated goal');
      goalManager.updateGoal(goal, updatedGoal);
      expect(goalManager.goals.contains(updatedGoal), true);
      expect(goalManager.goals.contains(goal), false);
    });

    test('should fetch all goals', () {
      Goal goal1 = Goal(title: 'Test Goal 1', description: 'This is a test goal 1');
      Goal goal2 = Goal(title: 'Test Goal 2', description: 'This is a test goal 2');
      goalManager.addGoal(goal1);
      goalManager.addGoal(goal2);
      expect(goalManager.getAllGoals(), [goal1, goal2]);
    });
  });
}