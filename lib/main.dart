import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickandmortyapi/shared/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => GetMaterialApp(
        navigatorKey: Get.key,
        debugShowCheckedModeBanner: false,
        enableLog: true,
        title: 'Ricky and Morti',
        initialRoute: '/',
        getPages: RouteGenerator.route,
      ),
    );
  }
}
