import 'package:flutter/material.dart';

class PetServiceModel {
  static const _petNames = ['Rocket', 'Cici', 'Charlie'];

  Item getById(int id) => Item(id, _petNames[id % _petNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int age = 3;

  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
