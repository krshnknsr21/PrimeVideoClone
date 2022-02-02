import 'package:flutter/material.dart';

class Signup extends StatefulWidget{
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>(); //key for form
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    // final double width= MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: formKey, //key for form
            child:ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/prime_logo.png',
                    height: 100.0,
                  ),
                ),
                const Center(
                    child: Text(
                      "Sign up with your email",
                      style: TextStyle(
                        fontFamily: "SourceSansPro",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                ),
                SizedBox(height: height*0.02),
                TextFormField(
                  onChanged: (text) {
                    print('First text field: $text');
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "SourceSansPro",
                    fontSize: 20.0,
                  ),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey,
                      hintText: "Name",
                      hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.0,
                          fontFamily: "SourceSansPro"
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.deepOrangeAccent
                        ),
                      )
                  ),
                ),
                SizedBox(height: height*0.03),
                TextFormField(
                  onChanged: (text) {
                    print('First text field: $text');
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "SourceSansPro",
                    fontSize: 20.0,
                  ),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey,
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.0,
                          fontFamily: "SourceSansPro"
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.deepOrangeAccent
                        ),
                      )
                  ),
                  validator: (value) {
                    // if(value==null || RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    if(value!.isEmpty) {
                      return "Enter correct email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.03),
                TextFormField(
                  onChanged: (text) {
                    print('First text field: $text');
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "SourceSansPro",
                    fontSize: 20.0,
                  ),
                  obscureText: !showPassword,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey,
                      hintText: "Create a password",
                      hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 18.0,
                          fontFamily: "SourceSansPro"
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 20.0,
                            style: BorderStyle.solid
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.deepOrangeAccent
                        ),
                      )
                  ),
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Enter a password";
                    } else {
                      return null;
                    }
                  },
                ),
                CheckboxListTile(
                  title: const Text(
                    "Show password",
                    style: TextStyle(
                      fontFamily: "SourceSansPro",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  dense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
                  activeColor: Colors.white,
                  checkColor: Colors.amber,
                  value: showPassword,
                  onChanged: (newValue) {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      return;
                    }
                  },
                  child: const SizedBox(
                      height: 50.0,
                      child: Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    primary: Colors.amber,
                  ),
                ),
                SizedBox(height: height*0.01),
                TextButton(
                  onPressed: () {
                    return;
                  },
                  child: const Text(
                    "Already have an account?",
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }


}
