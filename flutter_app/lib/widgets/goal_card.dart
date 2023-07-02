import 'package:flutter/material.dart';
import 'package:flutter_app/models/goal.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;

  GoalCard({@required this.goal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.goal),
            title: Text(goal.title),
            subtitle: Text(goal.description),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('UPDATE'),
                onPressed: () {/* Update goal functionality */},
              ),
              FlatButton(
                child: const Text('DELETE'),
                onPressed: () {/* Delete goal functionality */},
              ),
            ],
          ),
        ],
      ),
    );
  }
}