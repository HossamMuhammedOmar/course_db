import 'package:course_db/helpers/db_helper.dart';
import 'package:course_db/models/course_model.dart';
import 'package:course_db/screens/add_course.dart';
import 'package:flutter/material.dart';

class CoursesList extends StatefulWidget {
  CoursesList({Key key}) : super(key: key);

  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  DbHelper db;

  @override
  void initState() {
    super.initState();
    setState(() {
      db = DbHelper.instance;
    });
  }

  _handleIconButton() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddCourse()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Courses List'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _handleIconButton,
            ),
          ],
        ),
        body: FutureBuilder(
          future: db.getCoursesMapList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  CourseModel courseModel =
                      CourseModel.fromMap(snapshot.data[index]);
                  return ListTile(
                    title: Text(
                        '${courseModel.title} - ${courseModel.hours} hours'),
                    subtitle: Text(courseModel.description),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Color(0xffe74c3c),
                      ),
                      onPressed: () {
                        setState(() {
                          db.deleteCourse(courseModel);
                        });
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
