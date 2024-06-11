import 'package:flutter/material.dart';

import '../../service/navigation/locator.dart';
import '../../service/navigation/navigation_service.dart';
import '../../service/navigation/router_path.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late NavigationService _navigationService;


  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();

    Future.delayed(const Duration(seconds: 1), (){
      _navigationService.navigateTo(pokeListPage);
    });
  }
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
