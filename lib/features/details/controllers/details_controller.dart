import 'package:get/get.dart';
import 'package:rickandmortyapi/shared/models/character.dart';

class DetailsController extends GetxController {
  final _character = Character.zero().obs;
  Rx<Character> get character => _character;

  @override
  void onInit() {
    super.onInit();
    _character.value = Get.arguments['character'];
  }
}
