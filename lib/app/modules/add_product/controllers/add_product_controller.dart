import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNPM;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String nama, String NPM) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");
    try {
      await mahasiswa.add({
        "name": nama,
        "price": NPM,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data produk",
          onConfirm: () {
            cNama.clear();
            cNPM.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cNPM = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cNPM.dispose();
    super.onClose();
  }
}
