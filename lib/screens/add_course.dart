import 'package:flutter/material.dart';

class AddCourse extends StatefulWidget {
  AddCourse({Key key}) : super(key: key);

  @override
  _AddCourseState createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  final _formKey = GlobalKey<FormState>();
  String _title;
  String _description;
  int _hours;

  _submitCourse() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('title: $_title, description: $_description, total hours: $_hours');
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add new course'),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'course title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input) => input.trim().toString().isEmpty
                          ? 'please enter the course title'
                          : null,
                      onSaved: (input) => _title = input,
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      maxLength: 100,
                      decoration: InputDecoration(
                        labelText: 'course description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input) => input.trim().toString().isEmpty
                          ? 'please enter the course description'
                          : null,
                      onSaved: (input) => _description = input,
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'total hours',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (input) => input.trim().toString().isEmpty
                          ? 'please enter the total hours'
                          : null,
                      onSaved: (input) => _hours = int.parse(input),
                    ),
                    SizedBox(height: 50.0),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff3498db),
                            Color(0xff2980b9),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500].withOpacity(0.4),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: double.infinity,
                      height: 60.0,
                      child: FlatButton(
                        child: Text(
                          'Add Course',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: _submitCourse,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
