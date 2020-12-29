import 'package:course_db/models/course_model.dart';
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

  // Check IF DB already existing or not?
  Future<Database> get db async {
    if (_db == null) {
      _db = await initDb();
    }
    return _db;
  }

  // Init Database
  initDb() async {
    String path = join(await getDatabasesPath(), 'course.db');
    final courseDb = await openDatabase(path, version: 1, onCreate: _createDb);
    return courseDb;
  }

  // Create new Database
  _createDb(Database db, int version) {
    db.execute(
      'CREATE TABLE $_courseTable($_colId INTEGER PRIMARY KEY AUTOINCREMENT, $_colTitle TEXT, $_colDescription TEXT, $_colHours INTEGER)',
    );
  }

  // Create new course in course_table.
  Future<int> insertCourse(CourseModel course) async {
    Database db = await this.db;
    int result = await db.insert(_courseTable, course.toMap());
    return result;
  }

  // Get All Courses in database as MAP.
  Future<List<Map<String, dynamic>>> getCoursesMapList() async {
    Database db = await this.db;
    List<Map<String, dynamic>> result = await db.query(_courseTable);
    return result;
  }

  // Delete Course from Database.
  Future<int> deleteCourse(CourseModel course) async {
    Database db = await this.db;
    int result = await db
        .delete(_courseTable, where: '$_colId = ?', whereArgs: [course.id]);
    return result;
  }
}
