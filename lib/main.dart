import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskPi',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: Colors.deepPurple,
          secondary: Colors.deepPurpleAccent,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              extended: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              minWidth: 120,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined, size: 32),
                  selectedIcon: Icon(Icons.home, size: 32),
                  label: Text('Home', style: TextStyle(fontSize: 18)),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.list_outlined, size: 32),
                  selectedIcon: Icon(Icons.list, size: 32),
                  label: Text('Tasks', style: TextStyle(fontSize: 18)),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.calendar_today_outlined, size: 32),
                  selectedIcon: Icon(Icons.calendar_today, size: 32),
                  label: Text('Calendar', style: TextStyle(fontSize: 18)),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined, size: 32),
                  selectedIcon: Icon(Icons.settings, size: 32),
                  label: Text('Settings', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.background,
                child: Center(
                  child: Text(
                    'Content for page $_selectedIndex',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
