import 'package:average_calculation/constant/app_constant.dart';
import 'package:average_calculation/helper/data_helper.dart';
import 'package:flutter/material.dart';

class LetterDropDownWidget extends StatefulWidget {
  final Function onLetterSelected;
  const LetterDropDownWidget({super.key, required this.onLetterSelected});

  @override
  State<LetterDropDownWidget> createState() => _LetterDropDownWidgetState();
}

class _LetterDropDownWidgetState extends State<LetterDropDownWidget> {
  double selectedLetterValue = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constant.dropDownPadding,
      decoration: BoxDecoration(
        color: Constant.mainColor.shade100.withOpacity(0.3),
        borderRadius: Constant.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constant.mainColor.shade200,
        value: selectedLetterValue,
        onChanged: (value) => {
          setState(() {
            selectedLetterValue = value!;
            widget.onLetterSelected(selectedLetterValue);
          }),
        },
        underline: Container(),
        items: DataHelper.lettersOfAllLesson(),
      ),
    );
  }
}
