import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greenie/register.dart';
import 'package:greenie/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      showErrorMessage(context, "Inserisci email e password per accedere.");
      return;
    }
    setState(() {
      _isLoading = true;
    });
    // TODO login function
    setState(() {
      _isLoading = false;
    });
    return;
  }

  void _googleLogin() async {
    const List<String> scopes = [
      // "https://www.googleapis.com/auth/user.birthday.read",
      // "https://www.googleapis.com/auth/user.gender.read",
      "https://www.googleapis.com/auth/userinfo.profile",
    ];

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: scopes).signIn();

    bool authorized = googleUser != null;

    if (!authorized) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential googleUserCredentials =
        await FirebaseAuth.instance.signInWithCredential(credential);

    User? currentUser = FirebaseAuth.instance.currentUser;

    String email = '';
    String googleToken = '';
    String username = '';
    if (currentUser != null) {
      email = currentUser.email ?? '';
      googleToken = await currentUser.getIdToken() ?? '';
      username = currentUser.displayName ?? '';
    }

    if (email == '' || googleToken == '') {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showErrorMessage(context, "Autenticazione con Google fallita.");
      }

      return; //Maybe error dialog
    }

    // TODO send login to server

    setState(() {
      _isLoading = false;
    });
    return;
  }

  void _register() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {},
                style: const ButtonStyle(
                  fixedSize: WidgetStatePropertyAll<Size>(
                    Size(
                      220,
                      25,
                    ),
                  ),
                ),
                child: const Text(
                  "Accedi",
                ),
              ),
              FilledButton.icon(
                onPressed: () {},
                label: const Text("Accedi con Google"),
                icon: const Icon(FontAwesomeIcons.google),
                style: const ButtonStyle(
                  fixedSize: WidgetStatePropertyAll<Size>(
                    Size(
                      220,
                      25,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: _register,
                child: const Text("Registrati"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
