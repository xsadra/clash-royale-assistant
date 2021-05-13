import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'clash/presentation/bloc/upcomingchest/bloc.dart';
import 'clash/presentation/pages/home_page.dart';
import 'core/constants/texts.dart';
import 'injection_container.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData().copyWith(
        primaryColor: Color(0xFF190F2A),
      ),
      home: BlocProvider(
        create: (context) => injection.sl<UpcomingChestsBloc>(),
        child: HomePage(),
      ),
    );
  }
}
