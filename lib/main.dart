import 'package:flutter/material.dart';
import 'package:flutter_simple_projects/logIn_app.dart';
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
      home: const MyHomePage(title: 'BMI Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inchController=TextEditingController();
  var bgColor;

  var result=" ";
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Text("BMI APP",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 40,color: Colors.pink),),
                ),
                TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.line_weight),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orange
                        ),
                      ),
                      label: Text("Enter wt in (kg)"),
                      labelStyle: TextStyle(color:Colors.orange,fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)
                      )

                    ),
                  ),

                SizedBox(
                  height: 20,
                ),

                  TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.height),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purpleAccent
                          ),
                        ),
                        label: Text("Enter height in (feets)"),
                        labelStyle: TextStyle(color:Colors.purpleAccent,fontWeight: FontWeight.w800),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)
                        )
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),

                   TextField(
                    controller: inchController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.height),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueAccent
                          )
                        ),
                        label: Text("Enter height in (inches)"),
                        labelStyle: TextStyle(color:Colors.blueAccent,fontWeight: FontWeight.w800),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)
                        ),

                    ),
                  ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: (){
                  var wt=wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch=inchController.text.toString();

                  if(wt!=" " && ft!=" " && inch!=""){
                      var wtDouble=double.parse(wt);
                      var ftInt=int.parse(ft);
                      var inchInt=int.parse(inch);

                      var tInch= (ftInt*12)+inchInt;
                      var tCm=tInch*2.58;
                      var tM=tCm/100;

                      double BMI=(wtDouble/(tM*tM));
                      var msg="";

                      if(BMI>25){
                        msg="You'r overweight";
                        bgColor=Colors.orange;
                      }
                      else if(BMI<18){
                        msg="You'r underewight";
                        bgColor=Colors.red;
                      }
                      else{
                        msg="You'r healthy";
                        bgColor=Colors.greenAccent;
                      }
                      result="$msg \n Your BMI is ${BMI.toStringAsFixed(2)}";
                      setState(() {

                      });
                  }
                  else{
                    setState(() {
                      result="Please fill all the required fields";
                    });
                  }
                  setState(() {
                  });
                }, child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Calculate",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo, // Set the background color here
                    foregroundColor: Colors.white,
                    side: BorderSide(
                        color: Colors.greenAccent, // Border color
                        width: 2,
                    ),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(result,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                ),
                ElevatedButton(onPressed: () async{
                  SpalshScreenState.KEYNAME="false";
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>loginPage()));
                }, child: Text("LogOut"))
              ],
            ),
          ),
        ),
      )

    );
  }
}
