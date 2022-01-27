import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:meeps/components/widgets/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:meeps/global/allShadows/all_shadows.dart';
import 'package:meeps/providers/authencation_provider.dart';
import 'package:meeps/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:meeps/screens/chooseSignIn/signupWithEmail/signupWIthEmailPasswordprofileSettings/profileSettings2/profileSettingsChooseProfilePic/profile_settings_choose_profile_pic.dart';
import 'package:meeps/theme/colors.dart';
import 'package:provider/provider.dart';

class AvatarSettings extends StatefulWidget {
  @override
  State<AvatarSettings> createState() => _AvatarSettingsState();
}

class _AvatarSettingsState extends State<AvatarSettings> {
  bool allSelected = true;
  bool maleSelected = false;
  bool femaleSelected = false;
  bool nonBinarySelected = false;
  int selectedAvatarIndex = -1;

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthenticationProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.appBackgroundColor,
        appBar: appBar(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < categoryListNames.length; i++)
                              categoryNames(categoryListNames[i]['name'], i),
                          ],
                        ),
                      ),
                      Expanded(
                          child: SizedBox(
                        child: GridView.builder(
                          padding: EdgeInsets.only(bottom: 200),
                          itemCount: allSelected
                              ? allImagesList.length
                              : maleSelected
                                  ? maleImagesList.length
                                  : femaleSelected
                                      ? femaleImagesList.length
                                      : nonBinaryImagesList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 1.1),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAvatarIndex = index;

                                  authenticationProvider
                                          .userModel.profileImageUrl =
                                      'assets/face_icons/${allSelected ? allImagesList[index] : maleSelected ? maleImagesList[index] : femaleSelected ? femaleImagesList[index] : nonBinaryImagesList[index]}.jpg';
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent,
                                        width: selectedAvatarIndex == index
                                            ? 5.0
                                            : 0.0),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 4,
                                          offset: const Offset(1, 1),
                                          spreadRadius: 1,
                                          color: Colors.grey.shade600),
                                      const BoxShadow(
                                          offset: Offset(-2, -2),
                                          blurRadius: 4,
                                          spreadRadius: 2,
                                          color: Colors.white),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                            'assets/face_icons/${allSelected ? allImagesList[index] : maleSelected ? maleImagesList[index] : femaleSelected ? femaleImagesList[index] : nonBinaryImagesList[index]}.jpg'))),
                              ),
                            );
                          },
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              bottomNavigationBar(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      width: 190,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              offset: const Offset(1, 1),
                              spreadRadius: 1,
                              color: Colors.grey.shade600),
                          // const BoxShadow(
                          //     offset: Offset(-2, -2),
                          //     blurRadius: 4,
                          //     spreadRadius: 2,
                          //     color: Colors.white),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Choose ',
                              style: TextStyle(
                                  color: theme.darkTextColor, fontSize: 10)),
                          Text('your own Avatar ',
                              style: TextStyle(
                                  color: theme.mainColor, fontSize: 10)),
                          Text('to display here',
                              style: TextStyle(
                                  color: theme.darkTextColor, fontSize: 10)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 110,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////Widgets//////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

  AppBar appBar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey.shade600,
          size: 18,
        ),
      ),
      title: Text(
        'Avatar settings',
        style: TextStyle(color: theme.darkTextColor, fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Provider.of<StateSettingProvider>(context, listen: false)
                .avatarSettingsLeft();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => profileSettingsChooseProfilePic()));
          },
          child: Text('Next',
              style: TextStyle(color: theme.mainColor, fontSize: 16)),
        )
      ],
    );
  }

  Widget categoryNames(name, i) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categoryListNames[i]['selected'] = true;
          categoryListNames.forEach((element) {
            if (element == categoryListNames[i]) {
              if (element['name'] == 'All') {
                allSelected = true;
                maleSelected = false;
                femaleSelected = false;
                nonBinarySelected = false;
              }
              if (element['name'] == 'Male') {
                allSelected = false;
                maleSelected = true;
                femaleSelected = false;
                nonBinarySelected = false;
              }
              if (element['name'] == 'Female') {
                allSelected = false;
                maleSelected = false;
                femaleSelected = true;
                nonBinarySelected = false;
              }
              if (element['name'] == 'Non-Binary') {
                allSelected = false;
                maleSelected = false;
                femaleSelected = false;
                nonBinarySelected = true;
              }
            } else {
              element['selected'] = false;
            }
          });
        });
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          margin: const EdgeInsets.only(right: 10, bottom: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: categoryListNames[i]['selected']
                ? theme.coloredButtonColor
                : theme.appBackgroundColor,
            boxShadow: AllShadows().boxShadow(
              darkBlurRadius: 3,
              darkSpreadRadius: 1,
            ),
          ),
          child: Text(name,
              style: TextStyle(
                  color: categoryListNames[i]['selected']
                      ? Colors.white
                      : theme.darkTextColor,
                  fontSize: 12))),
    );
  }

  List<dynamic> categoryListNames = [
    {'name': 'All', 'selected': true},
    {'name': 'Male', 'selected': false},
    {'name': 'Female', 'selected': false},
    {'name': 'Non-Binary', 'selected': false},
  ];
  List<String> allImagesList = [
    'female0',
    'female1',
    'male28',
    'male38',
    'female2',
    'male53',
    'male54',
    'female3',
    'female4',
    'male29',
    'male37',
    'female5',
    'female6',
    'male11',
    'male12',
    'male13',
    'female7',
    'female8',
    'female9',
    'female10',
    'female11',
    'male14',
    'male15',
    'male21',
    'male22',
    'male23',
    'female12',
    'female16',
    'female26',
    'female27',
    'female28',
    'male51',
    'male52',
    'male55',
    'female29',
    'female30',
    'male16',
    'male17',
    'female13',
    'female14',
    'female15',
    'male18',
    'male19',
    'male20',
    'female31',
    'female32',
    'female35',
    'female36',
    'female37',
    'female38',
    'male40',
    'male41',
    'male42',
    'male43',
    'male44',
    'female41',
    'female42',
    'male30',
    'male31',
    'male32',
    'male33',
    'female17',
    'female18',
    'female19',
    'male34',
    'male35',
    'male36',
    'female43',
    'female44',
    'male48',
    'male49',
    'male50',
    'female39',
    'female40',
    'female45',
    'male3',
    'female47',
    'female48',
    'female49',
    'male0',
    'male1',
    'male2',
    'male4',
    'male5',
    'female33',
    'female34',
    'male8',
    'male9',
    'male10',
    'male24',
    'male25',
    'female20',
    'female21',
    'female22',
    'female23',
    'female24',
    'female25',
    'male26',
    'male27',
    'male39',
    'male56',
    'male57',
  ];
  List<String> maleImagesList = [
    'male0',
    'male1',
    'male2',
    'male3',
    'male4',
    'male5',
    'male6',
    'male7',
    'male8',
    'male9',
    'male10',
    'male11',
    'male12',
    'male13',
    'male14',
    'male15',
    'male16',
    'male17',
    'male18',
    'male19',
    'male20',
    'male21',
    'male22',
    'male23',
    'male24',
    'male25',
    'male26',
    'male27',
    'male28',
    'male29',
    'male30',
    'male31',
    'male32',
    'male33',
    'male34',
    'male35',
    'male36',
    'male37',
    'male38',
    'male39',
    'male40',
    'male41',
    'male42',
    'male43',
    'male44',
    'male45',
    'male46',
    'male47',
    'male48',
    'male49',
    'male50',
    'male51',
    'male52',
    'male53',
    'male54',
    'male55',
    'male56',
    'male57',
  ];
  List<String> femaleImagesList = [
    'female0',
    'female1',
    'female2',
    'female3',
    'female4',
    'female5',
    'female6',
    'female7',
    'female8',
    'female9',
    'female10',
    'female11',
    'female12',
    'female13',
    'female14',
    'female15',
    'female16',
    'female17',
    'female18',
    'female19',
    'female20',
    'female21',
    'female22',
    'female23',
    'female24',
    'female25',
    'female26',
    'female27',
    'female28',
    'female29',
    'female30',
    'female31',
    'female32',
    'female33',
    'female34',
    'female35',
    'female36',
    'female37',
    'female38',
    'female39',
    'female40',
    'female41',
    'female42',
    'female43',
    'female44',
    'female45',
    'female46',
    'female47',
    'female48',
    'female49'
  ];
  List<String> nonBinaryImagesList = [
    'babyFace0',
    'babyFace1',
    'botFace0',
    'botFace1',
    'botFace2',
    'botFace3',
    'botFace4',
    'botFace5',
    'botFace6',
    'botFace7',
    'botFace8',
    'botFace9',
  ];
}
