import 'package:flutter/material.dart';
void main() => runApp(LayoutCard());

class LayoutCard extends StatelessWidget {
  const LayoutCard ({super.key});
  @override  
  Widget build (BuildContext context) { 
    return MaterialApp(
      home: Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Opacity(
                opacity: 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/my photo.jpg', 
                    width: 500,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Center(
                child: Text(
                  'Special Offe!!!r!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 6,
                        color: Colors.black45,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );    
  }
}
