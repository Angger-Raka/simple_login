import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    this.label,
    this.controller,
    this.focusNode,
    this.height = 55.0,
    this.width,
    super.key,
  });

  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            gapPadding: 10,
          ),
          // labelText: label,
          label: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(label!),
          ),
          labelStyle: TextStyles.btextSemiboldM.copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
