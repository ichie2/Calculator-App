import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/core/exports.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.backgroundColor,
          iconTheme: IconThemeData(color: blackIconColor),
          title: Text(
            'Settings',
            style: TextStyle(
              color: blackTextColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
