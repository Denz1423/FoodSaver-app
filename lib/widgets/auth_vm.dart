import 'package:flutter/material.dart';

class AuthVM extends StatefulWidget {
  AuthVM(this.submitForm);

  final void Function(String email, String password, String userName,
      bool isLogin, BuildContext ctx) submitForm;

  @override
  State<AuthVM> createState() => _AuthVMState();
}

class _AuthVMState extends State<AuthVM> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context)
        .unfocus(); //Close keyboard after submit button pressed

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitForm(_userEmail.trim(), _userPassword.trim(),
          _userName.trim(), _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: const ValueKey('email'),
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter a valid email address!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (emailValue) {
                    _userEmail = emailValue!;
                  },
                ),
                if (!_isLogin)
                  TextFormField(
                    key: const ValueKey('username'),
                    validator: (username) {
                      if (username!.isEmpty || username.length < 3) {
                        return 'Username must be at least 3 characters long!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Username'),
                    onSaved: (nameValue) {
                      _userName = nameValue!;
                    },
                  ),
                TextFormField(
                  key: const ValueKey('password'),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return 'Password must be at least 6 characters long!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (passwordValue) {
                    _userPassword = passwordValue!;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                  onPressed: _submit,
                  icon: Icon(Icons.lock_open, size: 32),
                  label: Text(
                    _isLogin ? "Login" : "SignUp",
                    style: TextStyle(fontSize: 24),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(45),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isLogin
                          ? "Don't have an account?"
                          : "Already have an account?",
                      style: TextStyle(color: Colors.greenAccent.shade700),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin ? "SignUp" : "Login"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
