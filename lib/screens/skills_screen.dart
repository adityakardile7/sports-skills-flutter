import 'package:flutter/material.dart';
import '../models/skill.dart';
import '../widgets/skill_section.dart';

const List<Map<String, dynamic>> exampleSkillsJson = [
  {"name": "Dribbling", "level": "Basic", "image": "assets/images/dribling.jpeg"},
  {"name": "Vault", "level": "Intermediate", "image": "assets/images/agility.png"},
  {"name": "Agility", "level": "Advanced", "image": "assets/images/vault.jpeg"},
];

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  static const levelsOrder = ["Basic", "Intermediate", "Advanced"];

  // Group skills by level using a type-safe model
  Map<String, List<Skill>> groupSkills(List<Skill> skills) {
    final Map<String, List<Skill>> map = {for (final l in levelsOrder) l: []};
    for (final skill in skills) {
      if (map.containsKey(skill.level)) {
        map[skill.level]!.add(skill);
      }
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    // Parse skills safely with error handling
    final skills = exampleSkillsJson
        .map((json) => Skill.fromJson(json))
        .toList();
    final grouped = groupSkills(skills);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports Skills'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: ListView.builder(
        itemCount: levelsOrder.length,
        itemBuilder: (context, idx) {
          final level = levelsOrder[idx];
          final skillsOfLevel = grouped[level] ?? [];
          return SkillSection(level: level, skills: skillsOfLevel);
        },
      ),
    );
  }
}
