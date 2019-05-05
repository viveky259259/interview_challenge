import 'package:flutter/material.dart';
import 'package:icici_challenge/validators/validators.dart';

class CreativeLogin extends StatefulWidget {
  @override
  _CreativeLoginState createState() => _CreativeLoginState();
}

class _CreativeLoginState extends State<CreativeLogin> {
  Color voilet = Color.fromARGB(0xFF, 0x51, 0x56, 0xce);
  Color voiletDark = Color.fromARGB(0xFF, 0x2b, 0x32, 0x82);
  FocusNode textEmailFocusNode = new FocusNode();
  FocusNode textPasswordFocusNode = new FocusNode();
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  doLogin(context, String email, String password) {
    String emailVal = Validator.validateEmail(email);
    String passwordVal = Validator.validatePassword(password);
    if (emailVal != null) {
      final snackBar = SnackBar(content: Text(emailVal));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    }
    if (passwordVal != null) {
      final snackBar = SnackBar(content: Text(passwordVal));
      _scaffoldKey.currentState.showSnackBar(snackBar);
      return;
    }
    Navigator.pushReplacementNamed(context, "/dashboard");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              Image.asset(
                "images/feature.png",
                height: 256,
                width: 256,
                color: voiletDark,
              ),
              SizedBox(
                height: 48,
              ),
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: voiletDark,
                    letterSpacing: 1),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                    color: voilet, borderRadius: BorderRadius.circular(75)),
                margin: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: emailTextController,
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: Colors.white54, letterSpacing: 1)),
                        validator: Validator.validateEmail,
                        focusNode: textEmailFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context)
                              .requestFocus(textPasswordFocusNode);
                        },
                      ),
                    ),
                    new Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle, color: voiletDark),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                    color: voilet, borderRadius: BorderRadius.circular(75)),
                margin: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordTextController,
                        focusNode: textPasswordFocusNode,
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: Colors.white54, letterSpacing: 1)),
                        validator: Validator.validatePassword,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () {
                          doLogin(context, emailTextController.text,
                              passwordTextController.text);
                        },
                      ),
                    ),
                    new Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle, color: voiletDark),
                      child: Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 48),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: voiletDark,
                      letterSpacing: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                    color: voilet, borderRadius: BorderRadius.circular(75)),
                margin: EdgeInsets.all(16),
                child: InkWell(
                  onTap: () {
                    doLogin(context, emailTextController.text,
                        passwordTextController.text);
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text("Login",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      letterSpacing: 1)),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle, color: voiletDark),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
