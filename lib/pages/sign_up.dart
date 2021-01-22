import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_database_training/pages/sign_in.dart';

class SignUpPage extends StatefulWidget {
  static final String id = "signUp";
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pwController = TextEditingController();

  void _signUp(){
    String uN = userController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String pw = pwController.text.toString().trim();

    var db = Hive.box("baza");
    db.put("user", uN);
    db.put("email", email);
    db.put("phone", phone);
    db.put("pw", pw);

    print(db.get("user"));
    print(db.get("email"));
    print(db.get("phone"));
    print(db.get("pw"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 18, 65, 1),
      body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      SizedBox(height: 100,),
                      Text("Create", style: TextStyle( fontSize: 32, color: Colors.white),),
                      SizedBox(height: 7,),
                      Text("Account", style: TextStyle(color: Colors.white, fontSize: 32),),
                      SizedBox(height: 80,),
                      TextField(
                        controller: userController,
                        style: TextStyle(color: Colors.grey[400]),
                        decoration: InputDecoration(
                          hintText: "User Name",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          icon: Icon(Icons.person_outline, color: Colors.grey[400],),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.grey[400]),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          icon: Icon(Icons.email_outlined, color: Colors.grey[400],),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        controller: phoneController,
                        style: TextStyle(color: Colors.grey[400]),
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          icon: Icon(Icons.phone, color: Colors.grey[400],),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        controller: pwController,
                        style: TextStyle(color: Colors.grey[400]),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          icon: Icon(Icons.lock_outline, color: Colors.grey[400],),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: FlatButton(
                            child: Image(
                              image: AssetImage("assets/images/right_button.png"),
                              fit: BoxFit.cover,
                            ),
                            onPressed: _signUp,
                          )
                      ),
                      SizedBox(height: 100,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?", style: TextStyle(fontSize: 20, color: Colors.grey[400]),),
                          SizedBox(width: 5,),
                          GestureDetector(
                              child: Text("Sign In", style: TextStyle(color: Colors.blue, fontSize: 20),),
                              onTap: (){
                                Navigator.pushNamed(context, SignInPage.id);
                              }
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
