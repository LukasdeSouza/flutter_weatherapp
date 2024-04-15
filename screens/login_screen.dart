import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override 
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool _isObscure = true;
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
      child: Container(
          height: 350,
          width: 300,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 6,
                blurRadius: 20,
                offset: Offset(-1, 3)
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Image.asset(
                'assets/oo-logo.png',
                scale: 2,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  labelText: 'E-mail',
                  focusColor: Colors.indigoAccent
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                obscureText: _isObscure,
                controller: _controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(color: Color(0xFFDDDDDD))),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Color(0xFF054591),
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 30),
              Container(
                  // margin: EdgeInsets.only(top: 4),
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      backgroundColor: Color(0xFF054591),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          'Do Login',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(width: 8),
                         Icon(
                          Icons.login,
                          color: Color(0xEEEEEEEE),
                          size: 18,
                        ),
                      ],
                    ),
                  )),
                  const  SizedBox(height: 24),
                   Text(
                    'developed by @LukasdeSouza',
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.w300,
                      fontSize: 12
                    ),
                  )
            ],
          )),
    ));
  }

}



