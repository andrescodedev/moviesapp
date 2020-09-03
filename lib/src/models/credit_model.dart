class CreditModel {
  List<Actor> _results = [];

  CreditModel.fromJson(Map<String, dynamic> data) {
    List<Actor> temp = [];
    for (int i = 0; i < data['cast'].length; i++) {
      Actor result = Actor(data['cast'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Actor> get results => _results;
}

class Actor {
  String _name;
  String _profilePath;

  Actor(result) {
    _name = result['name'];
    _profilePath = result['profile_path'];
  }

  String get name => _name;

  String get profilePath => _profilePath;

  getPhotoActor() {
    if (_profilePath == null) {
      return 'https://pngimage.net/wp-content/uploads/2018/06/no-image-available-png-3.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$_profilePath';
    }
  }
}
