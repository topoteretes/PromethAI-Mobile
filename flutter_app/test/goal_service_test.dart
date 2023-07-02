import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/lib/services/goal_service.dart';
import 'package:flutter_app/lib/models/goal.dart';

void main() {
  group('GoalService', () {
    GoalService goalService;

    setUp(() {
      goalService = GoalService();
    });

    test('should add a goal', () {
      Goal goal = Goal(title: 'Test Goal', description: 'This is a test goal');
      goalService.addGoal(goal);

      expect(goalService.goals.contains(goal), true);
    });

    test('should remove a goal', () {
      Goal goal = Goal(title: 'Test Goal', description: 'This is a test goal');
      goalService.addGoal(goal);
      goalService.removeGoal(goal);

      expect(goalService.goals.contains(goal), false);
    });

    test('should update a goal', () {
      Goal goal = Goal(title: 'Test Goal', description: 'This is a test goal');
      goalService.addGoal(goal);
      Goal updatedGoal = Goal(title: 'Updated Goal', description: 'This is an updated goal');
      goalService.updateGoal(goal, updatedGoal);

      expect(goalService.goals.contains(updatedGoal), true);
      expect(goalService.goals.contains(goal), false);
    });
  });
}