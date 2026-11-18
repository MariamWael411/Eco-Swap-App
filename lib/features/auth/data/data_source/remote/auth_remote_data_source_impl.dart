import 'package:eco_swap_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:eco_swap_app/features/auth/data/model/my_user_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<void> forgetPass(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<MyUserDto> login(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    MyUserDto myUserDto = MyUserDto(
      id: credential.user!.uid,
      email: email,
      fullName: credential.user!.displayName ?? "",
      mobilNumber: credential.user!.phoneNumber ?? "",
    );
    return myUserDto;
  }

  @override
  Future<MyUserDto> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    // Initialize first
    await googleSignIn.initialize(
      serverClientId:
          '1033538857950-us1loq6i51vf0dght6f30mbti9ud0uj9.apps.googleusercontent.com',
    );

    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

    // Obtain the auth details
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    MyUserDto myUserDto = MyUserDto(
      id: userCredential.user!.uid,
      email: userCredential.user!.email ?? "",
      fullName: userCredential.user!.displayName ?? "",
      mobilNumber: userCredential.user!.phoneNumber ?? "",
    );
    return myUserDto;
  }

  @override
  Future<MyUserDto> register(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    MyUserDto myUserDto = MyUserDto(
      email: credential.user!.email ?? "",
      fullName: fullName,
      mobilNumber: phoneNumber,
      id: credential.user!.uid,
    );
    return myUserDto;
  }
}
