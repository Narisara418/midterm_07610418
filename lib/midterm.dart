import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Pigpage(),
    );
  }
}

class Pigpage extends StatelessWidget {
  Pigpage({Key? key}) : super(key: key);

  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'PIG WEIGHT\nCALCULATOR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/pig.png', width: 300.0),
                    ],
                  ),
                ),
              ),
              Row(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        'LENGTH\n(CM)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        child: Text(
                          'GIRTH\n(CM)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _controllerA,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(),
                          hintText: 'Enter length',
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: _controllerB,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.7),
                          border: OutlineInputBorder(),
                          hintText: 'Enter girth',
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        String? inputA = _controllerA.text;
                        String? inputB = _controllerB.text;
                        double? le1 = double.tryParse(inputA);
                        double? gi1 = double.tryParse(inputB);
                        if(le1 == null ){
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('ERROR'),
                                  content: Text('Invalid input'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK')
                                    )
                                  ],
                                );
                              });
                        }
                        var a = le1!/100;
                        var b = gi1!/100;
                        var w = b*b*a*69.3;
                        var w1 = w*(3/100)+w;
                        var w2 = w-w*(3/100);
                        var p = w*112.50;
                        var p1 = p*(3/100)+p;
                        var p2 = p-p*(3/100);
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Row(
                                    children: [
                                      Image.asset('assets/images/ic_pig.png',
                                        width: 40.0,),
                                      Text(' RESULT'),
                                    ],
                                  ),
                                  content: Text(
                                      'Weight: ${w2.round()} - ${w1
                                          .round()} kg\n\nPrice: ${p2
                                          .round()} -  ${p1.round()} Baht'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK')
                                    )
                                  ],
                                );
                              });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'CALCULATE',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
