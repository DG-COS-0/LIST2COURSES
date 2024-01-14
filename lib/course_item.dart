import 'package:flutter/material.dart';
import 'package:list2courses/models/course.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course, required this.onChange});
  final Course course;
  final void Function(bool?) onChange;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: course.isActive ? Colors.deepOrangeAccent[100] : Colors.black38,
      child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
          child: Column(
            children: [
              Checkbox(value: !course.isActive, onChanged: onChange),
              Text(
                course.nom,
                style: TextStyle(
                    decoration: !course.isActive
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text("Prix : "),
                  const Spacer(),
                  Text(
                    '${course.prix.toString()} FCFA',
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Category : "),
                  const Spacer(),
                  Icon(IconsRepresentation[course.category]),
                  Text(
                    course.category.name.toString(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Quantité : "),
                  const Spacer(),
                  Text(
                    course.quantite.toString(),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.alarm),
                  const SizedBox(
                    width: 6,
                  ),
                  Text("Créé le : "),
                  const Spacer(),
                  Text(
                    course.FormatDate,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
