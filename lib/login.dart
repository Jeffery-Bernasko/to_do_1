import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png'),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
          
            Container(
              padding: EdgeInsets.only(left: 35,top: 130),
              child: Text("Welcome Back",
                style: TextStyle(color: Colors.white,fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.5
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35,right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              //filled: true,
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                            ),
                          ),
                          SizedBox(height: 30,),

                          TextField(
                            controller: _passwordController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                               // filled: false,
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock_open_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                          ),
                          SizedBox(height: 40,),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Login",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700),),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                  onPressed: (){
                                    // a dummy condition to validate the email and password..lol
                                    if(!_emailController.text.contains("@") || _passwordController.text.length < 4)
                                    {
                                      Fluttertoast.showToast(msg: "Please enter correct email and password");
                                    }else
                                    {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Home()));
                                    }
                                  },
                                  icon: Icon(Icons.arrow_forward_outlined),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children:[
                            TextButton(
                                onPressed: () {
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff4c505b),
                                    fontSize: 18,
                                  ),
                                )),
                              ]
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
