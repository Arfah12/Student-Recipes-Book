import 'package:flutter/material.dart';

class StepList extends StatelessWidget {
  final List<String> steps;

  const StepList({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    if (steps.isEmpty) {
      return const Text('No steps available.');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: steps
          .asMap()
          .entries
          .map(
            (entry) => ListTile(
              leading: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.orange,
                child: Text(
                  '${entry.key + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              title: Text(entry.value),
            ),
          )
          .toList(),
    );
  }
}
