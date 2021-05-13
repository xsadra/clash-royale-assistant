import 'package:clash_royale_assistant/clash/presentation/widgets/upcoming_chests_view.dart';
import 'package:flutter/material.dart';

class ProfileNestedTabPage extends StatefulWidget {
  @override
  _ProfileNestedTabPageState createState() => _ProfileNestedTabPageState();
}

class _ProfileNestedTabPageState extends State<ProfileNestedTabPage>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "Profile",
            ),
            Tab(
              text: "Upcoming",
            ),
            Tab(
              text: "Three",
            ),
            Tab(
              text: "Four",
            ),
            Tab(
              text: "Five",
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.72,
          // margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(8.0),
                  color: Colors.orangeAccent,
                ),
              ),
              Container(
                child: UpcomingChestsView(),
              ),
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(8.0),
                  color: Colors.greenAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.indigoAccent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }
}
