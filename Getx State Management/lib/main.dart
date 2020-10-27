import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:understanding_getx_sm/controllers/counterController.dart';
import 'package:understanding_getx_sm/controllers/userController.dart';
import 'package:understanding_getx_sm/controllers/valueCOntroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Learn GetX",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(Modals(), transition: Transition.native);
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.only(bottom: 10, right: 5),
                    color: Colors.orange,
                    child: Center(
                        child: Text(
                      "Alert\nBottomModal\nSnackBar",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(fontSize: 22),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(MyHomePage(), transition: Transition.native);
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.pink,
                    child: Center(
                        child: Text(
                      "Counter App \nwith GetBuilder",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 22),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(StateManagers());
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.green,
                    margin: EdgeInsets.only(right: 5),
                    child: Center(
                        child: Text(
                      "Obx And Get Methods",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(fontSize: 22),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(UserList());
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.cyan,
                    child: Center(
                        child: Text(
                      "Simple Contact Fetcher App",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(fontSize: 22),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Made With",
                      style: GoogleFonts.poppins(
                          color: Color.fromRGBO(18, 18, 18, 1)),
                      children: [
                        TextSpan(
                          text: " Flutter",
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: " &",
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        TextSpan(
                          text: " GetX",
                          style: GoogleFonts.poppins(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterController _controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX State Management", style: GoogleFonts.poppins()),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Finds it in RAM once inititalized
          // Get.find<CounterController>().increment();

          //For the first time

          _controller.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          child: GetBuilder<CounterController>(
            builder: (controller) {
              return Text(
                controller.counter.toString(),
                style: Theme.of(context).textTheme.headline3,
              );
            },
          ),
        ),
      ),
    );
  }
}

class Modals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modal Showcase"),
      ),
      body: Container(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Get.defaultDialog(title: "Alert", middleText: "Sample Alert");
              },
              child: Text(
                'Alert',
                style: GoogleFonts.montserrat(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Get.rawSnackbar(
                  title: "Hi There!",
                  message: "Sample Snackbar",
                );
              },
              child: Text(
                'Snackbar',
                style: GoogleFonts.montserrat(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StateManagers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Use of GetX & ObX",
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: Container(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<ValueControllers>(
              init: ValueControllers(),
              builder: (_) {
                return Column(
                  children: [
                    Text(
                      "This is sentence 1 : ${_.valueModels.value.senA}",
                      style: GoogleFonts.montserrat(fontSize: 20),
                    ),
                  ],
                );
              },
            ),
            Obx(() => Column(
                  children: [
                    Text(
                      "This is sentence 2 : ${Get.find<ValueControllers>().valueModels.value.senB}",
                      style: GoogleFonts.montserrat(fontSize: 20),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            FlatButton(
                onPressed: () {
                  Get.find<ValueControllers>().changeTheValues(
                      senA: "Now I am a dog.", senB: "And I am a cat.");
                },
                child: Text("Change Values")),
          ],
        ),
      ),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final userController = Get.put(UserController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Users",
            style: GoogleFonts.montserrat(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            userController.getUsers();
          },
        ),
        body: GetX<UserController>(
          builder: (_) {
            return _.users.length == 0
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _.users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_.users[index].username),
                        leading: Icon(Icons.contact_mail),
                        subtitle: Text(_.users[index].company.name),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                  );
          },
        )

        /*Obx(() => ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context,i) {
          return ListTile(
            title: Text(userController.users[i].name,style: GoogleFonts.poppins(),),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.email),
          );
        },
      ))
        */
        );
  }
}
