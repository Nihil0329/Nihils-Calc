import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home:HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("NIHIL'S CALC")),
        body:Container(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        color: Colors.black
                    ),
                    child: Text(text
                      ,style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellowAccent
                      ),
                    ),
                  )
              ),
              Row(
                children: [
                  customOutlineButton("9"),
                  customOutlineButton("8"),
                  customOutlineButton("7"),
                  customOutlineButton("+"),
                ],
              ),
              Row(
                children: [
                  customOutlineButton("6"),
                  customOutlineButton("5"),
                  customOutlineButton("4"),
                  customOutlineButton("-"),
                ],
              ),
              Row(
                children: [
                  customOutlineButton("3"),
                  customOutlineButton("2"),
                  customOutlineButton("1"),
                  customOutlineButton("x"),
                ],
              ),
              Row(
                children: [
                  customOutlineButton("c"),
                  customOutlineButton("0"),
                  customOutlineButton("="),
                  customOutlineButton("/"),
                ],
              ),
            ],
          ),
        )
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: FlatButton(
                      padding:EdgeInsets.all(25.0),
                  onPressed: () => btClick(val),
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white,width: 0.5),
                  ),
                  child:Text(
                    val,
                    style: TextStyle(fontSize: 35.0, color: Colors.yellowAccent),
                  ),
                  ),
    );
  }

  int first,second;
  String res,text = "";
  String op;
  void btClick(String btTxt) {
    if(btTxt=="c"){
      res="";
      text="";
      first=0;
      second=0;
    }
    else if(btTxt=="+" || btTxt=="-" || btTxt=="x" || btTxt=="/"){
      first=int.parse(text);
      res="";
      op=btTxt;
    }
    else if(btTxt=="="){
      second=int.parse(text);
      if(op=="+"){
        res=(first+second).toString();
      }
      if(op=="-"){
        res=(first-second).toString();
      }
      if(op=="x"){
        res=(first*second).toString();
      }
      if(op=="/"){
        res=(first ~/second).toString();
      }
    }

    else{
      res=int.parse(text+btTxt).toString();
    }
    setState(() {
      text=res;
    });
  }
}
