// landcape number pads
import 'package:calculator_app/utils/exports.dart';

class PrimaryLandscapeButton extends StatelessWidget {
  final String character;

  const PrimaryLandscapeButton({Key key, this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20.sp),
        child: Container(
          decoration: BoxDecoration(
            color: character == "=" ? theme.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(20.sp),
          ),
          alignment: character == "=" ? Alignment.center : Alignment.center,
          child: Text(
            character,
            style: theme.textTheme.bodyText2.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              // ignore: deprecated_member_use
              color: character == "=" ? theme.backgroundColor : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

// landscape number pads
class LandscapeButton extends StatelessWidget {
  final String character;

  const LandscapeButton({Key key, this.character}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        //
      },
      child: Container(
        height: 10,
        width: 10,
        child: Text(
          character,
          style: theme.textTheme.bodyText2.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
