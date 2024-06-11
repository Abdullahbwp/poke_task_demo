import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/service/navigation/locator.dart';
import 'package:task_demo/service/navigation/navigation_service.dart';
import 'package:task_demo/service/navigation/router.dart';
import 'package:task_demo/src/poke/bloc/poke_bloc.dart';
import 'package:task_demo/src/poke/view/poke_view.dart';
import 'package:task_demo/src/widget/splash_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PokeBloc())],
      child: MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(),
        onGenerateRoute: generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
