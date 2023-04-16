import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import "../widgets/recordTile.dart";
import '../widgets/widgets.dart';
import 'login_page.dart';
import 'main_page.dart';

class ProfilePage extends StatefulWidget {
  String userName = "";
  String email = "";
  String gender = "";
  double weight;
  double height;
  int age;
  ProfilePage({
    Key? key,
    required this.email,
    required this.userName,
    required this.age,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Stream? records;
  AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    gettingRecordsData();
  }

  List<String> getTitle(String input) {
    List<String> res = [], tmp = input.split("_");
    for (int i = 0; i < tmp.length; i++) {
      res.add(tmp[i].substring(0, tmp[i].indexOf(':')));
    }
    return res;
  }

  List<String> getInfo(String input) {
    List<String> res = [], tmp = input.split("_");
    for (int i = 0; i < tmp.length; i++) {
      res.add(tmp[i].substring(tmp[i].indexOf(':') + 1));
    }
    return res;
  }

  gettingRecordsData() async {
    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getRecordsGroups()
        .then((snapshot) {
      setState(() {
        records = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.grey[700],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.userName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 2,
            ),
            ListTile(
                onTap: () {
                  nextScreen(context, const MainPage());
                },
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(Icons.local_hospital),
                title: const Text(
                  "Disease Prediction",
                  style: TextStyle(color: Colors.black),
                )),
            ListTile(
                onTap: () {},
                selectedColor: Theme.of(context).primaryColor,
                selected: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(Icons.person),
                title: const Text(
                  "Profile",
                  style: TextStyle(color: Colors.black),
                )),
            ListTile(
                onTap: () async {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Logout"),
                          content:
                              const Text("Are you sure you want to logout?"),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () async {
                                  await authService.signOut();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                      (route) => false);
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                )),
                          ],
                        );
                      });
                },
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(Icons.exit_to_app),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 200,
                  color: Colors.grey[700],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Full Name",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      widget.userName,
                      style: const TextStyle(fontSize: 17),
                    )
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      widget.email,
                      style: const TextStyle(fontSize: 17),
                    )
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(fontSize: 17),
                    ),
                    if (widget.height <= 0)
                      const Text(
                        "Undefined",
                        style: TextStyle(fontSize: 17),
                      )
                    else
                      Text(
                        widget.height.toString(),
                        style: const TextStyle(fontSize: 17),
                      )
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Weight",
                      style: TextStyle(fontSize: 17),
                    ),
                    if (widget.weight <= 0)
                      const Text(
                        "Undefined",
                        style: TextStyle(fontSize: 17),
                      )
                    else
                      Text(
                        widget.weight.toString(),
                        style: const TextStyle(fontSize: 17),
                      )
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Age",
                      style: TextStyle(fontSize: 17),
                    ),
                    if (widget.age <= 0)
                      const Text(
                        "Undefined",
                        style: TextStyle(fontSize: 17),
                      )
                    else
                      Text(
                        widget.age.toString(),
                        style: const TextStyle(fontSize: 17),
                      )
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Gender",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      widget.gender,
                      style: const TextStyle(fontSize: 17),
                    )
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                const Text(
                  "Prediction Records",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
                const Divider(
                  color: Colors.black,
                  height: 20,
                ),
                recordsList()
              ],
            ),
          ),
        ),
      ),
    );
  }

  recordsList() {
    return StreamBuilder(
      stream: records,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data['records'] != null &&
              snapshot.data['records'].length != 0) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data['records'].length,
              itemBuilder: (context, index) {
                return RecordTile(
                    titles: getTitle(snapshot.data['records'][index]),
                    infos: getInfo(snapshot.data['records'][index]),
                    userName: snapshot.data['fullName']);
              },
            );
          } else {
            return noRecordWidget();
          }
        } else {
          return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor));
        }
      },
    );
  }

  noRecordWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "You've not conducted any prediction.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
