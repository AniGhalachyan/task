import 'dart:math';

import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool click = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(
        size: 30,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget body({double size, var height, var width}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                click = !click;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              height: height > size ? height - size : 0,
              width: width > size ? width - size : 0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, Random().nextInt(255),
                        Random().nextInt(255), Random().nextInt(255)),
                    Color.fromARGB(250, Random().nextInt(250),
                        Random().nextInt(250), Random().nextInt(250)),
                  ]),
                  borderRadius: click
                      ? BorderRadius.circular(100)
                      : BorderRadius.circular(0)),
              child: (height == 0 || width == 0)
                  ? Container()
                  : body(
                      size: size,
                      width: width > size ? width - size : 0,
                      height: height > size ? height - size : 0,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
