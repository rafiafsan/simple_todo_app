import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primaryColor: Colors.red,
      //   appBarTheme: AppBarTheme(
      //     color: Colors.red,
      //     centerTitle: true,
      //   ),scaffoldBackgroundColor: Colors.grey,
      //
      // ),
      title: "First App",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    bool issubmitted = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("First App",
            style: TextStyle(fontSize: 30, color: Colors.white)),
        centerTitle: true,
      ),

      body: Column(
        children: [
          issubmitted
              ? SizedBox()
              : Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(color: Colors.black, width: 10),
                          // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                        ),
                        hintText: 'Email',
                        label: Text("Email"),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Empty mail not allowed.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(color: Colors.black, width: 10),
                          // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                        ),
                        hintText: 'Password',
                        label: Text("Password"),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return "Password is too short.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              issubmitted = true;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserInfo()));
                            }
                            //   Navigator.pushReplacement(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => UserInfo()));
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(height: 50,),

                    SizedBox(
                        height: 300,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemCount: 100,
                          itemBuilder: (context, index){
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Icon(Icons.money,size: 40,color: Colors.white,),
                                // child: Text("Item $index",
                                //   style: TextStyle(fontSize: 15, color: Colors.white),),
                              ),

                            );
                          },
                        )

                    ),
                  ],
                ),
              ))
        ],
      ),

      // body: Column(
      //   children: [
      //     TextFormField(
      //       decoration: InputDecoration(
      //         border: OutlineInputBorder(
      //             // borderSide: BorderSide(color: Colors.black, width: 10),
      //             // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
      //         ),
      //         hintText: 'Email',
      //         label: Text("Email"),
      //
      //
      //       ),
      //     ),
      //     SizedBox(height: 20),
      //     TextFormField(
      //       decoration: InputDecoration(
      //         border: OutlineInputBorder(
      //           // borderSide: BorderSide(color: Colors.black, width: 10),
      //           // borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
      //         ),
      //         hintText: 'Password',
      //         label: Text("Password"),
      //       ),
      //     ),
      //     SizedBox(height: 20,),
      //
      //     SizedBox(
      //       width: double.infinity,
      //       child: ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //               backgroundColor: Colors.green,),
      //           onPressed: (){},
      //           child:Text("Submit",style: TextStyle(color: Colors.white),)),
      //     ),
      //   ],
      // ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print("Floating Action Button Pressed.");
        },
        label: Text("Add New"),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "UserPage",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page1()));
              },
              child: Text("Page1")),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Page 1",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text("Back to Home")),

        ],
      ),
    );
  }
}
