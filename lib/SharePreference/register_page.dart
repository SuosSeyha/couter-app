import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool isShow1=true;
  bool isShow2=true;
  static const keyEmail='email';
  static const keyPassword='password';
  void clearData(){
    emailController.clear();
    passwordController.clear();
    confirmpasswordController.clear();
  }
  Future register(String email,String password,String comfirm)async{
    if(formkey.currentState!.validate()){ // success
      if(password==comfirm){ // write to device
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(keyEmail, email);
        await prefs.setString(keyPassword, password);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(
            'Register successful.'
          ),
          duration: Duration(
            seconds: 3
          ),
          ));
          clearData();
      }
    }else{ // error
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Register'
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
                  obscureText: isShow1,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShow1=!isShow1;
                        });
                      },
                      icon:  Icon(
                        isShow1?Icons.visibility_off : Icons.visibility
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20
                ),
                child: TextFormField(
                  obscureText: isShow2,
                  controller: confirmpasswordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShow2=!isShow2;
                        });
                      },
                      icon:  Icon(
                        isShow2?Icons.visibility_off : Icons.visibility
                      ),
                    ),
                    label: const Text(
                      'Confirm password'
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
                      return 'confirm password must be 6 characters';
                    }else if(passwordController.text != confirmpasswordController.text){
                      return 'confirm password not eqaul';
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
                    register(
                      emailController.text,
                      passwordController.text,
                      confirmpasswordController.text
                    );
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
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}