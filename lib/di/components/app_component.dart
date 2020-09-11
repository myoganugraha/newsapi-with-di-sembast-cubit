import 'package:gabut/data/repository.dart';
import 'package:gabut/di/modules/local_module.dart';
import 'package:gabut/di/modules/network_module.dart';
import 'package:inject/inject.dart';

import 'package:gabut/main.dart';
import 'app_component.inject.dart' as g;

@Injector(const [NetworkModule, LocalModule])
abstract class AppComponent {
  @provide
  GabutMovieApp get app;

  static Future<AppComponent> create(
      NetworkModule networkModule,
      LocalModule localModule
      ) async {
    return await g.AppComponent$Injector.create(
      networkModule,
      localModule,
    );
  }

  @provide
  Repository getRepository();
}
