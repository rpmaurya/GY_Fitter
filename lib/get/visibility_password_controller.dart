import 'package:get/get.dart';

class VisibilityPasswordController extends GetxController {
  RxBool selectedLoginVisibility = true.obs;
  RxBool signupCreateVisibility = true.obs;
  RxBool signupConfirmVisibility = true.obs;
  RxBool resetNewVisibility = true.obs;
  RxBool resetConfirmVisibility = true.obs;
  RxBool profilePasswordVisibility = true.obs;
  RxBool newPasswordVisibility = true.obs;
  RxBool confirmPasswordVisibility = true.obs;
  RxBool upDatePasswordVisibility = true.obs;

  void showLoginVisibility() {
    selectedLoginVisibility.value = !selectedLoginVisibility.value;
  }

  void showSignupCreateVisibility() {
    signupCreateVisibility.value = !signupCreateVisibility.value;
  }

  void showSignupConfirmVisibility() {
    signupConfirmVisibility.value = !signupConfirmVisibility.value;
  }

  void showResetNewVisibility() {
    resetNewVisibility.value = !resetNewVisibility.value;
  }

  void showResetConfirmVisibility() {
    resetConfirmVisibility.value = !resetConfirmVisibility.value;
  }

  void showProfilePasswordVisibility() {
    profilePasswordVisibility.value = !profilePasswordVisibility.value;
  }

  void showNewPasswordVisibility() {
    newPasswordVisibility.value = !newPasswordVisibility.value;
  }

  void showConfirmPasswordVisibility() {
    confirmPasswordVisibility.value = !confirmPasswordVisibility.value;
  }

  void showUpDatePasswordVisibility() {
    upDatePasswordVisibility.value = !upDatePasswordVisibility.value;
  }
}
