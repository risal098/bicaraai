import '../controllers/accountMessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bar_items/appbar.dart';
import '../screens/login_page.dart';
import '../screens/homePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../controllers/accountData.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String emailStatus = '';
  String pageName = "RegisterPage";
  bool ok = true;
  bool flag = true;
  String status="";
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // void signUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const UpBar(),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.92,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF527EE7),
                  Color(0xFF15CAD7),
                  Color(0xFF1CC2D9),
                  Color(0xFF20BCDA),
                  Color(0xFF0FD3D5),
                ],
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 30),
                child: Text(
                  "Let's \nJoin Us!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: ListView(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/logo_1.png"),
                          Text(" Account"),
                          
                        ],
                      ),Text(status),
                      Container(
                        height: 60,
                        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              emailStatus = AccountMessage.emailValidator(value);
                            });
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Email",
                            label: Text("Email"),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(emailStatus, style: TextStyle( fontSize: 12, color: Colors.red),),
                      ),
                      Container(
                        height: 65,
                        padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
                        child: TextFormField(
                          maxLength: 24,
                          controller: usernameController,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Username",
                            label: Text("Username"),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          maxLength: 24,
                          controller: passwordController,
                          obscureText: ok,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Password",
                            label: Text("Password"),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  ok ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  if (ok) {
                                    ok = false;
                                    return;
                                  }
                                  ok = true;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          onPressed: () async{
                            if(emailStatus==''){
                              String usernameValue=usernameController.text;
                              String passwordValue=passwordController.text;
                              String emailValue=emailController.text;
                              var response= await http.post(Uri.https("bicaraai12.risalahqz.repl.co","register")
                              ,body:jsonEncode([emailValue,usernameValue,passwordValue]));
                              var code=response.statusCode;
                              var data=jsonDecode(response.body);
                              print(data);
                              print(code);
                              if(code==200){
                                print(data);
                                AccountData.email=emailValue;
                                AccountData.userId=data[0];
                                AccountData.username=usernameValue;
                                response= await http.post(Uri.https("bicaraai12.risalahqz.repl.co","premium")
                              ,body:jsonEncode([data[0],emailValue]));
                              code=response.statusCode;
                              data=jsonDecode(response.body);
                              AccountData.isPrem=data[0];
                              AccountData.permissionStatus=data[3];
                              AccountData.deadlinePermission=data[2];
                              await  AccountData.getData();
                                Get.off(HomePage());}
                              else{
                                setState(() {
                                  status=data[1];
                                });
                              }
                            }
                          },
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF527EE7)),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              )),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already a member?"),
                          TextButton(
                              onPressed: () {
                                Get.off(LoginPage());
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Color(0xFF527EE7),
                                ),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/vector_3.png"),
                            Text("OR"),
                            Image.asset("assets/images/vector_3.png")
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  spreadRadius: 0.1,
                                  blurRadius: 1)
                            ]),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 70),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                    "assets/images/flat-color-icons_google.png"),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
