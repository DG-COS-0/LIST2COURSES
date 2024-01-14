import 'package:flutter/material.dart';
import 'package:list2courses/models/course.dart';

class NewCourse extends StatefulWidget {
  const NewCourse({super.key, required this.onAddCourse});
  final void Function(Course course) onAddCourse;
  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  final nameController = TextEditingController();
  final prixController = TextEditingController();
  final quantiteController = TextEditingController();

  Category categorySelected = Category.travail;

  void CreateNewCourse() {
    final prix = double.tryParse(prixController.text);
    final quantite = int.tryParse(quantiteController.text);

    final invalidNumber =
        prix == null || prix < 0 || quantite == null || quantite < 0;
    if (nameController.text.trim().isEmpty || invalidNumber) {
      showDialog(
        context: context,
        builder: (contx) => AlertDialog(
          title: Text("Donnée invalid"),
          content: Text(
              "Veuillez verifier les valeur que vous avez entrer. Il y a t'il des valeur null. ou inferieur a 0 ..."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddCourse(
      Course(
          nom: nameController.text,
          prix: prix,
          quantite: quantite,
          createdAt: DateTime.now(),
          category: categorySelected),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    prixController.dispose();
    quantiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(children: [
        TextField(
          controller: nameController,
          maxLength: 50,
          decoration: InputDecoration(
            label: Text("Nom De la Course"),
          ),
        ),
        TextField(
          controller: prixController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            prefixText: 'XOF      ',
            label: Text('Prix'),
          ),
        ),
        TextField(
          controller: quantiteController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text('Quantité'),
          ),
        ),
        Row(
          children: [
            Text("Category"),
            SizedBox(
              width: 12,
            ),
            DropdownButton(
                items: Category.values
                    .map(
                      (cate) => DropdownMenuItem(
                        value: cate,
                        child: Text(cate.name.toString()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    categorySelected = value;
                  });
                }),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {
                return Navigator.pop(context);
              },
              child: Text("Retour"),
            ),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {
                CreateNewCourse();
              },
              child: Text("Enregistrer"),
            ),
          ],
        )
      ]),
    );
  }
}
