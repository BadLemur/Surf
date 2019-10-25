import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ListPersonScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/back.png',
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            top: 100,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Вход",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Expanded(
                  child: SingleChildScrollView(child: CardView()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardView extends StatefulWidget {
  @override
  State createState() => CardViewState();
}

class CardViewState extends State<CardView> {
  final controller = TextEditingController();
  bool _isBtnEnable = false;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        _isBtnEnable = controller.value.text.isNotEmpty;
      });
    });
    super.initState();
  }

  void _callback() {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (ctx) => Scaffold(body: ListPerson()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 16.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(hintText: "E-mail"),
            ),
            TextFormField(
              style: TextStyle(),
              controller: controller,
              decoration: InputDecoration(hintText: "Пароль"),
            ),
            MaterialButton(
              child: Text(
                "Войти",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              onPressed: _isBtnEnable ? _callback : null,
              color: Colors.deepPurple,
              elevation: 16.0,
              disabledColor: Colors.black12,
            )
          ],
        ),
      ),
    );
  }
}
