import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rickandmortyapi/features/details/views/details_view.dart';
import 'package:rickandmortyapi/features/main/repositories/main_repository.dart';
import 'package:rickandmortyapi/shared/models/character.dart';
import 'package:rickandmortyapi/shared/models/datum.dart';

class MainController extends GetxController {
  final MainRepository _mainRepository = MainRepository();
  var _currentPage = 0;

  final PagingController<int, Character> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchData(pageKey);
    });
  }

  void _fetchData(int pageKey) async {
    try {
      Map<String, dynamic> repoData =
          await _mainRepository.getData(_currentPage.toString());

      final datum = Datum.fromJson(repoData);

      if (_currentPage >= datum.info.pages) {
        pagingController.appendLastPage(datum.characters);
      } else {
        final nextPageKey = pageKey + datum.characters.length;
        pagingController.appendPage(
          datum.characters,
          nextPageKey,
        );
      }
      _currentPage += 1;
    } catch (error) {
      pagingController.error = error;
    }
  }

  void goto(Character character) {
    Get.toNamed(
      DetailsView.route,
      arguments: {'character': character},
    );
  }
}
