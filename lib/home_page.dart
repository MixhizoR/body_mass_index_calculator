import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _sonuc = 0;
  TextEditingController _boyController = TextEditingController();
  TextEditingController _kiloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body mass index calculator"),
      ),
      body: SizedBox(
        height: 500,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  _sonuc.toStringAsFixed(2),
                  style: TextStyle(fontSize: 36),
                ),
                TextField(
                  decoration: InputDecoration(
                      suffix: Text("m"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      label: Text("Boyunuz")),
                  keyboardType: TextInputType.number,
                  controller: _boyController,
                ),
                TextField(
                  decoration: InputDecoration(
                      suffix: Text("kg"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      label: Text("Kilonuz")),
                  keyboardType: TextInputType.number,
                  controller: _kiloController,
                ),
                ElevatedButton(
                    onPressed: _calculate,
                    child: Text(
                      "Hesapla",
                      style: TextStyle(fontSize: 36),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculate() {
    try {
      double kilo = double.parse(_kiloController.text);
      double boy = double.parse(_boyController.text);

      setState(() {
        _sonuc = kilo / (boy * boy);
      });
    } catch (e) {
      print("Bir hata oluştu!: ${e.toString()}.");
    }
  }
}
