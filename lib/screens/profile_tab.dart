import 'package:app/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTab extends StatefulWidget {
  final List<Task> allTasks;

  const ProfileTab({Key? key, required this.allTasks}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  String firstName = '';
  String lastName = '';
  String email = '';
  String jobTitle = '';
  String address = '';
  String gender = '';

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString('first_name') ?? '';
      lastName = prefs.getString('last_name') ?? '';
      email = prefs.getString('email') ?? '';
      jobTitle = prefs.getString('job_title') ?? '';
      address = prefs.getString('address') ?? '';
      gender = prefs.getString('gender') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final completedTasks =
        widget.allTasks.where((task) => task.isCompleted).toList();

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'My Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('First Name', firstName),
            _buildInfoRow('Last Name', lastName),
            _buildInfoRow('Email', email),
            _buildInfoRow('Job Title', jobTitle),
            _buildInfoRow('Address', address),
            _buildInfoRow('Gender', gender),
            const Divider(height: 40),
            const Text(
              'Completed Tasks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            ...completedTasks.map((task) => ListTile(
                  title: Text(task.name),
                  subtitle: Text('By: ${task.createdBy}'),
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
