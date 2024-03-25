import 'package:flutter/material.dart';
import 'package:average_calculation/model/course.dart';
import 'package:average_calculation/constant/app_constant.dart';

class CourseList extends StatelessWidget {
  final List<Course> allLesson;
  final Function(int) onCourseDismissed;

  const CourseList(
      {Key? key, required this.allLesson, required this.onCourseDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: allLesson.length > 0
          ? ListView.builder(
              itemCount: allLesson.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (a) {
                    onCourseDismissed(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(allLesson[index].name),
                        leading: CircleAvatar(
                          backgroundColor: Constant.mainColor,
                          child: Text(
                              "${(allLesson[index].letterValue * allLesson[index].creditValue).toInt()}"),
                        ),
                        subtitle: Text(
                            "${allLesson[index].creditValue} Credit, Not Value ${allLesson[index].letterValue}"),
                      ),
                    ),
                  ),
                );
              },
            )
          : Container(
              margin: const EdgeInsets.all(24),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Please add a lesson',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Constant.mainColor)),
                  ),
                ),
              ),
            ),
    );
  }
}
