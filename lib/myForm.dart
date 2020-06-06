import 'package:flutter/material.dart';
import 'appBar.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  String username;
  String password;
  String project;
  final formKey = GlobalKey<FormState>();

  validateFormAndSave() {
    print("Validating Form...");
    if (formKey.currentState.validate()) {
      print("Validation Successful");
      formKey.currentState.save();
      print('Name $username');
      print('Age $password');
    } else {
      print("Validation Error");
    }
  }

  var usernameController = new TextEditingController();

  void dropChange(String value) {
    setState(() {
      project = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Color(0xffB8382C),
            ),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Enter ID",
                prefixIcon: Icon(Icons.person),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xff999999),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xff999999),
                    width: 2.0,
                  ),
                ),
              ),
              validator: (value) =>
                  value.length == 0 ? "Please Enter ID" : null,
              onSaved: (value) => username = value,
            ),
          ),
          SizedBox(height: 10.0),
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Color(0xffB8382C),
            ),
            child: TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Enter Password",
                prefixIcon: Icon(Icons.lock),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xff999999),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xff999999),
                    width: 2.0,
                  ),
                ),
              ),
              validator: (value) =>
                  value.length == 0 ? "Please Enter Password" : null,
              onSaved: (value) => password = value,
            ),
          ),
          SizedBox(height: 10.0),
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Color(0xffB8382C),
            ),
            child: DropdownButtonFormField(
              icon: Icon(
                // Add this
                Icons.keyboard_arrow_down, // Add this
                color: Color(0xff999999), // Add this
              ),
              decoration: InputDecoration(
                labelText: "Select Project",
                prefixIcon: Icon(Icons.location_city),
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xff999999),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Color(0xff999999),
                    width: 2.0,
                  ),
                ),
              ),
              items: <String>["Project1", "Project2", "Project3", "Project4"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              value: project,
              onChanged: dropChange,
              validator: (value) =>
                  value.length == 0 ? "Please Select a Project" : null,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: 0,
                    onChanged: (val) {
                      print('Radio');
                    },
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color(0xff999999),
                    ),
                  ),
                ],
              ),
              ButtonTheme(
                minWidth: 150.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      validateFormAndSave();
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) => new NextPage(
                            username: usernameController.text,
                            project: project),
                      );
                      Navigator.of(context).push(route);
                    }
                  },
                  color: Color(0xffB8382C),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'LOG IN',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xffB8382C))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String username;
  final String project;
  NextPage({Key key, this.username, this.project}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyAppBar(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 50.0,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Welcome ${widget.username}",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "Location: ${widget.project}",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
