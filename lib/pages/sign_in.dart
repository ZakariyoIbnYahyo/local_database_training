import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_database_training/pages/sign_up.dart';

class SignInPage extends StatefulWidget {
  static final String id = "signIn";
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final userController = TextEditingController();
  final pwController = TextEditingController();

  void _doSign(){
    String userName = userController.text.toString().trim();
    String pw = pwController.text.toString().trim();

    var hive = Hive.box("baza");
    hive.put("userName", userName);
    hive.put("password", pw);
    print(hive.get("userName"));
    print(hive.get("password"));
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
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image:DecorationImage(
                                image: AssetImage("assets/images/user.jpeg"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Welcome Back!", style: TextStyle( fontSize: 32, color: Colors.white),),
                      SizedBox(height: 7,),
                      Text("Sign in to continue", style: TextStyle(color: Colors.white, fontSize: 18),),
                      SizedBox(height: 80,),
                      TextField(
                        style: TextStyle(color: Colors.grey[400]),
                        controller: userController,
                        decoration: InputDecoration(
                          hintText: "User Name",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          icon: Icon(Icons.person_outline, color: Colors.grey[400],),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        style: TextStyle(color: Colors.grey[400]),
                        controller: pwController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          icon: Icon(Icons.lock_outline, color: Colors.grey[400],),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Text("Forget Password ?", style: TextStyle(color: Colors.grey[400]),),
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
                              onPressed: _doSign
                          )
                      ),
                      SizedBox(height: 100,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?", style: TextStyle(fontSize: 20, color: Colors.grey[400]),),
                          SizedBox(width: 5,),
                          GestureDetector(
                            child: Text("Sign Up", style: TextStyle(color: Colors.blue, fontSize: 20),),
                            onTap: (){
                              Navigator.pushNamed(context, SignUpPage.id);
                            },
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
