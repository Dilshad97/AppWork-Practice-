import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
 _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  late SharedPreferences logindata;
  String? username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 210,
        child:



        Drawer(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.grey[850],
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/user.png',
                      height: 70,
                      width: 70,
                    ),
                    Text(
                      '$username',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
                const Divider(
                  indent: 10,
                  endIndent: 40,
                  thickness: 1,
                  color: Colors.grey,
                ),
                ListTile(
                  title: const Text('Account',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  leading: Image.asset(
                    'assets/images/account.png',
                    height: 32,
                    width: 32,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: const Text('Delivery',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  leading: Image.asset(
                    'assets/images/delivery.png',
                    height: 32,
                    width: 32,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: const Text('About',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  leading: Image.asset(
                    'assets/images/about.png',
                    height: 32,
                    width: 32,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  title: const Text('Exit',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  leading: Image.asset(
                    'assets/images/exit.png',
                    height: 32,
                    width: 32,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
