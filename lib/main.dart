import 'package:calculator_app/logic/cubit/input_cubit.dart';
import 'package:calculator_app/utils/exports.dart';
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
    return ScreenUtilInit(
      designSize: Size(375, 825),
      builder: () {
        return MultiBlocProvider(
          providers: [
            BlocProvider<InputCubit>(create: (context) => InputCubit()),
          ],
          child: MaterialApp(
            color: Colors.white,
            debugShowCheckedModeBanner: false,
            title: 'Calculator Pro',
            theme: CustomTheme.lightTheme(),
            darkTheme: CustomTheme.darkTheme(),
            home: Home(),
          ),
        );
      },
    );
  }
}
