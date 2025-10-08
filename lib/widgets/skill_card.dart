import 'package:flutter/material.dart';
import '../models/skill.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;
  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: skill.image.isNotEmpty
                  ? Image.asset(
                      skill.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => 
                          const Center(child: Icon(Icons.broken_image, size: 50)),
                    )
                  : const Center(child: Icon(Icons.image, size: 50)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                skill.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
