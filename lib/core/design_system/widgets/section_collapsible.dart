import 'package:flutter/material.dart';
import '../tokens/spacing.dart';

class SectionCollapsible extends StatefulWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;

  const SectionCollapsible({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
  });

  @override
  State<SectionCollapsible> createState() => _SectionCollapsibleState();
}

class _SectionCollapsibleState extends State<SectionCollapsible> {
  late bool _expanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
                Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: widget.child,
          secondChild: const SizedBox.shrink(),
          crossFadeState: _expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 250),
        ),
      ],
    );
  }
}