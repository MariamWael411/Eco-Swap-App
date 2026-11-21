class MyUserDto {
  static String collectionName = 'User';
  String id;
  String fullName;
  String email;
  String mobilNumber;

  MyUserDto({
    required this.id,
    required this.email,
    required this.fullName,
    required this.mobilNumber,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': fullName, 'email': email, 'phone': mobilNumber};
  }

  MyUserDto.fromJson(Map<String, dynamic> data)
    : this(
        id: data['id'],
        email: data['email'],
        fullName: data['name'],
        mobilNumber: data['phone'],
      );
}
