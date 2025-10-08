import 'package:flutter/material.dart';
import '../models/skill.dart';
import 'skill_card.dart';

class SkillSection extends StatelessWidget {
  final String level;
  final List<Skill> skills;
  const SkillSection({super.key, required this.level, required this.skills});

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 0, 8),
          child: Text(
            level,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: skills.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, idx) => SkillCard(skill: skills[idx]),
            separatorBuilder: (context, idx) => const SizedBox(width: 2),
          ),
        ),
      ],
    );
  }
}
