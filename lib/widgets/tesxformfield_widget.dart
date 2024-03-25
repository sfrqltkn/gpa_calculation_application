import 'package:average_calculation/constant/app_constant.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final Function onLessonName;
  const TextFormFieldWidget({super.key, required this.onLessonName});

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  String enterCourseName = "";
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          enterCourseName = value!;
          widget.onLessonName(enterCourseName);
        });
      },
      validator: (value) {
        // ignore: prefer_is_empty
        if (value!.length <= 0) {
          return "Enter Lesson Name ";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Lesson Name",
        border: OutlineInputBorder(
            borderRadius: Constant.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Constant.mainColor.shade100.withOpacity(0.2),
      ),
    );
  }
}
