import 'package:animations_menu/constants/app_colors.dart';
import 'package:animations_menu/constants/app_images.dart';
import 'package:animations_menu/constants/app_strings.dart';
import 'package:animations_menu/constants/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MenuDashboard extends StatefulWidget {
  const MenuDashboard({Key? key}) : super(key: key);

  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard>
    with SingleTickerProviderStateMixin {
  late double ekranYuksekligi, ekranGenisligi;
  bool menuAcikMi = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _scaleMenuAnimation;
  late Animation<Offset> _menuOffsetAnimation;
  final Duration _duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween(begin: 1.0, end: 0.6).animate(_controller);
    _scaleMenuAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _menuOffsetAnimation = Tween(
            begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ekranYuksekligi = MediaQuery.of(context).size.height;
    ekranGenisligi = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorsConst().backgroundColur,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            menuOlustur(context),
            dashBoardOlustur(context),
          ],
        ),
      ),
    );
  }

  Widget menuOlustur(BuildContext context) {
    return SlideTransition(
      position: _menuOffsetAnimation,
      child: ScaleTransition(
        scale: _scaleMenuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Lottie.asset(
                        ImagesConst().profilImg,
                        height: 150,
                        width: 150,
                        reverse: true,
                      ),
                    ),
                    Text(
                      StringConst().rogarText,
                      style: TextStyleConst().menuFontStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.restaurant_menu,
                    color: ColorsConst().purpleColur,
                  ),
                  label: Text(
                    StringConst().dashText,
                    style: TextStyleConst().menuFontStyle,
                  ),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.message,
                    color: ColorsConst().purpleColur,
                  ),
                  label: Text(
                    StringConst().messaText,
                    style: TextStyleConst().menuFontStyle,
                  ),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.accessibility_new,
                    color: ColorsConst().purpleColur,
                  ),
                  label: Text(
                    StringConst().utilityText,
                    style: TextStyleConst().menuFontStyle,
                  ),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.transform,
                    color: ColorsConst().purpleColur,
                  ),
                  label: Text(
                    StringConst().fundsText,
                    style: TextStyleConst().menuFontStyle,
                  ),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.build,
                    color: ColorsConst().purpleColur,
                  ),
                  label: Text(
                    StringConst().brancText,
                    style: TextStyleConst().menuFontStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashBoardOlustur(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      top: 0,
      bottom: 0,
      left: menuAcikMi ? 0.4 * ekranGenisligi : 0,
      right: menuAcikMi ? -0.4 * ekranGenisligi : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius:
              menuAcikMi ? const BorderRadius.all(Radius.circular(40)) : null,
          elevation: 8,
          color: ColorsConst().backgroundColur,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (menuAcikMi) {
                              _controller.reverse();
                            } else {
                              _controller.forward();
                            }
                            menuAcikMi = !menuAcikMi;
                          });
                        },
                        child: Icon(
                          Icons.menu,
                          color: ColorsConst().whiteColur,
                        ),
                      ),
                      Text(
                        StringConst().tittleText,
                        style: TextStyle(
                            color: ColorsConst().whiteColur, fontSize: 24),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: ColorsConst().whiteColur,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 250,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          child: Lottie.asset(
                            ImagesConst().welcomeImg,
                            fit: BoxFit.cover,
                          ),
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                        ),
                        Container(
                          child: Lottie.asset(
                            ImagesConst().workmanImg,
                            fit: BoxFit.cover,
                          ),
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(
                            Icons.person,
                            color: ColorsConst().greenColur,
                          ),
                          title: Text("Person $index",
                              style: TextStyleConst().menuFontStyle),
                          trailing: Icon(
                            Icons.add,
                            color: ColorsConst().purpleColur,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 2,
                        );
                      },
                      itemCount: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
