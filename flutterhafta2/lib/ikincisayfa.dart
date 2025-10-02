import 'package:flutter/material.dart';
import 'package:flutterhafta2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ucuncusayfa.dart';

class IkinciSayfa extends StatefulWidget {
  const IkinciSayfa({super.key});

  @override
  State<IkinciSayfa> createState() => _IkinciSayfaState();
}

class _IkinciSayfaState extends State<IkinciSayfa> {
  bool _karanlikMode = false;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _karanlikMode = prefs.getBool('karanlikMod') ?? false;
      themeNotifier.value = _karanlikMode ? ThemeMode.dark : ThemeMode.light;
      textEditingController.text = prefs.getString('name') ?? '';
    });
  }

  Future<void> _verileriKaydet() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('karanlikMod', _karanlikMode);
    await prefs.setString('name', textEditingController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ayarlar Kaydedildi!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayarlar"),
        backgroundColor: Colors.red,
        actions: [
          const Icon(Icons.wb_sunny_outlined),
          Switch(
            value: _karanlikMode,
            onChanged: (value) {
              setState(() {
                _karanlikMode = value;
                themeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
              });
            },
          ),
          const Icon(Icons.nightlight_round_outlined),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: 'İsim',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _verileriKaydet, child: const Text("Kaydet")),
            ElevatedButton(
              onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>UcuncuSayfa()),
                  );
              }, child:Text("Kullanıcı Listesine Git")
              ),
          ],
        ),
      ),
    );
  }
}
