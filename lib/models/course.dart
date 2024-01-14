import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final DateFormatter = DateFormat.yMd();

enum Category { repas, accesoire, habillement, travail, loisir }

const IconsRepresentation = {
  Category.repas: Icons.food_bank,
  Category.accesoire: Icons.recycling_rounded,
  Category.loisir: Icons.kitesurfing_outlined,
  Category.travail: Icons.work,
  Category.habillement: Icons.umbrella,
};

class Course {
  Course(
      {required this.nom,
      required this.prix,
      required this.quantite,
      required this.createdAt,
      required this.category})
      : id = uuid.v4(),
        isActive = true;
  final String id;
  final String nom;
  final double prix;
  final int quantite;
  final Category category;
  bool isActive;
  final DateTime createdAt;

  String get FormatDate {
    return DateFormatter.format(createdAt);
  }

  void changeStatut() {
    isActive = !isActive;
  }
}
