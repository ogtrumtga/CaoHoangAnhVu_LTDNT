class UserModel {
  final String id;
  final String email;
  final String? phoneNumber;
  final List<String>? roles;

  const UserModel({
    required this.id,
    required this.email,
    this.phoneNumber,
    this.roles,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      roles: json['roles'] != null ? List<String>.from(json['roles']) : null,
    );
  }
  

  

}