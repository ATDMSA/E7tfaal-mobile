import 'dart:convert';
import 'package:http/http.dart' as http;
class WebServices {
  static const String BASE_URL = "http://e7tfal.e7tfaal.com/api";

  static Future getCountries({final scaffoldKey}) async {
    final response = await http.get(
      BASE_URL + "/spinners/city",
    );
    return response;
  }

  static Future registerApi({ String firstName, String lastName, String phone ,
    String email, String birthDay ,String image, int cityId, String six,
    String password ,String passwordConfirm, String device, String token ,String socialId, String provider}) async {

    Map<String, dynamic> dataBody = {
      "first_name" : firstName,
      "last_name" : lastName,
      "phone" : phone,
      "email": email,
      "image": image,
      "birth_date":birthDay,
      "city_id":cityId,
      "gender":six,
      "password":password,
      "password_confirmation":passwordConfirm,
      "device":device,
      "token":token,
      "socail_id":socialId,
      "provider":provider
    };

    print("body");
    print(dataBody);

    final response = await http.post(
      BASE_URL + "/auth/register/user",
      body: json.encode(dataBody),
      headers: {
        "Accept" : "application/json",
      }
    );
    return response;
  }
}