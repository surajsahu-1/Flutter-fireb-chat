import 'package:fb_chat_app/firebase_options.dart';
import 'package:fb_chat_app/services/alert_service.dart';
import 'package:fb_chat_app/services/aut_service.dart';
import 'package:fb_chat_app/services/navigation_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

Future<void> setupFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> registerService() async {
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<NavigationService>(
    NavigationService(),
  );
  getIt.registerSingleton<AleartService>(
    AleartService(),
  );
}
