import 'package:calculator_app/core/exports.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> showToast({message}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: Colors.white,
  );
}
