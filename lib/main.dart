import 'dart:io';
import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/core/routes.dart';
import 'package:calculator_app/logic/cubit/answer_cubit.dart';
import 'package:calculator_app/logic/cubit/input_cubit.dart';
import 'package:calculator_app/core/exports.dart';
import 'package:calculator_app/logic/cubit/internet_cubit.dart';
import 'package:calculator_app/logic/cubit/theme_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await path.getApplicationDocumentsDirectory();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: directory);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AnswerCubit>(create: (context) => AnswerCubit()),
        BlocProvider<InputCubit>(
            create: (context) => InputCubit(context.read<AnswerCubit>())),
        BlocProvider(create: (context) => InternetCubit(Connectivity())),
        BlocProvider(create: (context) => ThemeCubit())
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 825),
        builder: () {
          return BlocBuilder<ThemeCubit, bool>(
            builder: (context, state) {
              return MaterialApp(
                color: whiteColor,
                debugShowCheckedModeBanner: false,
                title: 'Calculator Pro',
                themeMode: state ? ThemeMode.dark : ThemeMode.light,
                theme: CustomTheme.lightTheme(),
                darkTheme: CustomTheme.darkTheme(),
                home: Home(),
                initialRoute: RouteGenerator.home,
                onGenerateRoute: RouteGenerator.generateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
