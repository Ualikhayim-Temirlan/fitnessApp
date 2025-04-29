import 'package:flutter/material.dart';

class AuthPages extends StatefulWidget {
  const AuthPages({super.key});

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {

  @override
  Widget build(BuildContext context) {

      Widget _logo(){
        return Padding(
          padding: EdgeInsets.only(top: 100),
          child: Container(
            child: Align(
              child: Text("TIMFIT", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
            ),
          ),
        );
      }


      Widget _form(String label, void func()){
        return Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: Text("Email"),
              ),
               Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text("Password"),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(padding: EdgeInsets.only(left: 20, right: 20,),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text(label),
              ),)
            ],
          ),
        );
      }

 
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: <Widget>[
          _logo(),
          _form("Log in",  (){}),

        ],
      )
    );
  }
}