import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/screen/admin/list_dosen.dart';
import 'package:project_kelas/widget/info.dart';

import '../../model/dosen.dart';

class AddUpdateDosen extends StatefulWidget {
  final Dosen? dosen;
  AddUpdateDosen({this.dosen});

  @override
  State<AddUpdateDosen> createState() => _AddUpdateDosenState();
}

class _AddUpdateDosenState extends State<AddUpdateDosen> {
  var _formKey = GlobalKey<FormState>();
  var _controllerNidn = TextEditingController();
  var _controllerNama = TextEditingController();
  var _controllerAlamat = TextEditingController();
  var _controllerGol = TextEditingController();
  var _controllerProdi = TextEditingController();

  bool _isHidden = true;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.dosen != null) {
      _controllerNidn.text = widget.dosen!.dsnNidn!;
      _controllerNama.text = widget.dosen!.dsnNama!;
      _controllerAlamat.text = widget.dosen!.dsnAlamat!;
      _controllerGol.text = widget.dosen!.dsnGol!;
      _controllerProdi.text = widget.dosen!.dsnProdi!;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 0,
        title:
            widget.dosen != null ? Text('Update Dosen') : Text('Tambah Dosen'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.dosen == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNidn,
                  decoration: InputDecoration(
                      labelText: "NIDN",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNama,
                  decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerAlamat,
                  decoration: InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerGol,
                  decoration: InputDecoration(
                      labelText: "Golongan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerProdi,
                  decoration: InputDecoration(
                      labelText: "Prodi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.dosen == null) {
                        String message = await EventDb.AddDosen(
                          _controllerNidn.text,
                          _controllerNama.text,
                          _controllerAlamat.text,
                          _controllerGol.text,
                          _controllerProdi.text,
                        );
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerNidn.clear();
                          _controllerNama.clear();
                          _controllerAlamat.clear();
                          _controllerGol.clear();
                          _controllerProdi.clear();
                          Get.off(
                            ListDosen(),
                          );
                        }
                      } else {
                        EventDb.UpdateDosen(
                          _controllerNidn.text,
                          _controllerNama.text,
                          _controllerAlamat.text,
                          _controllerGol.text,
                          _controllerProdi.text,
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.dosen == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Asset.colorAccent,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
