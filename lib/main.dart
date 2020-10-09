import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gabut/cubit/news/news_cubit.dart';
import 'package:gabut/di/components/app_component.dart';
import 'package:gabut/di/modules/local_module.dart';
import 'package:gabut/di/modules/network_module.dart';
import 'package:gabut/ui/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

AppComponent appComponent;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    appComponent = await AppComponent.create(
      NetworkModule(),
      LocalModule(),
    );
    runApp(appComponent.app);
  });
}

class GabutMovieApp extends StatefulWidget {
  GabutMovieApp({Key key}) : super(key: key);

  @override
  _GabutMovieAppState createState() => _GabutMovieAppState();
}

class _GabutMovieAppState extends State<GabutMovieApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: BlocProvider(
        create: (context) => NewsCubit(appComponent.getRepository()),
        child: HomeScreen(),
      ),
    );
  }
}
