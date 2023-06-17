import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/model/mahasiswa.dart';
import 'package:project_kelas/screen/admin/add_update_mahasiswa.dart';
// import 'package:project_kelas/screen/admin/add_update_mahasiswa.dart';

import '../../model/mahasiswa.dart';

class ListMahasiswa extends StatefulWidget {
  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  List<Mahasiswa> _listMahasiswa = [];

  void getMahasiswa() async {
    _listMahasiswa = await EventDb.getMahasiswa();

    setState(() {});
  }

  @override
  void initState() {
    getMahasiswa();
    super.initState();
  }

  void showOption(Mahasiswa? mahasiswa) async {
    var result = await Get.dialog(
        SimpleDialog(
          children: [
            ListTile(
              onTap: () => Get.back(result: 'update'),
              title: Text('Update'),
            ),
            ListTile(
              onTap: () => Get.back(result: 'delete'),
              title: Text('Delete'),
            ),
            ListTile(
              onTap: () => Get.back(),
              title: Text('Close'),
            )
          ],
        ),
        barrierDismissible: false);
    switch (result) {
      case 'update':
        Get.to(AddUpdateMahasiswa(mahasiswa: mahasiswa))
            ?.then((value) => getMahasiswa());
        break;
      case 'delete':
        EventDb.deleteMahasiswa(mahasiswa!.mhsNpm!)
            .then((value) => getMahasiswa());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 0,
        title: Text('List Mahasiswa'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          _listMahasiswa.length > 0
              ? ListView.builder(
                  itemCount: _listMahasiswa.length,
                  itemBuilder: (context, index) {
                    Mahasiswa mahasiswa = _listMahasiswa[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(mahasiswa.mhsNama ?? ''),
                      subtitle: Text(mahasiswa.mhsNpm ?? ''),
                      trailing: IconButton(
                          onPressed: () => showOption(mahasiswa),
                          icon: Icon(Icons.more_vert)),
                    );
                  },
                )
              : Center(
                  child: Text("Data Kosong"),
                ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () =>
                  Get.to(AddUpdateMahasiswa())?.then((value) => getMahasiswa()),
              child: Icon(Icons.add),
              backgroundColor: Asset.colorAccent,
            ),
          )
        ],
      ),
    );
  }
}
