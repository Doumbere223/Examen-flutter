import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

import 'dashboard.dart';


class MyLogin extends StatefulWidget {
  //const MyLogin({Key key}) : super(key: key);


  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: passwordController,
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(
                              //   'Se connecter',
                              //   style: TextStyle(
                              //       fontSize: 27, fontWeight: FontWeight.w700),
                              // ),
                              TextButton(
                                onPressed: () {
                                  //print(emailController.text);
                                  //print(passwordController.text);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
                                },
                                child: Text(
                                  'Se connecter',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      //decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 15),
                                ),
                                style: ButtonStyle(),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

Future<void> login() async {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {

    var response =
    await http.post(Uri.parse("http://localhost:8080/getalllogin"),
        body: ({
          'email': emailController.text,
          'password': passwordController.text
        }));
    if (response.statusCode == 200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
    }else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Credentials.")));
    }
  }else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Black Field Not Allowed"))); 
  }
  }
 }


