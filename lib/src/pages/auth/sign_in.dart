import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/logo.dart';
import '../../widgets/textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 600,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(.65), BlendMode.colorBurn),
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(55),
                            bottomRight: Radius.circular(55))
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 600,
                    padding: EdgeInsets.only(left: 25,right: 25),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black12, Colors.grey],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(2.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(55),
                            bottomRight: Radius.circular(55))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        SizedBox(height: 15,),
                        AppLogo(height: 250,),
                        Container(
                          margin: EdgeInsets.only(left: 20,right: 20),
                          child: Column(
                            children: const [
                              TextFieldApp(hint: 'EMAIL',),
                              SizedBox(height: 15,),
                              TextFieldApp(hint: 'PASSWORD',isPasswordl: true,),
                              SizedBox(height: 20,)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Container(
                  height: 45,
                  width: 170,
                  margin: EdgeInsets.only(left: 50,right: 50),
                  child: GradientButton(buttonTEXT: 'SIGN IN',)),
              SizedBox(height: 20,),
              Container(
                  height: 45,
                  width: 250,
                  margin: EdgeInsets.only(left: 50,right: 50),
                  child: GradientButton(buttonTEXT: 'CREATE AN ACCOUNT',
                  color: Colors.white,textColor: Colors.black,)),
            ],
          ),
        ),
      ),
    );
  }
}
