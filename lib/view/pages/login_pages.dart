import 'package:flutter/material.dart';
import 'package:login_page_1/view/pages/restion_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

 late SharedPreferences spft ;
  TextEditingController pass_word = TextEditingController();
  TextEditingController Email_adder = TextEditingController();

  String email = "";
  String passWord = "";

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  makeshar()
  async{
    spft = await SharedPreferences.getInstance();
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeshar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Image.asset("assets/images/k2.png"),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: Email_adder,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onSaved: (value)
                        {
                          email = value!;
                        },
                        validator: (value){
                          if(value!.isEmpty)
                            {
                              return "Enter the Email ID...";
                            }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          hintText: "Enter The Email",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: pass_word,
                        keyboardType: TextInputType.number,
                        // textInputAction: TextInputAction.next,
                        onSaved: (value)
                        {
                          passWord = value!;
                        },
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "Enter the  PassWoed...";
                          }
                          if(value.length<6)
                            {
                              return "Plsese Shoudl Enter 6 Charchter..... ";
                            }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          hintText: "Enter The Password",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: 150,
              child: ElevatedButton(
                onPressed: () async {
                  if(_globalKey.currentState!.validate())
                    {
                      _globalKey.currentState!.save();
                       await spft.setStringList("Loginn", [email,passWord]);
                       
                       print("${spft.getStringList("Loginn")}");
                       Navigator.push(context, MaterialPageRoute(builder: (context) => restiomPage(),));
                    }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.deepPurple),
                ),

                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
