import 'package:appwork/Shared%20Preference/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailCont = TextEditingController();

  late SharedPreferences logindata;

  late bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();

    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainDrawer()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  height: 40.0,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    controller: emailcontroller,
                    autofocus: false,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Phone Number',
                      hintStyle: const TextStyle(fontSize: 15),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(10),
                  height: 40.0,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    controller: emailCont,
                    autofocus: false,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Email',
                      hintStyle: const TextStyle(fontSize: 15),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.all(10),
                  height: 40.0,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    controller: passwordcontroller,
                    autofocus: false,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Password',
                      hintStyle: const TextStyle(fontSize: 15),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Container(
                    height: 40,
                    width: 160,
                    child: const Center(
                        child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ))),
                onPressed: () {
                  String username = emailcontroller.text;
                  String email = emailCont.text;
                  String password = passwordcontroller.text;
                  if (username != '' && password != '') {
                    print('Successful');
                    logindata.setBool('login', false);
                    logindata.setString('username', username);
                    logindata.setString('email', email);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainDrawer()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
