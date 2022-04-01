import 'package:flutter/material.dart';
import 'package:rickandmortyapi/features/main/widgets/main_list_view.dart';

class MainView extends StatelessWidget {
  static const route = '/';

  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Ricky and Morti'),
      ),
      body: const SafeArea(child: MainListView()),
    );
  }
}
