import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

void main() {
  runApp(const MaterialApp(home: ButtonDemo()));
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });

  Color getBackGroundColor() {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey.shade300;
    }
  }

  Color getColor() {
    return type == ButtonType.disabled ? Colors.grey : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: getBackGroundColor(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconPosition == IconPosition.left
              ? [
                  Icon(icon, color: getColor()),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: getColor(),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]
              : [
                  Text(
                    label,
                    style: TextStyle(
                      color: getColor(),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(icon, color: getColor()),
                ],
        ),
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom buttons')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              type: ButtonType.primary,
              iconPosition: IconPosition.left,
            ),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              type: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            CustomButton(
              label: 'Account',
              icon: Icons.account_tree,
              type: ButtonType.disabled,
              iconPosition: IconPosition.right,
            ),
          ],
        ),
      ),
    );
  }
}