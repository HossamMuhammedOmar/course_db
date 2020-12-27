import 'package:course_db/screens/add_course.dart';
import 'package:flutter/material.dart';

class CoursesList extends StatefulWidget {
  CoursesList({Key key}) : super(key: key);

  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
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
      ),
    );
  }
}
