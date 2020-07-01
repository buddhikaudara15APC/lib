import 'package:http/http.dart' as http;
import 'dart:convert';

//SignUp Page

Future<UserModel> signUpUser(
  String userName, String email, String password) async{
    final String url = 'https://scaf.lk:460/api/Auth/register';
    final response = await http.post(
      url,
      headers:  {
        "Accept": "application/json",
        "content-type": 'application/json ; charset=utf-8'
      },
      body: jsonEncode({
        "UserName": userName,
        "Password": password,
        "Email": email,
        "DateOfBirth": "2020-06-17",
        "Address": "String",
        "District": "String",
        "City": "String",
        "UserRole":"String",
        "PhoneNumber": "String",
        "Name": "String",
      }),
    );
    if (response.statusCode == 200) {
      print('200');
      final String responseString = response.body;
      return userModelFromJson(responseString);
    } else {
      print(response.statusCode);
      return null;
    }
  }

  UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

  String userModelToJson(UserModel data) => json.encode(data.toJson());

  class UserModel {
    UserModel({
      this.userName,
      this.email,
      this.password,
      this.userRole,
    });

    String userName;

    String email;

    String password;

    String userRole;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userName: json["userName"],
      email: json["email"],
      password: json["password"],
      userRole: json["userRole"],
    );

    Map<String,dynamic> toJson() => {
     "userName":userName,
     "email":email,
     "password":password,
    };
  }