import 'package:get/get.dart';
import 'package:rickandmortyapi/features/details/bindings/details_binding.dart';
import 'package:rickandmortyapi/features/details/views/details_view.dart';
import 'package:rickandmortyapi/features/main/bindings/main_binding.dart';
import 'package:rickandmortyapi/features/main/views/main_view.dart';

class RouteGenerator {
  static final route = [
    GetPage(
      name: MainView.route,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: DetailsView.route,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
  ];
}
