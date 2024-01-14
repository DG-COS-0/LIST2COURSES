import 'package:flutter/material.dart';
import 'package:list2courses/course_item.dart';
import 'package:list2courses/models/course.dart';

class CoursesList extends StatefulWidget {
  const CoursesList(
      {super.key, required this.courses, required this.onDeleteCourse});
  final List<Course> courses;
  final void Function(Course course) onDeleteCourse;
  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      widget.courses[index].changeStatut();
    });
    print(widget.courses[index].isActive);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.courses.length,
      itemBuilder: (contx, index) => Dismissible(
        key: ValueKey(widget.courses[index]),
        onDismissed: (direction) {
          widget.onDeleteCourse(
            widget.courses[index],
          );
        },
        child: CourseItem(
            course: widget.courses[index],
            onChange: (bool? value) {
              checkBoxChanged(null, index);
            }),
      ),
    );
  }
}
