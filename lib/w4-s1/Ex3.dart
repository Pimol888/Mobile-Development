import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;
  final double buttonWidth; // Add buttonWidth property for uniform width

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
    this.buttonWidth = 200.0, // Default button width
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    switch (buttonType) {
      case ButtonType.primary:
        buttonColor = Colors.blue;
        break;
      case ButtonType.secondary:
        buttonColor = Colors.green;
        break;
      case ButtonType.disabled:
        buttonColor = Colors.grey;
        break;
    }

    return SizedBox(
      width: buttonWidth, // Set button width
      child: ElevatedButton(
        onPressed: buttonType == ButtonType.disabled ? null : () {}, // Disable button if type is disabled
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: Size(buttonWidth, 48), // Uniform height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPosition == IconPosition.left) Icon(icon),
            Text(label),
            if (iconPosition == IconPosition.right) Icon(icon),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Button Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Buttons'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.send,
                buttonType: ButtonType.primary,
                iconPosition: IconPosition.right, // Submit icon on the right
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: 'Time',
                icon: Icons.timer,
                buttonType: ButtonType.secondary,
                iconPosition: IconPosition.left, // Time icon on the left
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: 'Account',
                icon: Icons.account_circle,
                buttonType: ButtonType.disabled,
                iconPosition: IconPosition.left, // Account icon on the left
              ),
            ],
          ),
        ),
      ),
    );
  }
}