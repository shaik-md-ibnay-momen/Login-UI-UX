import 'package:flutter/material.dart';
import 'package:shopeira/Screens/Login/components/background.dart';
import 'package:shopeira/Screens/Signup/signup_screen.dart';
import 'package:shopeira/components/already_have_an_account_acheck.dart';
import 'package:shopeira/components/rounded_button.dart';
import 'package:shopeira/components/rounded_input_field.dart';
import 'package:shopeira/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

String _email, _password, _error;
bool _isHidden = true;
final _formKey = GlobalKey<FormState>();
class Body extends StatelessWidget {

  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              buildTextField2("Email"),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildTextField2(String hintText){
    //MediaQuery.of(context);
    //var a= MediaQuery.of(context).size.width/100;
    //var b= a*89.13;
    return Container(
      //width: b,
      width: 300.0,
      height: 50.0,
      child: TextFormField(
        style: TextStyle(color: Colors.deepPurple),
        validator: (input) {
          if(input.isEmpty){
            return 'Input your email';
          }
        },

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),


          labelStyle: TextStyle(
            color: Colors.deepPurpleAccent,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 16.0,
          ),
          /* border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),*/
          prefixIcon: hintText == "Email" ? Icon(Icons.email,color: Colors.deepPurpleAccent,) : Icon(Icons.lock),
        ),
        obscureText: hintText == "Password" ? _isHidden : false,

        onSaved: (input) => _email = input,
      ),
    );
  }

}



