import 'package:get/get.dart';
import 'package:rickandmortyapi/features/details/controllers/details_controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailsController());
  }
}
