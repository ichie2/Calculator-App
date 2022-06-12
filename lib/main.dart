import 'package:calculator_app/logic/cubit/answer_cubit.dart';
import 'package:calculator_app/logic/cubit/input_cubit.dart';
import 'package:calculator_app/core/exports.dart';
import 'package:calculator_app/logic/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<AnswerCubit>(create: (context) => AnswerCubit()),
        BlocProvider<InputCubit>(
            create: (context) => InputCubit(context.read<AnswerCubit>())),
        BlocProvider(create: (context) => InternetCubit(Connectivity()))
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 825),
        builder: () {
          return MaterialApp(
            color: Colors.white,
            debugShowCheckedModeBanner: false,
            title: 'Calculator Pro',
            theme: CustomTheme.lightTheme(),
            darkTheme: CustomTheme.darkTheme(),
            home: Home(),
          );
        },
      ),
    );
  }
}
