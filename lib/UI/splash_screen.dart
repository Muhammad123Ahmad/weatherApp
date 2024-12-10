import 'package:flutter/material.dart';
import 'package:weatherapp/UI/get_weather/home_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3),(){

      Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));

    });
  }

    @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return   MaterialApp(
      home: Scaffold(
        
      
       
       body:  Container(
        height: screenHeight,
        width: screenWidth,
        
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/weather.jpg'),fit: BoxFit.fill)
        ),
         child: Column(
         
         
            children: [
              
         
              SizedBox(height:screenHeight*0.6 ),
              const Center(child : Text('Weather App',style: TextStyle(fontSize: 40,fontWeight: FontWeight.w400,color: Colors.white))),
           
            ],
          ),
       ),


        ),
      );
      

    
}}