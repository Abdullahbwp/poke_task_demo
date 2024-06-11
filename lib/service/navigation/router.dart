import 'package:flutter/material.dart';
import '../../src/poke/view/poke_detail_view.dart';
import '../../src/poke/view/poke_view.dart';
import 'router_path.dart' as routes;
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.pokeListPage:
      print("generateRoute...........${routes.pokeListPage}");
      return PageTransition(
        duration:const  Duration(milliseconds: 500),
        type: PageTransitionType.rightToLeft,
        child:  const PokeView()
      );
    case routes.pokeDetailPage:
      return PageTransition(
          duration:const  Duration(milliseconds: 500),
          type: PageTransitionType.rightToLeft,
          child:  PokeDetailView(map: settings.arguments as Map)
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
