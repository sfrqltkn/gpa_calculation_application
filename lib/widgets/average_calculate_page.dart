import 'package:average_calculation/constant/app_constant.dart';
import 'package:average_calculation/helper/data_helper.dart';
import 'package:average_calculation/model/course.dart';
import 'package:average_calculation/widgets/average_show.dart';
import 'package:average_calculation/widgets/course_list.dart';
import 'package:average_calculation/widgets/credit_dropdown_widget.dart';
import 'package:average_calculation/widgets/letter_dropdown_widget.dart';
import 'package:average_calculation/widgets/tesxformfield_widget.dart';
import 'package:flutter/material.dart';

class AverageCalculPage extends StatefulWidget {
  const AverageCalculPage({super.key});

  @override
  State<AverageCalculPage> createState() => _AverageCalculPageState();
}

class _AverageCalculPageState extends State<AverageCalculPage> {
  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  String enterLessonName = "";
  var formKey = GlobalKey<FormState>();
  List<Course> allCourses = DataHelper.allAddedLesson;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Constant.appTitle,
            style: Constant.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: AverageShow(
                    average: DataHelper.averageCalculate(),
                    lessonCount: DataHelper.allAddedLesson.length),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CourseList(
            allLesson: allCourses,
            onCourseDismissed: (index) {
              setState(() {
                allCourses.removeAt(index);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: Constant.formPadding,
              child: TextFormFieldWidget(onLessonName: (coursName) {
                enterLessonName = coursName;
              })),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: Constant.formPadding,
                  child: LetterDropDownWidget(
                    onLetterSelected: (letter) {
                      selectedLetterValue = letter;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constant.formPadding,
                  child: CreditDropDownWidget(
                    onCreditSelected: (credit) {
                      selectedCreditValue = credit;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _addLessonAndAverageCalculate,
                icon: const Icon(Icons.arrow_forward_ios_sharp),
                color: Constant.mainColor,
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  void _addLessonAndAverageCalculate() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      var courseToBeAdded = Course(
          name: enterLessonName,
          letterValue: selectedLetterValue,
          creditValue: selectedCreditValue);
      DataHelper.addedCourse(courseToBeAdded);
      setState(() {});
    }
  }
}
