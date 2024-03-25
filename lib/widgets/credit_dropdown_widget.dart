import 'package:average_calculation/constant/app_constant.dart';
import 'package:average_calculation/helper/data_helper.dart';
import 'package:flutter/material.dart';

class CreditDropDownWidget extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDropDownWidget({super.key, required this.onCreditSelected});

  @override
  State<CreditDropDownWidget> createState() => _CreditDropDownWidgetState();
}

class _CreditDropDownWidgetState extends State<CreditDropDownWidget> {
  double selectedCreditValue = 1;
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
        value: selectedCreditValue,
        onChanged: (value) => {
          setState(() {
            selectedCreditValue = value!;
            widget.onCreditSelected(selectedCreditValue);
          }),
        },
        underline: Container(),
        items: DataHelper.courseCreditsAll(),
      ),
    );
  }
}
