import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isOkay = true;

  String message = "Stretch Down To Get Started";

  void registerFailure(String error) {
    setState(() {
      isOkay = false;
      message = error;
    });
  }

  // Future<void> Register(context) async {
  //   try {
  //     bool flag = await LoginService().Register(username: IDController.text);
  //     if (flag) {
  //       int session = await ChatService().CreateSession(
  //           username: IDController.text,
  //           session_name: SessionNameController.text);
  //       print(session);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => chatPage(
  //             id: IDController.text,
  //             session_id: session,
  //           ),
  //         ),
  //       );
  //     } else {
  //       registerFailure("Register Failure");
  //     }
  //   } catch (e) {
  //     registerFailure('$e');
  //   }
  // }

  TextEditingController IDController = new TextEditingController(),
      SessionNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size aspect = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: aspect.width / 10, vertical: aspect.height / 20),
        child: Center(
            child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Welcome Master",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: aspect.height / 30),
                ),
                SizedBox(
                  height: aspect.height / 20,
                ),
                Text(
                  "They Call It Cheating We Call It Smartwork",
                  style: TextStyle(color: Colors.blue.shade800),
                ),
                SizedBox(
                  height: aspect.height / 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: aspect.width / 20),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(aspect.height / 70),
                              ),
                              borderSide: BorderSide()),
                          hintText: "Phone..",
                          hintStyle: TextStyle(color: Colors.blue)),
                      controller: IDController,
                    ),
                  ),
                ),
                SizedBox(
                  height: aspect.height / 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: aspect.width / 20),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(aspect.height / 70),
                              ),
                              borderSide: BorderSide()),
                          hintText: "Chat Session name...",
                          hintStyle: TextStyle(color: Colors.blue)),
                      controller: SessionNameController,
                    ),
                  ),
                ),
                SizedBox(
                  height: aspect.height / 10,
                ),
                GestureDetector(
                  // onTap: () => Register(context),
                  child: Container(
                    decoration: BoxDecoration(
                        color: isOkay ? Colors.blue : Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(
                        vertical: aspect.height / 80,
                        horizontal: aspect.width / 80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: aspect.height / 50),
                        ),
                        Icon(
                          Icons.swipe_down_sharp,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: aspect.height / 5,
            ),
            Container(
                child: const Center(
                    child: Text(
              "In Case You Are Caught Cheating With This App In Exam Then We Take No Responsiblity Of It",
              style: TextStyle(color: Colors.red),
            ))),
            SizedBox(
              height: aspect.height / 20,
            ),
          ],
        )),
      ),
    );
  }
}
