import 'package:get/get.dart';
import 'package:project_kelas/model/mahasiswa.dart';

class CMahasiswa extends GetxController {
  Rx<Mahasiswa> _mahasiswa = Mahasiswa().obs;

  Mahasiswa get user => _mahasiswa.value;

  void setUser(Mahasiswa dataMahasiswa) => _mahasiswa.value = dataMahasiswa;
}
