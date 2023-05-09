import 'package:flutter/material.dart';
import 'package:local_storage_11_12/SharePreference/register_page.dart';
import 'package:local_storage_11_12/SharePreference/route_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isShow=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login'
        ),
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
               const Text(
                'Welcome to login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email
                    ),
                    label: const Text(
                      'Email'
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20
                      )
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20
                      ),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2
                      )
                    ),
                  ),
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Please enter a valid email";
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5
                ),
                child: TextFormField(
                  obscureText: isShow,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShow=!isShow;
                        });
                      },
                      icon:  Icon(
                        isShow?Icons.visibility_off : Icons.visibility
                      ),
                    ),
                    label: const Text(
                      'Password'
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20
                      )
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20
                      ),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2
                      )
                    ),
                  ),
                  validator: (val) {
                    if(val!.length<6){
                      return 'password must be 6 characters';
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5
                    ),
                    decoration:  BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                        10
                      )
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You have no account yet?'
                  ),
                  TextButton(
                    onPressed: () {
                      nextScreen(context,const RegisterPage());
                    }, 
                    child: const Text(
                      'Register'
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}