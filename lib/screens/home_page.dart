import 'package:app/model/task_model.dart';
import 'package:app/screens/home_tab.dart';
import 'package:app/screens/profile_tab.dart';
import 'package:app/screens/tasks_tab.dart';
import 'package:app/welcome.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final String fullName;
  final Map<String, String> accountData;

  const HomePage({
    Key? key,
    required this.fullName,
    required this.accountData,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Task> _tasks = [];

  void _addTask(String taskName) {
    setState(() {
      _tasks.add(Task(name: taskName, createdBy: widget.fullName));
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _toggleComplete(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _logout() async {
    // هنا ممكن تمسح البيانات من SharedPreferences كمان لو عايز
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = [
      HomeTab(fullName: widget.fullName),
      TasksTab(
        tasks: _tasks,
        onAddTask: _addTask,
        onDeleteTask: _deleteTask,
        onToggleComplete: _toggleComplete,
      ),
      ProfileTab(
        // accountData: widget.accountData,
        allTasks: _tasks,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Assistant App'),
        backgroundColor: Colors.teal[300],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal,),
              child: Text(
                "Welcome, ${widget.fullName}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => setState(() => _selectedIndex = 0),
            ),
            ListTile(
              leading: const Icon(Icons.task),
              title: const Text("Tasks"),
              onTap: () => setState(() => _selectedIndex = 1),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () => setState(() => _selectedIndex = 2),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[200],
        unselectedItemColor: Colors.grey,
        onTap: (newIndex) => setState(() => _selectedIndex = newIndex),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}








// ====================
/* import 'package:app/screens/task_tab.dart';
import 'package:app/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_tab.dart';
import 'profile_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> _tasks = [];
  String fullName = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String first = prefs.getString('first_name') ?? '';
    String last = prefs.getString('last_name') ?? '';
    setState(() {
      fullName = '$first $last';
    });
  }

  void _addTask(String taskName) {
    setState(() {
      _tasks.add({
        'task': taskName,
        'completed': false,
        'createdBy': fullName,
      });
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _toggleComplete(int index) {
    setState(() {
      _tasks[index]['completed'] = !_tasks[index]['completed'];
    });
  }

   Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // رجوع لصفحة Welcome Screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
      (route) => false,
    );
  }

  List<Widget> get _tabs => [
        HomeTab(fullName: fullName),
        TasksTab(
          tasks: _tasks,
          onAddTask: _addTask,
          onDeleteTask: _deleteTask,
          onToggleComplete: _toggleComplete,
        ),
        ProfileTab(allTasks: _tasks),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(child: Text("Welcome, $fullName")),
            ),
            ListTile(
              title: Text("Tasks"),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Profile"),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
 */