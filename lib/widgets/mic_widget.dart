import 'package:calculator_app/utils/exports.dart';

class MicWidget extends StatefulWidget {
  const MicWidget({Key key}) : super(key: key);
  @override
  _MicWidgetState createState() => _MicWidgetState();
}

class _MicWidgetState extends State<MicWidget> {
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.white)),
      child: FloatingActionButton(
        onPressed: () {
          //
        },
      ),
    );
  }
}
