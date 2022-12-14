// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:safe_house_app/login.dart';
import 'createProfile.dart';

// void main() {
//   runApp(Signup());
// }

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeHouse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordIsHidden = true;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void toggleVisibility() {
    setState(() {
      if (passwordIsHidden == true) {
        passwordIsHidden = false;
      } else {
        passwordIsHidden = true;
      }
    });
  }

  void submitForm() {
    if (formKey.currentState!.validate() == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreatProfile()));
    }
  }

  String? validateName(String? value) {
    if (value == null) {
      return 'Please enter a name';
    }
    if (value.isEmpty) {
      return 'Please enter a name';
    }
    if (value.isEmpty) {
      return 'Please enter a name';
    }
    if (value.length < 3) {
      return 'The name has to be at least 3 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null) {
      return 'Please input an email';
    }
    if (value.isEmpty) {
      return 'Please input an email';
    }
    if (value.contains('@') == false) {
      return 'Email needs to have "@" symbol';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null) {
      return 'You need to enter password';
    }
    if (value.isEmpty) {
      return 'You need to enter password';
    }
    if (value.length < 6) {
      return 'The password has to be at least 6 characters';
    }
    if (value.contains(RegExp('[a-z]')) == false) {
      return 'You need a lowercase character';
    }
    if (value.contains(RegExp('[A-Z]')) == false) {
      return 'You need an uppercase character';
    }
    if (value.contains(RegExp('[0-9]')) == false) {
      return 'You need a number';
    }
    if (value.contains(RegExp('[@!.,#*&]')) == false) {
      return 'You need a special symbol';
    }
    return null;
  }

  String? validatePasswordConfirmation(String? value) {
    if (value == passwordController.text) {
      return null;
    } else {
      return 'Your password do not match, please try again';
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData passwordIcon;
    if (passwordIsHidden) {
      passwordIcon = Icons.visibility_off_outlined;
    } else {
      passwordIcon = Icons.visibility_outlined;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(
                  child: Image.network(
                      'https://i.postimg.cc/nr61FCLD/Safe-House-logo-Trans.png')),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Name'),
                  hintText: 'Lina',
                  prefixIcon: Icon(Icons.person_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: validateName,
                controller: nameController,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                validator: validateEmail,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: validatePassword,
                decoration: InputDecoration(
                  label: Text('Password'),
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(passwordIcon),
                    onPressed: toggleVisibility,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: passwordIsHidden,
                enableSuggestions: false,
                autocorrect: false,
              ),
              SizedBox(height: 20),
              if (passwordIsHidden)
                TextFormField(
                  decoration: InputDecoration(
                    label: Text('Confirm Password'),
                    prefixIcon: Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(passwordIcon),
                      onPressed: toggleVisibility,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: passwordIsHidden,
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: validatePasswordConfirmation,
                ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: submitForm,
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already have an account?'),
                  TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
