import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rickandmortyapi/features/main/controllers/main_controller.dart';
import 'package:rickandmortyapi/features/main/widgets/main_view_container.dart';
import 'package:rickandmortyapi/shared/models/character.dart';

class MainListView extends StatelessWidget {
  const MainListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();

    return PagedListView<int, Character>(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      pagingController: mainController.pagingController,
      builderDelegate: PagedChildBuilderDelegate<Character>(
        itemBuilder: (context, item, index) {
          return MainViewContainer(
            character: item,
            onTap: mainController.goto,
          );
        },
        noItemsFoundIndicatorBuilder: (context) {
          return const Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'No data',
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
