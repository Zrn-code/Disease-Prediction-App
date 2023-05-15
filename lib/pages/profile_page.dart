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
  int type = 1;
  int index = 0;

  ProfilePage({
    Key? key,
    required this.email,
    required this.userName,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Stream? records;
  List<String> predictionList = [
    "COVID-19",
    "Diabetes",
    "Heart Disease",
    "Lung Cancer"
  ];
  List<String> predictions = [
    "Prediction A",
    "Prediction B",
    "Prediction C",
    "Prediction D"
  ];
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
        title: Text(
          lang_map[lang]!["Profile Page"],
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
                title: Text(
                  lang_map[lang]!["Disease Prediction"],
                  style: const TextStyle(color: Colors.black),
                )),
            ListTile(
                onTap: () {},
                selectedColor: Theme.of(context).primaryColor,
                selected: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: const Icon(Icons.person),
                title: Text(
                  lang_map[lang]!["Profile"],
                  style: const TextStyle(color: Colors.black),
                )),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(
                lang_map[lang]!["Language"],
                style: const TextStyle(color: Colors.black),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                          title: Text(lang_map[lang]!["Language"]),
                          content: Container(
                            height: 100,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      lang = "EN";
                                    });
                                    Navigator.pop(context);
                                  },
                                  leading: const Icon(Icons.language),
                                  title: Text(lang_map[lang]!["EN"]),
                                ),
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      lang = "ZH";
                                    });
                                    Navigator.pop(context);
                                  },
                                  leading: const Icon(Icons.language),
                                  title: Text(lang_map[lang]!["ZH"]),
                                ),
                              ],
                            ),
                          ));
                    }));
              },
            ),
            ListTile(
                onTap: () async {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(lang_map[lang]!["Log Out"]),
                          content: Text(lang_map[lang]!["Check for Logout"]),
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
                title: Text(
                  lang_map[lang]!["Log Out"],
                  style: const TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                  Text(
                    lang_map[lang]!["Full Name"],
                    style: const TextStyle(fontSize: 17),
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
                  Text(
                    lang_map[lang]!["Email"],
                    style: const TextStyle(fontSize: 17),
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
                children: [
                  Text(
                    lang_map[lang]!["Record Type"],
                    style: const TextStyle(fontSize: 17),
                  ),
                  Expanded(child: Container()),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.type = 1;
                      });
                    },
                    child: const Text(
                      "Type 1",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.type = 2;
                      });
                    },
                    child: const Text(
                      "Type 2",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 20,
              ),
              widget.type == 1
                  ? Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (widget.index > 0) {
                                        widget.index -= 1;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                              Text(
                                lang_map[lang]![predictions[widget.index]],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 17),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (widget.index < 3) {
                                      widget.index += 1;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.arrow_forward),
                              ),
                            ]),
                        const Divider(
                          color: Colors.black,
                          height: 20,
                        ),
                        recordsList1(predictionList[widget.index]),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          lang_map[lang]!["Prediction Records"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 17),
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 20,
                        ),
                        recordsList(),
                      ],
                    ),
            ],
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

  recordsList1(String prediction) {
    return StreamBuilder(
      stream: records,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data.data();
          if (data.containsKey(prediction) &&
              data[prediction] != null &&
              data[prediction].length != 0) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data[prediction].length * 2 -
                  1, // Adjust item count to include dividers
              itemBuilder: (context, index) {
                if (index.isOdd) {
                  // Add Divider between items
                  return const Divider();
                }

                final recordIndex =
                    index ~/ 2; // Calculate the index of the record
                final record = data[prediction][recordIndex];
                final parts = record.split('_');
                final date = parts[0];
                final time = parts[1];
                final value = double.parse(parts[2]);

                return Center(
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(lang_map[lang]!["Date"] + ': $date'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lang_map[lang]!["Time"] +
                            ': $time | ' +
                            lang_map[lang]!["Result"] +
                            ': $value %'),
                      ],
                    ),
                  ),
                );
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
        children: [
          Text(
            lang_map[lang]!["No Record Found"],
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
