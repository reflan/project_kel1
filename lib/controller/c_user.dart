import 'package:get/get.dart';
import 'package:project_kelas/model/user.dart';

class CUser extends GetxController {
  Rx<User> _user = User().obs;

  User get user => _user.value;

  void setUser(User dataUser) => _user.value = dataUser;
}
