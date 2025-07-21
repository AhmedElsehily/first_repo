import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final String fullName;

  const HomeTab({Key? key, required this.fullName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome,,, $fullName!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    'assets/Screenshot_٢٠٢٣٠٥٠٦-٠٤١٠٤١_One UI Home.jpg',
                    height: 500,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'This is your account deatils ',
                    style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
