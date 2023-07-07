import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/BucketListItem_service.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Util/colorList.dart';

late SharedPreferences prefs;
void main() async {
  // 위젯 로딩전에 SharedPreference를 로드하기위해 사용
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BucketListItemService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorList().background,
        body: const Home(),
      ),
    );
  }
}
