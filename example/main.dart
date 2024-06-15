import 'package:flutter/material.dart';
import 'package:inspectx/inspectx.dart'; // Import the InspectX widget
import 'naivigation_routes.dart'; // Import your navigation routes

// Abstract base class for views
abstract class BaseView extends StatefulWidget {
  const BaseView({super.key});
}

// Abstract base state class for views
abstract class BaseViewState<Page extends BaseView> extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    // Wrap the content in InspectX to display class name
    return InspectX(
      className: widget.runtimeType, // Display the class name
      child: buildContent(context), // Build the content of the view
    );
  }

  // Abstract method to build the content of the view
  Widget buildContent(BuildContext context);
}

// Home screen view
class HomeScreen extends BaseView {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseViewState<HomeScreen> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is the Home Screen'),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.kSettingsScreen);
                },
                child: const Text("Settings ->"))
          ],
        ),
      ),
    );
  }
}

// Settings screen view
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: const Center(
        child: Text('This is the Settings Screen'),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.kHomeScreen,
    );
  }
}
