import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/network/model/my_user_dto.dart';

class FirebaseUtils {
  static CollectionReference<MyUserDto> getCollection() {
    return FirebaseFirestore.instance
        .collection(MyUserDto.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return MyUserDto.fromJson(snapshot.data()!);
          },
          toFirestore: (user, options) {
            return user.toJson();
          },
        );
  }

  static Future<void> addUserInFireStore(MyUserDto user) {
    var collectionRef = getCollection();
    var docRef = collectionRef.doc(user.id);
    return docRef.set(user);
  }

  static Stream<MyUserDto?> getUserFromFireStore(String userId) {
    var stream = getCollection().doc(userId).snapshots();
    return stream.map((query) {
      return query.data();
    });
  }

  static Future<void> updateUser(MyUserDto newUser) {
    return getCollection().doc(newUser.id).update({
      'name': newUser.fullName,
      'phone': newUser.mobilNumber,
      'email': newUser.email,
    });
  }
}
