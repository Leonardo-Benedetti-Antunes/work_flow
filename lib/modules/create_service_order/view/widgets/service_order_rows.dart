import 'package:flutter/material.dart';

class ServiceOrderRows extends StatelessWidget {
  final String name;
  final TextEditingController? controller;

  const ServiceOrderRows({
    required this.name,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          TextFormField(
            decoration: InputDecoration(label: Text(name)),
            controller: controller,
          ),
        ],
      ),
    );
  }
}
