//an abstract class that we are gone use in ui
import 'package:user_repository/src/models/models.dart';

abstract class UserRepository{
  Future <void> Signup(MyUser myuser,String Password);
Future <void> Sigin(String email,String password);
Future <void> logout();

Future <void> resetPassword(String email);
}