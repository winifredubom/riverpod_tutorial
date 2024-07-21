import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String name;
  final String address;

  const User(this.name, this.address);

  @override

  List<Object?> get props => [name, address];
}