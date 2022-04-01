import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmortyapi/features/details/controllers/details_controller.dart';
import 'package:rickandmortyapi/features/details/widgets/details_block.dart';

class DetailsView extends GetView<DetailsController> {
  static const route = '/detailsView';

  const DetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(controller.character.value.name),
      ),
      body: SafeArea(
        child: DetailsBlock(
          character: controller.character.value,
        ),
      ),
    );
  }
}
