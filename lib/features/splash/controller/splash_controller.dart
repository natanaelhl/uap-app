import 'package:uap_app/core/services/auth_service.dart';
import 'package:uap_app/features/splash/callbacks/splash_callbacks.dart';

class SplashController {
  final AuthService service;
  final SplashCallbacks callbacks;
  const SplashController(this.service, this.callbacks);

  handleAuthentication() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (service.instance.currentUser != null) {
        callbacks.navigatorPage('/personListView');
      } else {
        callbacks.navigatorPage('/loginView');
      }
    });
  }
}
