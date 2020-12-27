import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._instance();
  DbHelper._instance();
  static Database _db;
  String courseTable = 'course_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colHours = 'hours';
  // Course Table
  // id | title | description | hours
  // 0  |   ''  |     ''      |    10
  // 1  |   ''  |     ''      |    45
  // 2  |   ''  |     ''      |    30

  get db async {
    if (_db == null) {
      _db = await initDb();
    }
    return _db;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'course.db');
    openDatabase(path, version: 1, onCreate: _createDb);
  }

  _createDb(Database db, version) {}
}
