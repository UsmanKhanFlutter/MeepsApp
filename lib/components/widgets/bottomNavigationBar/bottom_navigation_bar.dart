import 'package:flutter/material.dart';
import 'package:meeps/components/responsiveBloc/size_config.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/homeScreen/home.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  @override
  void initState() {
    var prov = Provider.of<StateSettingProvider>(context, listen: false);
    if (!prov.chatSelected &&
        !prov.popularPostAndFollowingSelected &&
        !prov.storeSelected &&
        !prov.youtubeSelected &&
        !prov.inAvatarSettings) {
      prov.homeSelected = true;
    } else {
      prov.homeSelected = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provData = Provider.of<StateSettingProvider>(context);
    var screenWidth = SizeConfig.widthMultiplier;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 5),
            height: screenWidth * 11.5,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        provData.bottomNavigationValueChanges(home: true);

                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => home()));
                        if (provData.inAvatarSettings) {
                          provData.avatarSettingsLeft();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => home()));
                        }
                      },
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(right: screenWidth * 5),
                        child: Center(
                          child: Image.asset(
                            provData.homeSelected
                                ? 'assets/bottom_navigation_icons/home_colored.png'
                                : 'assets/bottom_navigation_icons/home.png',
                            height: screenWidth * 6,
                            width: screenWidth * 6,
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      provData.bottomNavigationValueChanges(youtube: true);

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => home()));
                      if (provData.inAvatarSettings) {
                        provData.avatarSettingsLeft();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => home()));
                      }
                    },
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(right: screenWidth * 5),
                      child: Center(
                        child: Image.asset(
                          provData.youtubeSelected
                              ? 'assets/bottom_navigation_icons/youtube_colored.png'
                              : 'assets/bottom_navigation_icons/youtube.png',
                          height: screenWidth * 7,
                          width: screenWidth * 7,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: const SizedBox()),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      provData.bottomNavigationValueChanges(chat: true);

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => home()));
                      if (provData.inAvatarSettings) {
                        provData.avatarSettingsLeft();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => home()));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: screenWidth * 5),
                      color: Colors.white,
                      child: Center(
                        child: Image.asset(
                          provData.chatSelected
                              ? 'assets/bottom_navigation_icons/chat_colored.png'
                              : 'assets/bottom_navigation_icons/chat.png',
                          height: screenWidth * 6.5,
                          width: screenWidth * 6.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      provData.bottomNavigationValueChanges(store: true);

                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => home()));
                      if (provData.inAvatarSettings) {
                        provData.avatarSettingsLeft();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => home()));
                      }
                    },
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: screenWidth * 5),
                      child: Center(
                        child: Image.asset(
                          provData.storeSelected
                              ? 'assets/bottom_navigation_icons/store_colored.png'
                              : 'assets/bottom_navigation_icons/store.png',
                          height: screenWidth * 6.5,
                          width: screenWidth * 6.5,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            provData.bottomNavigationValueChanges(popular: true);

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => home()));
            if (provData.inAvatarSettings) {
              provData.avatarSettingsLeft();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => home()));
            }
          },
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/person.png',
              height: screenWidth * 26,
              width: screenWidth * 26,
            ),
          ),
        )
      ]),
    );
  }
}
