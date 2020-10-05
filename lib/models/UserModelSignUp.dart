import 'package:flutter/cupertino.dart';

class UserSignUp{
  String name, email, password, contact;

  UserSignUp({@required this.name, @required this.email, @required this.password, @required this.contact});

  Map<String, dynamic> toJson(){
    return {
      "name": name,
      "email": email,
      "password": password,
      "mobile": contact,
      "prepFor": "Medical",
    };
  }

}