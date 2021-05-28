import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'clash/presentation/bloc/currentplayertag/bloc.dart';
import 'core/constants/texts.dart';
import 'core/routes/router.gr.dart';
import 'injection_container.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => injection.sl<CurrentPlayerTagBloc>()
              ..add(GetCurrentPlayerTagEvent())),
      ],
      child: MaterialApp(
        title: APP_TITLE,

        builder: ExtendedNavigator(router: Router()),
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          primaryColor: Color(0xFF190F2A),
        ),
        //home: HomePage(),
      ),
    );
  }
}
