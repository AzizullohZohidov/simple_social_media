import 'package:flutter/material.dart';
import '../../router/app_router.dart';

class ButtonToScreen extends StatelessWidget {
  final String toRoute;
  final String description;
  final String buttonText;
  const ButtonToScreen({
    Key? key,
    required this.toRoute,
    required this.description,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          description,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 15),
        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(toRoute),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
