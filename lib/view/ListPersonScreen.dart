import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surf/model/DataServer.dart';
import 'package:surf/presenter/StateListPerson.dart';

abstract class ListPersonInterface {
  void error();

  void showData(List<DataServer> _data);
}

class ListPerson extends StatefulWidget {
  @override
  State createState() {
    return ListPersonState();
  }
}

class ListPersonState extends State<ListPerson> implements ListPersonInterface {
  int _loadingFlag;
  StateListPersonInterface _presenter;

  @override
  void initState() {
    _loadingFlag = 0;
    super.initState();
    _presenter = StateListPerson(this);
    _presenter.init();
  }

  List<DataServer> _array = List();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (BuildContext context) {
          switch (_loadingFlag) {
            case 0:
              return Center(
                  child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.deepPurple)));
            case 1:
              return _listData();
            case 2:
              return _widgetError();
            default:
              return Center(
                child: Text(
                  "Неизвестная ошибка",
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
              );
          }
        },
      ),
    );
  }

  Widget _listData() {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 0.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Пользователи",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
      ),
      Expanded(
        child: ListView(
          children: _data(),
        ),
      )
    ]);
  }

  List<Widget> _data() {
    return _array
        .map((DataServer f) => ListTile(
              title: Text(
                f.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text: f.email + "\n",
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: f.job,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              isThreeLine: true,
              leading: CircleAvatar(child: Icon(Icons.person)),
            ))
        .toList();
  }

  Widget _widgetError() {
    return //Expanded(
        //child:
        Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.warning,
          size: 82,
          color: Colors.deepPurple,
        ),
        Text(
          "Не удалось загрузить информацию",
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        MaterialButton(
          child: Text(
            "Обновить",
            style: TextStyle(color: Colors.white),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          onPressed: update,
          color: Colors.deepPurple,
          elevation: 16.0,
          disabledColor: Colors.black12,
        )
      ],
    );
  }

  void update() {
    _presenter.init();
    setState(() {
      _loadingFlag = 0;
    });
  }

  @override
  void showData(List<DataServer> _array) {
    this._array.clear();
    this._array.addAll(_array);
    print(_array);
    setState(() {
      _loadingFlag = 1;
    });
  }

  @override
  void error() {
    setState(() {
      _loadingFlag = 2;
    });
  }
}
