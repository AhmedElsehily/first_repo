import 'package:app/screens/home_page.dart';
import 'package:app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/app_routes.dart';


class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}
class _AccountPageState extends State<AccountPage> {

 final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _jobController = TextEditingController();
  final _addressController = TextEditingController();

  String _selectedGender = 'Male'; 
  Future<void> _saveAccount() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('first_name', _firstNameController.text);
  await prefs.setString('last_name', _lastNameController.text);
  await prefs.setString('email', _emailController.text);
  await prefs.setString('job', _jobController.text);
  await prefs.setString('address', _addressController.text);
  await prefs.setString('gender', _selectedGender);

 Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => HomePage(
      fullName: '${_firstNameController.text} ${_lastNameController.text}',
      accountData: {
        'email': _emailController.text,
        'job': _jobController.text,
        'address': _addressController.text,
        'gender': _selectedGender,
      },
    ),
  ),
);

}
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _jobController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Create Your Account:'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField(_firstNameController, 'First Name'),
            _buildTextField(_lastNameController, 'Last Name'),
            _buildTextField(_emailController, 'Email'),
            _buildTextField(_jobController, 'Job Title'),
            _buildTextField(_addressController, 'Address'),

            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedGender,
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
              items: ['Male', 'Female']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveAccount,
              child: Text('Save Account', selectionColor: Colors.black,),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      
      padding: const EdgeInsets.symmetric(vertical: 12),
      
      child: Container(
        
        child: Column(
          children: [
            Card( 
              elevation: 5,
              color: Colors.lightBlueAccent[50],
              
             child:  TextField(
              controller: controller,
              cursorErrorColor: Colors.red,
              decoration: InputDecoration(
                labelText: label,
                
                border:   OutlineInputBorder(),
              ),
            ), 
            ),
          ],
        ),
      ),
    );
  }
}
