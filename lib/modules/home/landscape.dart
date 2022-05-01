import 'package:calculator_app/models/landscape_characters.dart';
import 'package:calculator_app/modules/home/potrait_view.dart';
import 'package:calculator_app/utils/exports.dart';
import 'package:calculator_app/widgets/landscape_widgets/landcape_buttons.dart';
import 'package:calculator_app/widgets/switch_widget.dart';

class Landscape extends StatefulWidget {
  const Landscape({Key key}) : super(key: key);

  @override
  _LandscapeState createState() => _LandscapeState();
}

class _LandscapeState extends State<Landscape> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Container(
              height: 270.h,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Switcher(),
                  ResultWidget(theme: theme),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: GridView.builder(
                          //  physics: NeverScrollableScrollPhysics(),
                          itemCount: landscapeNum.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 1.0,
                          ),
                          itemBuilder: (_, index) {
                            final snapshot = landscapeNum[index];
                            return LandscapeButton(
                              character: snapshot,
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 500.h,
                      width: 50.w,
                      child: Column(
                        children: [
                          Expanded(
                            child: PrimaryLandscapeButton(
                              character: "DEL",
                            ),
                          ),
                          Expanded(
                            child: PrimaryLandscapeButton(
                              character: "=",
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: GridView.builder(
                          //  physics: NeverScrollableScrollPhysics(),
                          itemCount: landcapeEqn.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 1.0,
                            mainAxisSpacing: 1.0,
                          ),
                          itemBuilder: (_, index) {
                            final snapshot = landcapeEqn[index];
                            return LandscapeButton(
                              character: snapshot,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
