import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeActivity(),
    )

  );
}

class HomeActivity extends StatefulWidget {



  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  String Output="0";
  String _out="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";
  PressedButton(String val){
        print(val);
        if(val=="C"){
          _out="0";
          num1=0;
          num2=0;
          operand="";

        }else if(val =="+"||val =="-"||val =="*"||val =="/"){
          num1=double.parse(Output);
          operand=val;
          _out="0";
          Output=Output+val;

        }
        else if(val=='<'){
          _out=_out.substring(0,_out.length-1);
        }
        else if(val=="."){
          if(_out.contains(".")){
            return;
          }
          else{
            _out=_out+val;
          }
        }else if(val=="="){
      num2=double.parse(Output);
    if(operand=="+"){
          _out=(num1+num2).toString();
                    }
    if(operand=="-"){
  _out=(num1-num2).toString();
                    }
    if(operand=="*"){
  _out=(num1*num2).toString();
                    }
    if(operand=="/"){
  _out=(num1/num2).toString();
                    }
    num2=0.0;
    num1=0.0;
        }
        else{
    _out=_out+val;
        }

        setState(() {
          Output=double.parse(_out).toStringAsFixed(2);
          
        });
  }
  Widget CalBtn(String Btnval){
    return Expanded(
      child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color:Colors.blueGrey,
              boxShadow:[
                BoxShadow(
                  color:Colors.white,
                  offset:Offset(2.0,2.0),
                  blurRadius: 8.0,
                  spreadRadius: 1.0,


                ),
                BoxShadow(
                  color:Colors.white,
                  offset:Offset(-2.0,-2.0),
                  blurRadius: 8.0,
                  spreadRadius: 1.0,


                ),



              ]
          ),
          child:MaterialButton(
            padding: EdgeInsets.all(10.0),
            child: Text(Btnval,style:TextStyle(
              fontSize: 22.0,
            ),),
            onPressed: ()=>PressedButton(Btnval),
          )
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Container(
            child:Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 50.0),
                   child: Text(Output,style: TextStyle(
                     fontSize: 60.0
                   ),),
                ),
                Expanded(
                  child: Divider(),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children:<Widget> [
                       CalBtn("."),
                        CalBtn("C"),
                        CalBtn("<"),
                        CalBtn("*"),
                      ],
                    ),

                    Row(
                      children:<Widget> [
                        CalBtn("7"),
                        CalBtn("8"),
                        CalBtn("9"),
                        CalBtn("/"),
                      ],
                    ),

                    Row(
                      children:<Widget> [
                        CalBtn("4"),
                        CalBtn("5"),
                        CalBtn("6"),
                        CalBtn("+"),
                      ],
                    ),
                    Row(
                      children:<Widget> [
                        CalBtn("1"),
                        CalBtn("2"),
                        CalBtn("3"),
                        CalBtn("-"),
                      ],
                    ),
                    Row(
                      children:<Widget> [
                        CalBtn("0"),
                        CalBtn("="),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

        ),


    );
  }
}
