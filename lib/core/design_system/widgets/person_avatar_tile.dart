import 'package:flutter/material.dart';
import '../tokens/spacing.dart';

class PersonAvatarTile extends StatelessWidget {
  final String name;
  final String? subtitle;
  final String? photoUrl;
  final VoidCallback? onTap;

  const PersonAvatarTile({
    super.key,
    required this.name,
    this.subtitle,
    this.photoUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
              child: photoUrl == null ? Text(name.isNotEmpty ? name[0] : '?') : null,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.bodyLarge),
                  if (subtitle != null)
                    Text(subtitle!, style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}