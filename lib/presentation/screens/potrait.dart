import 'package:calculator_app/constants/character_constants.dart';
import 'package:calculator_app/constants/color_constants.dart';
import 'package:calculator_app/core/exports.dart';
import 'package:calculator_app/core/routes.dart';
import 'package:calculator_app/presentation/widgets/indicator_widget.dart';
import 'package:calculator_app/presentation/widgets/mic_widget.dart';
import 'package:calculator_app/presentation/widgets/result_widget.dart';

class Potrait extends StatefulWidget {
  const Potrait({Key key}) : super(key: key);

  @override
  _PotraitState createState() => _PotraitState();
}

class _PotraitState extends State<Potrait> {
  //
  final GlobalKey _floatingKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 300.h,
                  width: 350.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Switcher(),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                // rotate screen
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.landscapeLeft,
                                  DeviceOrientation.landscapeRight,
                                ]);
                              },
                              icon: Icon(
                                Iconsax.math,
                                color: primaryColor,
                                size: 20.sp,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // setting page
                                Navigator.pushNamed(
                                    context, RouteGenerator.setting);
                              },
                              icon: Icon(
                                Iconsax.setting,
                                color: primaryColor,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ResultWidget(),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Material(
                      elevation: 1,
                      color: theme.backgroundColor,
                      child: DraggableScrollableSheet(
                        maxChildSize: 0.95,
                        initialChildSize: 0.95,
                        minChildSize: 0.5,
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            color: greyTextColor.withOpacity(0.05),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(children: [
                                SizedBox(height: 10.h),
                                indicator(),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: potraitNum.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                  ),
                                  itemBuilder: (_, index) {
                                    final snapshot = potraitNum[index];
                                    return ButtonWidget(character: snapshot);
                                  },
                                )
                              ]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DraggableMic(key: _floatingKey)
          ],
        ),
      ),
    );
  }
}
