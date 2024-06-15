
# InspectX

**InspectX** is a Flutter widget that wraps around a screen and displays the class name at the bottom. It's a useful tool for debugging and development, allowing developers to easily identify which screen or widget is currently being displayed.

<br>

![Preview Image](https://firebasestorage.googleapis.com/v0/b/push-token-97cfc.appspot.com/o/Untitled%20design.png?alt=media&token=24cd6d6d-dfa8-453f-896d-30d7fdd49f87)

<br>

## Features

- Displays class name at the bottom of the screen
- Works with both child and page widgets
- Customizable visibility

<br>

## Installation

To use this package, add **inspectx** as a dependency in your **pubspec.yaml** file. For example:

```
dependencies:
    flutter:
        sdk: flutter
    inspectx: ^1.0.2
```
<br>

## Usage
**InspectX** provides a flexible way to display the class name of your widgets at runtime, aiding in debugging and development. There are two primary methods to utilize **InspectX** in your Flutter application:

Import the package in your Dart code:

```
import 'package:inspectx/inspectx.dart';
```


### Method 1: Using `BaseView` Abstract Class
---
This method is recommended for industrial projects. By extending your views from the **BaseView** abstract class, you can effortlessly integrate **InspectX** across your entire app with minimal code changes. This approach leverages inheritance to provide the benefits of **InspectX** to all your views by adding a few lines of code to **BaseView** once.

#### Example
1. Define a `BaseView` abstract class:
```
import 'package:flutter/material.dart';
import 'package:inspectx/inspectx.dart';

// Abstract base view class
abstract class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
}

// Abstract base view state class
abstract class BaseViewState<Page extends BaseView> extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    // Wrap the content in InspectX to display the class name
    return InspectX(
      className: widget.runtimeType,
      child: buildContent(context),
    );
  }

  // Abstract method to build the content of the view
  Widget buildContent(BuildContext context);
}
```
2. Create your views by extending **BaseView**:

```
// Home screen view
class HomeScreen extends BaseView {
  const HomeScreen({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text('Settings ->'),
            ),
          ],
        ),
      ),
    );
  }
}
```

*Note: Once you have wrapped the BaseView Parent widget with **InspectX** widget, you can enjoy the benefits by **extending** your other classes with BaseView.*

<br>

### Method 2: Wrapping Individual Widgets
---
For smaller projects or specific use cases, you can wrap individual widgets with **InspectX** to display the class name only where needed. This method provides flexibility by allowing you to selectively apply **InspectX**.

<br>

#### Example
```
import 'package:flutter/material.dart';
import 'package:inspectx/inspectx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InspectX(
        className: runtimeType,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Example App'),
          ),
          body: Center(
            child: InspectX(
              className: runtimeType,
              child: Text('Hello, World!'),
            ),
          ),
        ),
      ),
    );
  }
}
```

Also you can easily use the package by individual pages by Wrapping the Class name in the Navigation Routes option.

```
// Define the Routes class
import 'package:flutter/material.dart';
import 'package:inspectx/inspectx.dart';

import 'main.dart';

class Routes {
  static const String kHomeScreen = "kHomeScreen";
  static const String kSettingsScreen = "kSettingsScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: const RouteSettings(name: Routes.kHomeScreen),
        );
      case Routes.kSettingsScreen:
        return MaterialPageRoute(
          builder: (_) => const InspectX(page: SettingsScreen()),
          settings: const RouteSettings(name: Routes.kSettingsScreen),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Invalid Route"),
            ),
          ),
        );
    }
  }
}
```
Then,

```
// Settings screen view
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
```

Explore the package's documentation for advanced usage and customisation options.

With InspectX, you can enjoy enhanced debugging and development experiences in your Flutter projects, whether you apply it across your entire app using BaseView or selectively wrap individual widgets as needed.

<br>

## API Reference

For detailed information on classes, methods, and properties, refer to the [API reference](api-reference.md).

<br>

## Example

Check out the [examples](examples.md) for different use cases of InspectX.

<br>

## Troubleshooting

If you encounter any issues, try the following steps:

-   Check your configuration.
-   Ensure you are using the latest version of InspectX.

<br>

## License

InspectX is licensed under the MIT License. See the LICENSE file for details.

<br>

## Contributing

Contributions are welcome!

Here is a curated list of how you can help:

-   Report bugs and scenarios that are difficult to implement
-   Report parts of the documentation that are unclear
-   Fix typos/grammar mistakes
-   Update the documentation or add examples
-   Implement new features by making a pull-request

\
\
**Copyright (c) 2024, Raveen P. Yatalamaththa**