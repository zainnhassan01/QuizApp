import 'package:flutter/material.dart';
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var screenwidth = mediaQuery.size.width;
    var screenheight = mediaQuery.size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
          width: screenwidth * 1,
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images.jpeg'
              )),
        ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.5,0,0.5,0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(130, 208, 29, 1),Color.fromRGBO(40, 22, 139, 0.502)],
                  tileMode: TileMode.clamp,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                  ),
              ),
              height: screenheight * 1.0,
              width: screenwidth * 1.0,
              child: Center(child: Text("Quiz App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.white),)),
            ),
          ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.5,0,0.5,0.5),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(40, 22, 139, 0.502),Color.fromRGBO(217, 217, 218, 1)],
                  tileMode: TileMode.clamp,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                  ),
              ),
              height: screenheight * 1.0,
              width: screenwidth * 1.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Let's Begin",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Color(0xFF030651)),),
                    SizedBox(height: 10,),
                    Text("Start Your Journey of being a Pro",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red.shade700),),
                    SizedBox(height: 30,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 12, 195, 18),
                        elevation: 5.0,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                          
                        )
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/choose");
                      }, 
                      child: Text("Start",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),)
                      ),
                  ],
                ),
              )
            ),
            ),
        ),
        ],
      ),
    );
  }
}
