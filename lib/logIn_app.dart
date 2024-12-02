import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_simple_projects/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const SplashScreenPage(title: 'BMI Project'),
    );
  }
}


class SplashScreenPage extends StatefulWidget{
  const SplashScreenPage({super.key, required this.title});

  final String title;
  @override
  State<SplashScreenPage> createState() => SpalshScreenState();
// TODO: implement createState

}

class SpalshScreenState extends State<SplashScreenPage>{

static String KEYNAME="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Splash Screen"),
        ),
        body:Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.blue.shade100,

         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CircleAvatar(
                 radius:50,
                 backgroundColor: Colors.blue.shade400,
                 child: Icon(Icons.home,size: 50,)),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Login Page",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
             )
           ],
         ),
        )

    );
  }
void whereToGo() async {
  var sharedPref= await SharedPreferences.getInstance();
  var isLoggedIn=sharedPref.getBool(KEYNAME);

  if(isLoggedIn!=null){
    if(isLoggedIn){
      Timer(Duration(seconds: 3),()=> Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MyHomePage(title: "Logged In"))));
    }
    else{
      Timer(Duration(seconds:3),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>loginPage())));
    }
  }
  else{
    Timer(Duration(seconds:3),()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>loginPage())));
  }
}
}



class loginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _loginPageState();
    // TODO: implement createState
  }
}
class _loginPageState extends State<loginPage>{
  var userNameController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Login App"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
        radius: 43,

          child: Icon(Icons.person,size: 60),
        ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                label: Text("password"),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrange
                  )
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  label: Text("username"),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.deepOrange
                      )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () async{
              //   If user login with their credentials
                var sharedPref= await SharedPreferences.getInstance();
                sharedPref.setBool(SpalshScreenState.KEYNAME, true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "logged In")));
              }, child: Text("Save",style: TextStyle(fontSize: 20),)),
            )
          ],
        ),
      ),
    );
  }

}
