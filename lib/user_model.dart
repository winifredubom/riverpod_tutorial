class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  final int id;

  UserModel({
    required this.avatar,
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      avatar: json['avatar'],
       id: json['id'],
        lastName: json['last_name'],
         firstName: json['first_name'],
          email: json['email']);
  }
}