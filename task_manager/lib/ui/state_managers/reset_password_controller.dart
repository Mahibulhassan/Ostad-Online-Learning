import 'package:get/get.dart';
import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class ResetPasswordController extends GetxController {
  bool _setPasswordInProgress = false;
  bool get passwordInProgress => _setPasswordInProgress;
  Future<bool> postChangePassword(String email, String otp,String password) async{
    _setPasswordInProgress = true;
    update();
    Map<String, dynamic> requestBody = {
      "email": email,
      "OTP": otp,
      "password": password
    };
    final NetworkResponse response = await NetworkCaller()
        .postRequest(Urls.recoverResetPassword, requestBody, isLogin: true);
    _setPasswordInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}