import 'package:clash_royale_assistant/clash/presentation/pages/profile_nested_tab_page.dart';
import 'package:clash_royale_assistant/clash/presentation/widgets/bottom_navigation_bar.dart';
import 'package:clash_royale_assistant/core/constants/texts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
      ),
      body: ProfileNestedTabPage(),
      // body: ProfilePage(),
      bottomNavigationBar: BottomNavBar(),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
