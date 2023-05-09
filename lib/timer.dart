import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';



class Foo extends StatefulWidget {
  @override
  State<Foo> createState() => _FooState();
}
 red() {
    var now = new DateTime.now();
   // var formatter = new DateFormat('yyyy-MM-dd');
  //  String formattedDate = formatter.format(now);
  //  print(formattedDate); // 2016-01-25
  }
class _FooState extends State<Foo> {
 

  @override
  void setState(VoidCallback fn) {
    red();
    super.setState(fn);
  }

  Widget build(BuildContext context) {
 //   DateTime now = new DateTime.now();
// DateTime date = new DateTime(now.year, now.month, now.day);
DateTime now = DateTime.now();
String formattedDate = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
String formattedTime = '${(now.hour + 1).toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
print(formattedDate);
print(formattedTime);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counting...'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Countdown(
              // controller: _controller,
              seconds: 48,
              build: (_, double time) => Text(
                time.toString(),
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              interval: Duration(hours: 10),
              onFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Timer is done!'),
                  ),
                );
                
                //   Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //              builder: (context) => Firstscreen()));
              },
              
            ),
          ),
          
        ],
      ),
    );
  }
}
