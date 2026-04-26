import 'package:flutter/material.dart';
import 'package:pms_system/dashboard_page.dart';
import 'package:pms_system/screen/onboarding/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userIdController = TextEditingController();
  var passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter UserId";
                      }
                      return null;
                    },
                    controller: userIdController,
                    decoration: InputDecoration(
                      hintText: "UserId",
                      labelText: "Enter UserId ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)
                      )
                    ),
                  ),
                  SizedBox(height: 21,),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Enter Password ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)
                        )
                    ),
                  ),
                  SizedBox(height: 21,),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                          onPressed: ()async{
                          if(formKey.currentState!.validate()){
                            var prefs = await SharedPreferences.getInstance();
                            String? savedUserId = prefs.getString("userId");
                            String? savedPassword = prefs.getString("password");

                            if(savedUserId == userIdController.text && savedPassword == passwordController.text){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashboardPage()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login successfully.", ), backgroundColor: Colors.green,),
                              );
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Invalid Credentials...", ), backgroundColor: Colors.red,),
                              );
                            }
                          }
                          }, child: Text("Login"))),
                  SizedBox(height: 21,),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignupPage()));
                    },
                    child: Center(
                      child: RichText(text: TextSpan(children: [
                        TextSpan(text: "Don't have an account, ", style: TextStyle(color: Colors.black,fontSize: 18)),
                        TextSpan(text: "Sign Up", style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold,fontSize: 18),
                        )])
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
