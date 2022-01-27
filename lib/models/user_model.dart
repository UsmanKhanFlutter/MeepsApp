import 'dart:io';

class User {
  String? _userId;

  String? get userId => _userId;

  set userId(String? userId) {
    _userId = userId;
  }

  String? _id;

  String? get id => _id;

  set id(String? id) {
    _id = id;
  }

  String? _profileImageUrl;

  String? get profileImageUrl => _profileImageUrl;

  set profileImageUrl(String? profileImageUrl) {
    _profileImageUrl = profileImageUrl;
  }

  File? _profileImage;

  File? get profileImage => _profileImage;

  set profileImage(File? profileImage) {
    _profileImage = profileImage;
  }

  String? _email;

  String? get email => _email;

  set email(String? email) {
    _email = email;
  }

  String? _password;

  String? get password => _password;

  set password(String? password) {
    _password = password;
  }

  String? _confirmPassword;

  String? get confirmPassword => _confirmPassword;

  set confirmPassword(String? confirmPassword) {
    _confirmPassword = confirmPassword;
  }

  String? _nationality;

  String? get nationality => _nationality;

  set nationality(String? nationality) {
    _nationality = nationality;
  }

  String? _bio;

  String? get bio => _bio;

  set bio(String? bio) {
    _bio = bio;
  }

  String? _bioTag;

  String? get bioTag => _bioTag;

  set bioTag(String? bioTag) {
    _bioTag = bioTag;
  }

  String? _name;

  String? get name => _name;

  set name(String? name) {
    _name = name;
  }

  String? _dateOfBirth;

  String? get dateOfBirth => _dateOfBirth;

  set dateOfBirth(String? dateOfBirth) {
    _dateOfBirth = dateOfBirth;
  }

  String? _userIntroduction;

  String? get userIntroduction => _userIntroduction;

  set userIntroduction(String? userIntroduction) {
    _userIntroduction = userIntroduction;
  }

  String? _image;

  String? get img => _image;

  set img(String? image) {
    _image = image;
  }

  User(
      {userId,
      id,
      email,
      password,
      confirmPassword,
      profileImage,
      profileImageUrl,
      nationality,
      bio,
      bioTag,
      name,
      image});

  // User.fromMap(Map snapshot, String id)
  //     : id = id ?? '',
  //       email = snapshot['email'] ?? '',
  //       password = snapshot['password'] ?? '',
  //       name = snapshot['name'] ?? '',
  //       img = snapshot['img'] ?? '';

  // toJson() {
  //   return {
  //     "id": id,
  //     "email": email,
  //     "name": name,
  //     "img": img,
  //   };
  // }
}
