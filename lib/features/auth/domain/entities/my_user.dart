class MyUser {
  String id;
  String fullName;
  String email;
  String mobilNumber;
  String userName;
  int? numberOfSharedItem;

  MyUser({
    required this.id,
    required this.email,
    required this.fullName,
    required this.mobilNumber,
    required this.userName,
    this.numberOfSharedItem
  });
}
