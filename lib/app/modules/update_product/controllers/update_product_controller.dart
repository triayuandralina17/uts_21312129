import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNPM;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    return docRef.get();
  }

  void updateProduct(String nama, String harga, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa").doc(id);

    try {
      await productById.update({
        "name": nama,
        "price": harga,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data mahasiswa.",
        onConfirm: () {
          cNama.clear();
          cNPM.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal menambahkan mahasiswa.",
      );
    }
  }

  @override
  void onInit() {
    cNama = TextEditingController();
    cNPM = TextEditingController();
    super.onInit();
  }

  void onClose() {
    cNama.dispose();
    cNPM.dispose();
    super.onClose();
  }
}
