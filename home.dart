import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeSatate();
}

class _HomeSatate extends State<Home> {
  final TextEditingController _orederController = new TextEditingController();
  double orderPrice(String quantity, double weigthPrice) {
    if (quantity.isNotEmpty && int.parse(quantity) > 0) {
      return int.parse(quantity) * weigthPrice;
    } else {
      return 0.0;
    }
  }

  int radioGroup = 0;
  String Rev = '';
  void onClickRev() {
    setState(() {
      Rev = 'your order is revewing now please wait till submitted maessage !';
    });
  }

  String myOrdr = '';
  void onClickRad(value) {
    setState(() {
      radioGroup = value;
      switch (radioGroup) {
        case 1:
          myOrdr = '${orderPrice(_orederController.text, 1200)}';
          break;
        case 2:
          myOrdr = '${orderPrice(_orederController.text, 1500)}';
          break;
        case 3:
          myOrdr = '${orderPrice(_orederController.text, 2550)}';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black12,
      appBar: new AppBar(
        backgroundColor: Colors.orange[800],
        title: new Text('Talabat Welcome'),
      ),
      body: new Container(
          padding: EdgeInsets.only(top: 2, left: 5.5),
          child: new ListView(
            children: <Widget>[
              new Image.asset(
                'images/talabat.png',
                cacheWidth: 500,
              ),
              new Container(
                  alignment: Alignment.center,
                  child: new Column(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.only(top: 10)),
                      new Text(
                        'Welcome to tlabat app please let your order....!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      new Container(
                        padding: EdgeInsets.only(left: 10, top: 2),
                        margin: EdgeInsets.only(bottom: 10, left: 30),
                        child: new TextField(
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            controller: null,
                            decoration: InputDecoration(
                              icon: new Icon(
                                Icons.inbox,
                                color: Colors.orange,
                              ),
                              labelText: 'Good Name',
                              labelStyle: TextStyle(color: Colors.orange),
                              hintText: 'food,furniture,computers...etc',
                              hintStyle: TextStyle(color: Colors.white),
                            )),
                      ),
                      new Container(
                        padding: EdgeInsets.only(left: 5, top: 2),
                        margin: EdgeInsets.only(bottom: 10, left: 30),
                        child: new TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            controller: _orederController,
                            decoration: InputDecoration(
                              icon: new Icon(
                                Icons.add_box,
                                color: Colors.orange,
                              ),
                              labelText: 'Quantity',
                              labelStyle: TextStyle(color: Colors.orange),
                              hintText: 'from 1 ~ 100',
                              hintStyle: TextStyle(color: Colors.white),
                            )),
                      ),
                      new Container(
                        padding: EdgeInsets.only(left: 5, top: 2),
                        margin: EdgeInsets.only(bottom: 10, left: 30),
                        child: new TextField(
                            keyboardType: TextInputType.streetAddress,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            controller: null,
                            decoration: InputDecoration(
                              icon: new Icon(
                                Icons.location_city,
                                color: Colors.orange,
                              ),
                              labelText: 'Location',
                              labelStyle: TextStyle(color: Colors.orange),
                              hintText: '99-stName-Ministry-Egypt',
                              hintStyle: TextStyle(color: Colors.white),
                            )),
                      ),
                      new Text(
                        '~Weight~',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          backgroundColor: Colors.orange,
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Container(
                            margin: EdgeInsets.only(bottom: 10, left: 20),
                            child: new RadioListTile<int>(
                              tileColor: Colors.orange,
                              value: 1,
                              groupValue: radioGroup,
                              onChanged: onClickRad,
                              title: new Text('100g ~ 1kg'),
                              subtitle: new Text('food'),
                              activeColor: Colors.black,
                            ),
                          ),
                          new Container(
                            margin: EdgeInsets.only(bottom: 10, left: 20),
                            child: new RadioListTile<int>(
                              tileColor: Colors.orange[600],
                              value: 2,
                              groupValue: radioGroup,
                              onChanged: onClickRad,
                              title: new Text('1kg ~ 100kg'),
                              subtitle: new Text('pc,DT computer.....etc'),
                              activeColor: Colors.black,
                            ),
                          ),
                          new Container(
                            margin: EdgeInsets.only(bottom: 10, left: 20),
                            child: new RadioListTile<int>(
                              tileColor: Colors.orange[700],
                              value: 3,
                              groupValue: radioGroup,
                              onChanged: onClickRad,
                              title: new Text('1kg ~ 1000kg'),
                              subtitle: new Text('furniture'),
                              activeColor: Colors.black,
                            ),
                          ),
                          new FlatButton(
                              color: Colors.grey[900],
                              onPressed: onClickRev,
                              child: new Text(
                                'Review order',
                                style: TextStyle(color: Colors.amber),
                              )),
                          new Text('Price',
                              style: TextStyle(
                                  color: Colors.orange[800],
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                          new Padding(padding: EdgeInsets.only(top: 10)),
                          new Text(
                            '$myOrdr \$',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w100),
                          ),new Padding(padding:EdgeInsets.only(top:5)),
                        new Text(
                            '$Rev',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
