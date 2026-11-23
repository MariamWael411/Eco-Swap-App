import 'package:eco_swap_app/core/utils/firebase_utils.dart';
import 'package:eco_swap_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../../../../cubit/my_user_cubit.dart';
import '../../../../network/model/my_user_dto.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> forgetPass(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<MyUserDto> login(String email, String password,
      BuildContext context) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = await FirebaseUtils
        .getUserFromFireStore(credential.user!.uid)
        .first;

    // 3. Check if user data exists
    if (user == null) {
      throw Exception("User data not found");
    }

    // 4. Update MyUserCubit
    context.read<MyUserCubit>().changeUser(user);

    // 5. Return updated user data
    return user;

  }

  @override

  Future<MyUserDto> loginWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
      serverClientId:
      '1033538857950-us1loq6i51vf0dght6f30mbti9ud0uj9.apps.googleusercontent.com',
    );

    final GoogleSignInAccount googleUser =
    await googleSignIn.authenticate();

    final GoogleSignInAuthentication googleAuth =
        googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    final userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);

    final firebaseUser = userCredential.user!;

    final existingUser = await FirebaseUtils
        .getUserFromFireStore(firebaseUser.uid)
        .first;

    if (existingUser != null) {
      context.read<MyUserCubit>().changeUser(existingUser);
      return existingUser;
    }

    final myUserDto = MyUserDto(
      userName: "",
      id: firebaseUser.uid,
      email: firebaseUser.email ?? "",
      fullName: firebaseUser.displayName ?? "",
      mobilNumber: firebaseUser.phoneNumber ?? "",
      numberOfSharedItem: 0,
    );

    await FirebaseUtils.addUserInFireStore(myUserDto);

    context.read<MyUserCubit>().changeUser(myUserDto);

    return myUserDto;
  }


  @override
  Future<MyUserDto> register(
    String email,
    String password,
    String fullName,
    String phoneNumber,
      String userName,
      BuildContext context
  ) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    MyUserDto myUserDto = MyUserDto(
      email: credential.user!.email ?? "",
      fullName: fullName,
      mobilNumber: phoneNumber,
      id: credential.user!.uid,
        userName: userName,
        numberOfSharedItem: 0
    );
    FirebaseUtils.addUserInFireStore(myUserDto);
    context.read<MyUserCubit>().changeUser(myUserDto);



    return myUserDto;
  }
}
