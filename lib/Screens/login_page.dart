import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                const Text(
                  "Sign-in",
                  style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(onPressed: () {},
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    print('email or number: $text');
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Email or phone number';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "SourceSansPro",
                    fontSize: 15.0,
                  ),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey,
                      hintText: 'Email or phone number',
                      hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 15.0,
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
                TextFormField(
                  obscureText: !showPassword,
                  onChanged: (text) {
                    print('password field: $text');
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "SourceSansPro",
                    fontSize: 15.0,
                  ),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey,
                      hintText: 'Amazon password',
                      hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 15.0,
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
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.white,
                    focusColor: Colors.orangeAccent,
                  ),
                  child: CheckboxListTile(
                    title: const Text(
                      "Show password",
                      style: TextStyle(
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
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
                    }
                  },
                  child: const SizedBox(
                      height: 50.0,
                      child: Center(
                          child: Text(
                            'Sign-in',
                            style: TextStyle(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RichText(
                    text: const TextSpan(
                      text: 'By continuing, you agree to Amazon\'s ',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Conditions of Use',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                        ),
                        TextSpan(
                            text: ' and ',
                        ),
                        TextSpan(
                          text: 'Privacy Notice',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                  child: Center(
                      child: Text(
                        '-------------------------------  New to Amazon?  -------------------------------',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Create a new Amazon account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
