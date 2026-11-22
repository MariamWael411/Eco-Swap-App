class MyUserDto {
  static String collectionName = 'User';
  String id;
  String fullName;
  String email;
  String mobilNumber;
  String userName;
  int? numberOfSharedItem;

  MyUserDto({
    required this.id,
    required this.email,
    required this.fullName,
    required this.mobilNumber,
    required this.userName,
    this.numberOfSharedItem
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': fullName,
      'email': email,
      'phone': mobilNumber,
      'user_name': userName,
      'item_shared': numberOfSharedItem
    };
  }

  MyUserDto.fromJson(Map<String, dynamic> data)
    : this(
        id: data['id'],
        email: data['email'],
        fullName: data['name'],
        mobilNumber: data['phone'],
      userName: data['user_name'],
      numberOfSharedItem: data['item_shared']

      );

  MyUserDto copyWith({
    String? id,
    String? fullName,
    String? email,
    String? mobilNumber,
    String? userName,
    int? numberOfSharedItem,
  }) {
    return MyUserDto(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      mobilNumber: mobilNumber ?? this.mobilNumber,
      userName: userName ?? this.userName,
      numberOfSharedItem: numberOfSharedItem ?? this.numberOfSharedItem,
    );
  }
}
