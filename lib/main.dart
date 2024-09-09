import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  // _MyLoginPageState
  // _MyHomePageState
}

class _MyHomePageState extends State<MyHomePage> {
  void doNothing() {
    print('Start quiz');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(
                    'https://images.unsplash.com/photo-1471897488648-5eae4ac6686b?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.darken),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Column(
                  children: <Widget>[
                    Icon(Icons.chat_bubble,
                        size: 80.0, color: Color.fromARGB(255, 10, 92, 186)),
                    Text(
                      'ITI Quiz App',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico',
                        color: const Color.fromARGB(255, 10, 92, 186),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'We Are Creative, enjoy our app',
                      style: TextStyle(
                        fontFamily: 'roboto', // Use custom font here
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: doNothing,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 10, 92, 186),
                    padding: const EdgeInsets.all(20.0),
                  ),
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyLoginPageState extends State<MyHomePage> {
  void doNothing() {
    print('start quiz');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity, // Full width of the screen
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const NetworkImage(
                    'https://images.unsplash.com/photo-1471897488648-5eae4ac6686b?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Network image URL
                fit: BoxFit.cover, // Fit the image to cover the background
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7),
                    BlendMode.darken), // Apply 0.7 opacity
              ), // DecorationImage
            ), // BoxDecoration
          ), // Container
          // Cute Icon
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: const Column(
              children: [
                Icon(
                  Icons.rocket, // Replace with your desired icon
                  size: 60.0, // Size of the icon
                  color: Colors.white, // Color of the icon
                ),
                SizedBox(height: 10.0), // Space between icon and text
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Login Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20.0), //
              decoration: const BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0)), // Rounded top corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Remember Me and Forgot Password
                      Row(
                        children: [
                          Checkbox(
                            value: false, // Manage this state if needed
                            onChanged: (bool? value) {
                              // Handle Remember Me action
                            },
                          ),
                          const Text('Remember Me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle Forgot Password action
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: doNothing,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // Background color
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0), // Padding
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('New to quiz?'),
                      TextButton(
                        onPressed: () {
                          // Handle Register action
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                      onPressed: () {
                        // Handle Use Touch ID action
                      },
                      child: const Column(
                        children: [
                          Icon(
                            Icons.fingerprint,
                            color: Colors.deepPurple,
                            size: 60,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Use Touch ID',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
