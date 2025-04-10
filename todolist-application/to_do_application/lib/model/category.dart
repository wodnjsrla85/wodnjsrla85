import 'package:flutter/material.dart';

class CategoryType {
  String id;
  String name;
  IconData icon;
  Color color;
  String ownerId; // 계정별 카테고리 관리용

  CategoryType({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.ownerId,
  });
}