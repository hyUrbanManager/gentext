import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  static const _tag = "@MainController";

  static const _keyName = "name";
  static const _keyText = "text";

  late SharedPreferences _prefs;

  TextEditingController nameController = TextEditingController();
  TextEditingController rawTextController = TextEditingController();

  final generateList = [""].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    _prefs = await SharedPreferences.getInstance();

    String? saveName = _prefs.getString(_keyName);
    String? saveRawText = _prefs.getString(_keyText);

    saveName ??= "吴洁敏,黄业";
    saveRawText ??= "%s早上好，今天早上9点记得来上课哦";

    nameController.text = saveName;
    rawTextController.text = saveRawText;

    generate();
  }

  void generate() {
    try {
      generateList.clear();
      for (String s in nameController.text.split(",")) {
        generateList.add(rawTextController.text.trArgs([s]));
      }
    } catch (e) {
      print("error $e");
      Get.snackbar("error", "$e");
    }
  }
}
