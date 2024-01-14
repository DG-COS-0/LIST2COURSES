import 'package:flutter/material.dart';
import 'package:list2courses/courses_list.dart';
import 'package:list2courses/models/course.dart';
import 'package:list2courses/new_course.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CoursesState();
  }
}

class _CoursesState extends State<Courses> {
  final List<Course> listOfCourse = [
    // Course(
    //     nom: "Achat de Soja",
    //     prix: 25,
    //     quantite: 2,
    //     createdAt: DateTime.now(),
    //     category: Category.repas),
    // Course(
    //     nom: "Achat du sel",
    //     prix: 2000,
    //     quantite: 32,
    //     createdAt: DateTime.now(),
    //     category: Category.repas),
    // Course(
    //     nom: "Achat chaussure",
    //     prix: 20000,
    //     quantite: 1,
    //     createdAt: DateTime.now(),
    //     category: Category.habillement),
  ];
  void addCourse(Course course) {
    setState(() {
      listOfCourse.add(course);
    });
    Navigator.pop(context);
  }

  void deleteCourse(Course course) {
    setState(() {
      listOfCourse.remove(course);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Vous avez supprimer une course"),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget Empty = const Center(
      child: Text(
        'List de course vide. Veuillez commencer par en ajputer avec le button en haut a droite;',
        style: TextStyle(
            color: Colors.black87,
            fontSize: 15,
            decoration: TextDecoration.none),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.deepOrange[500],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (contx) {
                    return NewCourse(
                      onAddCourse: addCourse,
                    );
                  },
                );
              },
              icon: Icon(Icons.add))
        ],
        title: const Text("Course MAnager App"),
      ),
      body: Column(
        children: [
          const Text("LA LISTE DE COURSES"),
          Expanded(
            child: listOfCourse.isEmpty
                ? Empty
                : CoursesList(
                    courses: listOfCourse,
                    onDeleteCourse: deleteCourse,
                  ),
          ),
        ],
      ),
    );
  }
}
