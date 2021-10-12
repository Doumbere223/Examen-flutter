import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/admin.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}
Future<AdminModel> registerAdmin(
  String nom, String email, String password, String confirmpassword,BuildContext context
) async{
  var Url = "http://localhost:8080/addLogin";
  var response = await http.post(Url,
    headers: <String , String> {"Content-Type": "application"},
    body: jsonEncode(<String , String>{
      "nom": nom,
      "email": email,
      "password": password,
      "confirmpassword": confirmpassword
    }));
  String responseString = response.body;
  if(response.statusCode == 200) {
    showDialog(context: context,
    barrierDismissible: true,
      builder: (BuildContext dialogContext){
        return MyAlertDialog(title : 'Backend response',context : response.body);
      }
    );
  }
}
class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: nameController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Nom",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: passwordController,
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextField(
                            controller: passwordController,
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "ConfirmPassword",
                                hintStyle: TextStyle(color: Colors.white),
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
                              //   'Sign Up',
                              //   style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 27,
                              //       fontWeight: FontWeight.w700),
                              // ),
                              TextButton(
                                onPressed: () {
                                  print(emailController.text);
                                  print(passwordController.text);
                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
                                },
                                child: Text(
                                  'Enregistrer',
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
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: Text(
                                  'Sign In',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
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
}

class MyAlertDialog extends StatelessWidget{
  final String title;
  final String content;
  final List<Widget>actions;
  
  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const[], String context,
  });
  
  @override
  Widget build(BuildContext context){
    return AlertDialog(
     title: Text(
       this.title,
       style: Theme.of(context).textTheme.bodyText1,
     ), 
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}

