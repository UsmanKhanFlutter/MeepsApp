import 'package:flutter/cupertino.dart';

class StateSettingProvider with ChangeNotifier {
  bool homeSelected = true;
  bool youtubeSelected = false;
  bool popularPostAndFollowingSelected = false;
  bool chatSelected = false;
  bool storeSelected = false;
  bool showCarRentalFilter = false;
  bool showProfileTabSlidingPage2Filter = false;
  bool showLuckySevenSlidingUpDetails = false;
  bool showExistingPostSlideUp = false;
  bool showCostExistingPostSlideUp = false;
  bool showExistingPostAlertBox = false;
  bool showCostExistingPostAlertBox = false;
  bool showExpensesPopup = false;
  bool showDepositsPopup = false;
  bool showCostExpensesPopup = false;
  bool showCostDepositsPopup = false;
  bool isCostExpensesDone = false;
  bool inAvatarSettings = true;
  bool isExpensesDone = false;
  bottomNavigationValueChanges(
      {home = false,
      youtube = false,
      popular = false,
      chat = false,
      store = false}) {
    homeSelected = home;
    youtubeSelected = youtube;
    popularPostAndFollowingSelected = popular;
    chatSelected = chat;
    storeSelected = store;

    notifyListeners();
  }

  avatarSettingsLeft() {
    inAvatarSettings = false;
  }

  showCarRentalFilterBLock() {
    showCarRentalFilter = true;
    notifyListeners();
  }

  hideCarRentalFilterBLock() {
    showCarRentalFilter = false;
    notifyListeners();
  }

  showProfileTabSlidingPage2FilterBLock() {
    showProfileTabSlidingPage2Filter = true;
    notifyListeners();
  }

  hideProfileTabSlidingPage2FilterBLock() {
    showProfileTabSlidingPage2Filter = false;
    notifyListeners();
  }

  showLuckySevenSlidingUpDetailsBLock() {
    showLuckySevenSlidingUpDetails = true;
    notifyListeners();
  }

  hideLuckySevenSlidingUpDetailsBLock() {
    showLuckySevenSlidingUpDetails = false;
    notifyListeners();
  }

  showExistingPostSlideUpBLock() {
    showExistingPostSlideUp = true;
    notifyListeners();
  }

  hideExistingPostSlideUpBLock() {
    showExistingPostSlideUp = false;
    notifyListeners();
  }

  showExistingPostAlertBLock() {
    showExistingPostAlertBox = true;
    notifyListeners();
  }

  hideExistingPostAlertBLock() {
    showExistingPostAlertBox = false;
    notifyListeners();
  }

  showExpensesPopupBlock() {
    showExpensesPopup = true;
    notifyListeners();
  }

  hideExpensesPopupBlock() {
    showExpensesPopup = false;
    notifyListeners();
  }

  showDepositsPopupBlock() {
    showDepositsPopup = true;
    notifyListeners();
  }

  hideDepositsPopupBlock() {
    showDepositsPopup = false;
    notifyListeners();
  }

  showIsExpensesDone() {
    isExpensesDone = true;
    notifyListeners();
  }

  showIsExpensesCancel() {
    isExpensesDone = false;
    notifyListeners();
  }

  showCostExpensesPopupBlock() {
    showCostExpensesPopup = true;
    notifyListeners();
  }

  hideCostExpensesPopupBlock() {
    showCostExpensesPopup = false;
    notifyListeners();
  }

  showCostDepositsPopupBlock() {
    showCostDepositsPopup = true;
    notifyListeners();
  }

  hideCostDepositsPopupBlock() {
    showCostDepositsPopup = false;
    notifyListeners();
  }

  showIsCostExpensesDone() {
    isCostExpensesDone = true;
    notifyListeners();
  }

  showIsCostExpensesCancel() {
    isCostExpensesDone = false;
    notifyListeners();
  }

  showCostExistingPostSlideUpBLock() {
    showCostExistingPostSlideUp = true;
    notifyListeners();
  }

  hideCostExistingPostSlideUpBLock() {
    showCostExistingPostSlideUp = false;
    notifyListeners();
  }

  showCostExistingPostAlertBLock() {
    showCostExistingPostAlertBox = true;
    notifyListeners();
  }

  hideCostExistingPostAlertBLock() {
    showCostExistingPostAlertBox = false;
    notifyListeners();
  }
}
