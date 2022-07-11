import 'package:flutter/material.dart';
import 'package:flutter_calculator/services/theme_service.dart';
import 'package:provider/provider.dart';

class OperatorItem extends StatelessWidget {
  final String? label;
  final Color? color;
  final VoidCallback? onTap;
  const OperatorItem({
    Key? key,
    this.label,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: themeService.darkTheme ? const Color(0XFF272B33) : null,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          label!,
          style: TextStyle(
              color: color, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
