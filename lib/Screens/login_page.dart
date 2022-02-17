import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); //key for form
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;
    // final double width= MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    Future signIn() async {
      try{
        showDialog(context: context,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        Navigator.pop(context);
        // setState(() {
        //   _loading = true;
        // });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          if (kDebugMode) {
            print('Wrong password provided for the given email!');
          }
        } else {
          if (kDebugMode) {
            print(e.toString());
          }
        }
      }
    }

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: _formKey, //key for form
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
                //Email TextField
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Please enter your Email';
                    } else if (!EmailValidator.validate(email)) {
                        return 'Please enter correct Email';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "SourceSansPro",
                    fontSize: 15.0,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey,
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          color: Colors.white54,
                          fontSize: 15.0,
                          fontFamily: "SourceSansPro"
                      ),
                      suffixIcon: _emailController.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => _emailController.clear(),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.deepOrangeAccent
                        ),
                      )
                  ),
                ),
                //Password TextField
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_showPassword,
                  // onChanged: (text) {
                  //   // print('password field: $text');
                  // },
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
                    value: _showPassword,
                    onChanged: (newValue) {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (kDebugMode) {
                        print(_emailController.text);
                        print(_passwordController.text);
                      }
                      signIn();
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
                    // Navigator.pushNamed(context, '/signup');
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
