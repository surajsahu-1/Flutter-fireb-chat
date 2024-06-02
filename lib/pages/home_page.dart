import 'package:fb_chat_app/services/alert_service.dart';
import 'package:fb_chat_app/services/aut_service.dart';
import 'package:fb_chat_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetIt _getIt = GetIt.instance;

  late AuthService _authService;

  late NavigationService _navigationService;

  late AleartService _aleartService;

  @override
  void initState() {
    super.initState();
    _navigationService = _getIt.get<NavigationService>();
    _authService = _getIt.get<AuthService>();
    _aleartService = _getIt.get<AleartService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
          actions: [
            IconButton(
              onPressed: () async {
                bool result = await _authService.logout();
                if (result) {
                  _navigationService.pushReplacementName('/login');
                  _aleartService.showToast(
                    text: 'Successfully logged out!',
                    icon: Icons.check,
                  );
                }
              },
              color: Colors.red,
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: const Center(
          child: Text('Home Page'),
        ));
  }
}
