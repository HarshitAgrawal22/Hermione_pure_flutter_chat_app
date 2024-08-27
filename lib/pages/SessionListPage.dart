import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  final String UserID;
  SessionPage({super.key, required this.UserID});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  List Sessions = [];

  // void SetSessions() async {
  //   Sessions = await ChatService().loadSessions(widget.UserID);
  //   setState(() {
  //     Sessions = Sessions;
  //     print("loaded sessions");
  //   }); // Update UI after loading sessions
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // Initialize sessions when the widget is created
  //   SetSessions();
  // }

  // void deleteSession(int id) async {
  //   await ChatService().DeleteSession(username: widget.UserID, session_id: id);
  //   SetSessions();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green.shade800,
        title: Text(
          "HERMIONE",
          style: TextStyle(
            letterSpacing: width / 30,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => () {}));
              },
              icon: Icon(Icons.create))
        ],
      ),
      body: Center(
        child: Sessions.isEmpty
            ? Center(
                child: CircularProgressIndicator()) // Show loading indicator
            : ListView.builder(
                itemCount: Sessions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => chatPage(
                        //             id: widget.UserID,
                        //             session_id: Sessions[index]["id"])));
                      },
                      child: ListTile(
                        title: Slidable(
                          startActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                borderRadius:
                                    BorderRadius.circular(height / 40),
                                onPressed: (context) {
                                  // deleteSession(Sessions[index]["id"]);
                                },
                                backgroundColor: Colors.redAccent,
                                label: "delete",
                                icon: (Icons.delete),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width / 10, vertical: height / 40),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(height / 40),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '${Sessions[index]["name"]} ', // First part of the text
                                          style: TextStyle(
                                              fontSize: width / 20,
                                              color: Colors
                                                  .black), // Adjust the style
                                        ),
                                      ],
                                    ),
                                    overflow: TextOverflow
                                        .visible, // Wrap text to new line if it overflows
                                    maxLines:
                                        2, // Limit to 2 lines, adjust as needed
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                          ),
                        ),
                      ));
                },
              ),
      ),
    );
  }
}
