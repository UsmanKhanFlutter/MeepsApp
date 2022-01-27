import 'dart:io';

class Post {
  List<File> postPhotos = [];
  String? _postTitle;

  String? get postTitle => _postTitle;

  set postTitle(String? postTitle) {
    _postTitle = postTitle;
  }

  String? _postDateTime;

  String? get postDateTime => _postDateTime;

  set postDateTime(String? postDateTime) {
    _postDateTime = postDateTime;
  }

  List<String> postItineraryByPlace = [];
  List<String> postItineraryByStyle = [];
  String? _titleOfPicture;

  String? get titleOfPicture => _titleOfPicture;

  set titleOfPicture(String? titleOfPicture) {
    _titleOfPicture = titleOfPicture;
  }

  String? _travelDateTime;

  String? get travelDateTime => _travelDateTime;

  set travelDateTime(String? travelDateTime) {
    _travelDateTime = travelDateTime;
  }

  String? _travelPlace;

  String? get travelPlace => _travelPlace;

  set travelPlace(String? travelPlace) {
    _travelPlace = travelPlace;
  }

  Post(
      {postPhotos,
      postTitle,
      travelDateTime,
      postItineraryByPlace,
      postItineraryByStyle,
      titleOfPicture,
      travelPlace});
}
