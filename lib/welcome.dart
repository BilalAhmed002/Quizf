import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});
  @override
  State<welcome> createState() => _welcomeState();
}
class _welcomeState extends State<welcome> {
  double kDefalutPadding = 20;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
          image: AssetImage(  "assets/image/bglogin1.png", ),fit: BoxFit.fill,
                  )
                ),
          child: SingleChildScrollView(
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            Padding(
              padding: const EdgeInsets.only(top: 250,right: 100),
              child: Text(
                "Let's Play Quiz",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                    color:  Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
                Padding(
                   padding: const EdgeInsets.only(left: 10,right: 100),
                     child: Text(
                    "Enter your information blow",
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                    color:  Colors.orange,fontWeight: FontWeight.bold,fontSize: 20),
                   ),
                ),
                     const SizedBox(height: 20,),
                     const Padding(
                       padding: EdgeInsets.only(left: 0),
                       child: TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Full Name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    )
                                ),
                              ),
                     ),
                      const SizedBox(
                        height: 60,
                      ),
               Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                  FloatingActionButton(
                     child: Icon(Icons.arrow_forward),
                     backgroundColor: Colors.orange,
                     foregroundColor: Colors.black,
                     onPressed: () => {
                       Navigator.pushNamed(context, 'Question')
                     },
                    ),
                  ],
                )
              ]
            ),
          ),
        ),
      ),
        ),
    );

  }
}
