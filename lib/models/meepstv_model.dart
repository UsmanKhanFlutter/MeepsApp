class MeepsTv {
  String? _tv_date;

  String? get tv_date => _tv_date;

  set tv_date(String? tv_date) {
    _tv_date = tv_date;
  }

  String? _tv_link;

  String? get tv_link => _tv_link;

  set tv_link(String? tv_link) {
    _tv_link = tv_link;
  }

  String? _tv_poster;

  String? get tv_poster => _tv_poster;

  set tv_poster(String? tv_poster) {
    _tv_poster = tv_poster;
  }

  String? _tv_thumbnail;

  String? get tv_thumbnail => _tv_thumbnail;

  set tv_thumbnail(String? tv_thumbnail) {
    _tv_thumbnail = tv_thumbnail;
  }

  String? _tv_title;

  String? get tv_title => _tv_title;

  set tv_title(String? tv_title) {
    _tv_title = tv_title;
  }

  MeepsTv({tv_date, tv_link, tv_poster, tv_thumbnail, tv_title});
}
