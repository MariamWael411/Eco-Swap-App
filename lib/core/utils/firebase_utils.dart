import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_swap_app/features/network/model/item_dto.dart';

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

  static CollectionReference<ItemDto> getItemCollection() {
    return FirebaseFirestore.instance
        .collection(ItemDto.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return ItemDto.fromJson(snapshot.data()!);
          },
          toFirestore: (item, options) {
            return item.toJson();
          },
        );
  }

  static Future<void> addItemInFireStore(ItemDto item) {
    var collectionRef = getItemCollection();
    var docRef = collectionRef.doc();
    item.itemId = docRef.id;
    return docRef.set(item);
  }

  static Stream<List<ItemDto>> getAllItems() {
    var stream = FirebaseUtils.getItemCollection().snapshots();
    return stream.map((query) {
      return query.docs.map((element) {
        return element.data();
      }).toList();
    });
  }

  static Stream<List<ItemDto>> getFilterItems({required int selectedIndex}) {
    var stream = FirebaseUtils.getItemCollection()
        .where('category', isEqualTo: selectedIndex)
        .snapshots();
    return stream.map((query) {
      return query.docs.map((doc) {
        return doc.data();
      }).toList();
    });
  }

  static Future<void> updateItem(ItemDto item) {
    return getItemCollection().doc(item.itemId).update({
      'image': item.imageUrl,
      'status': item.status,
      'condition': item.condionIndex,
      'category': item.categoryIndex,
      'description': item.description,
      'title': item.title,
    });
  }

  static Future<void> deleItem(ItemDto item) {
    return getItemCollection().doc(item.itemId).delete();
  }
}
