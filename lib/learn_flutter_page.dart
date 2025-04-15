import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Flutter"),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("Actions");
            },
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/AlbertE.jpg"),
            SizedBox(height: 10),
            Divider(color: Colors.black),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.blueGrey,
              width: double.infinity,
              child: Center(
                child: Text(
                  "This is a Text",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSwitch ? Colors.deepPurple : Colors.purple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                debugPrint('Elevated Button');
              },
              child: Text("Elevated Button"),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Outlined Button');
              },
              child: Text("Outlined Button"),
            ),
            TextButton(
              onPressed: () {
                debugPrint('Text Button');
              },
              child: Text("TextButton"),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint("This is the row");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.local_fire_department, color: Colors.purple),
                  Text("Row Widget"),
                  Icon(Icons.local_fire_department, color: Colors.purple),
                ],
              ),
            ),
            Switch(
              value: isSwitch,
              onChanged: (bool newbool) {
                setState(() {
                  isSwitch = newbool;
                });
              },
            ),
            Checkbox(
              value: isCheckBox,
              onChanged: (bool? newbool) {
                setState(() {
                  isCheckBox = newbool;
                });
              },
            ),
            Image.network(
              'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=60.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
