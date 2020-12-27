class CourseModel {
  // Attribute
  int _id;
  int _hours;
  String _title;
  String _description;

  CourseModel(dynamic obj) {
    _id = obj['id'];
    _hours = obj['hours'];
    _title = obj['title'];
    _description = obj['description'];
  }

  CourseModel.forMap(Map<String, dynamic> data) {
    _id = data['id'];
    _hours = data['hours'];
    _title = data['title'];
    _description = data['description'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'hours': _hours,
      'title': _title,
      'description': _description,
    };
  }

  int get id => _id;
  int get hours => _hours;
  String get title => _title;
  String get description => _description;
}
