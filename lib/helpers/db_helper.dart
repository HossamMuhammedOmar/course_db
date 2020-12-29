import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._instance();
  DbHelper._instance();
  static Database _db;
  String _courseTable = 'course_table';
  String _colId = 'id';
  String _colTitle = 'title';
  String _colDescription = 'description';
  String _colHours = 'hours';
  // Course Table
  // id | title | description | hours
  // 0  |   ''  |     ''      |    10
  // 1  |   ''  |     ''      |    45
  // 2  |   ''  |     ''      |    30

  Future<Database> get db async {
    if (_db == null) {
      _db = await initDb();
    }
    return _db;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'course.db');
    final courseDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return courseDb;
  }

  _createDb(Database db, int version) {
    db.execute(
      'CREATE TABLE $_courseTable($_colId INTEGER PRIMARY KEY AUTOINCREMENT, $_colTitle TEXT, $_colDescription TEXT, $_colHours INTEGER)',
    );
  }
}
