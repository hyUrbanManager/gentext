import 'package:get/get.dart';

class MainController extends GetxController {

  static const _tag = "@MainController";

  late SharedPreferences _prefs;


  @override
  void onInit() {
    super.onInit();

    _prefs = await SharedPreferences.getInstance();
  }


}
