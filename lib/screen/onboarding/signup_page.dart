import 'package:flutter/material.dart';
import 'package:pms_system/screen/onboarding/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}
class _SignupPageState extends State<SignupPage> {

  var userIdController = TextEditingController();
  var passwordController = TextEditingController();
  var conformPasswordController = TextEditingController();

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
                  TextFormField(
                    validator: (value){
                      if(passwordController.text != conformPasswordController.text){
                        return "Password doesn't match";
                      }else {
                        return null;
                      }
                    },
                    controller: conformPasswordController,
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        labelText: "Enter Confirm Password ",
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
                              prefs.setString("userId", userIdController.text);
                              prefs.setString("password", passwordController.text);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Account created successfully.", ), backgroundColor: Colors.green,),
                              );
                            }
                          }, child: Text("Sign Up"))),
                  SizedBox(height: 21,),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    },
                    child: Center(
                      child: RichText(text: TextSpan(children: [
                        TextSpan(text: "Already have an account, ", style: TextStyle(color: Colors.black,fontSize: 18)),
                        TextSpan(text: "Log in", style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold,fontSize: 18),
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
