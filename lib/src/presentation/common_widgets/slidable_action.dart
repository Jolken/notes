import 'package:flutter/material.dart';

class SlidableActionWidget extends StatelessWidget {
  const SlidableActionWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OverflowBox(
            alignment: Alignment.topRight,
            maxWidth: constraints.maxWidth,
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        Color.alphaBlend(color.withOpacity(0.2), Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    size: 32,
                    color: color,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
