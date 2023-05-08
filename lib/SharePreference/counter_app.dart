import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CounterApp extends StatefulWidget {
  const CounterApp({super.key});
  @override
  State<CounterApp> createState() => _CounterAppState();
}
class _CounterAppState extends State<CounterApp> {
  @override
  void initState() {
    super.initState();
    getCounter();
  }
  int counter=0;
  static const String Mykey ='myapp';
  Future Increase()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    counter++;
    await prefs.setInt(Mykey, counter);
  }
  Future Descrease()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    counter--;
    await prefs.setInt(Mykey, counter);
  }
  Future getCounter()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt(Mykey))!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Counter App'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              counter.toString(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                  ),
                  onPressed: () {
                    setState(() {
                      Descrease();
                    });
                  }, 
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8
                    ),
                    child:  Icon(
                      Icons.remove,
                      size: 30,
                    ),
                  )
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)
                  ),
                  onPressed: () {
                    setState(() {
                      Increase();
                    });
                  },
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8
                    ),
                    child:  Icon(
                      Icons.add,
                      size: 30,
                    ),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}