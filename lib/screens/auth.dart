import 'package:flutter/material.dart';

class AuthPages extends StatefulWidget {
  const AuthPages({super.key});

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {


   TextEditingController _emailController  = TextEditingController();
   TextEditingController _passwordController  = TextEditingController();

   var _email;
   var _password;
   bool showLogin = true;

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

    Widget _input(Icon icon, String hint, TextEditingController controller, bool obsecure){
      return Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: controller,
            obscureText: obsecure,
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white24),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3)
              ),
               enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1)
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: IconTheme(data: IconThemeData(color: Colors.white), child: icon ),  
              )
            ),
          ),
      );
    }

    Widget _button(String text, void func()){
       return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          splashFactory: InkSplash.splashFactory,
          foregroundColor: 
          Theme.of(context).primaryColor,
          elevation: 5,
          shadowColor: Colors.black
        ),
        onPressed: func,
        child: Text(
          'Log in', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        );
    }


      Widget _form(String label, void func()){
        return Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: _input(Icon(Icons.email), "Email", _emailController, false),
              ),
               Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _input(Icon(Icons.lock), "Password", _passwordController, true)
              ),
              SizedBox(
                height: 20,
              ),
              Padding(padding: EdgeInsets.only(left: 20, right: 20,),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func),
              ),)
            ],
          ),
        );
      }


    void _buttonAction(){
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
    }


  Widget _bottomWave() {
    return Expanded(
      child: Align(
        child: ClipPath(
          child: Container(
            color: Colors.white,
            height: 300,
          ),
          clipper: BottomWaveClipper(),
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }
 
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: <Widget>[
          _logo(),
          (
            showLogin 
            ? Column(
              children: <Widget>[
                  _form("Log in", _buttonAction),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Text('Not registered yet? Register!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          showLogin = false;
                        });
                      },
                    ),
                  )
              ],
            )
            : Column(
              children: <Widget>[
                  _form("Register ", _buttonAction),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Text('Already registered? Log in!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          showLogin = true;
                        });
                      },
                    ),
                  )
              ],
            )
          ),
          _bottomWave()
        ],
      )
    );
  }
}