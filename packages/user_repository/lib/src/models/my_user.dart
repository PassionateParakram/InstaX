import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? picture;

  const MyUser(
      {required this.id,
      required this.email,
      required this.name,
      required this.picture});

  static const empty = MyUser(id: "", email: "", name: "", picture: "");

  //to modified the value we are using this
  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? picture,
  }) {
    return MyUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        picture: picture ?? this.picture);
  }

  bool get isEmpty => this ==MyUser.empty;
  bool get isNotEmpty => this != MyUser.empty;

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name, picture ];
}
