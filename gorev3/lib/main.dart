import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const NotApp());
}

class NotApp extends StatelessWidget {
  const NotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Uygulaması',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: NotePage(),
    );
  }
}

class NotePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController textBox=TextEditingController();
  List<String> notListesi=[];

  @override
  @override
  void initState() {
    super.initState();
    notYukle();
  }

  Future<void> notYukle() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {
     notListesi=preferences.getStringList('notlar') ?? [];
    });
  }

  Future <void> notKaydet() async {
    if(textBox.text.isEmpty) return ;
    SharedPreferences preferences=await SharedPreferences.getInstance();
    notListesi.add(textBox.text);
    await preferences.setStringList('notlar', notListesi);
    setState(() {
      textBox.clear();
    });
  }

  Future <void> notSil (int index) async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
   notListesi.removeAt(index);
   await preferences.setStringList('notlar', notListesi);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Not Defteri"),centerTitle: true,backgroundColor: Colors.greenAccent,),
      body: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child:Column(
            children: [
              TextField(
                controller: textBox,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Notunuz",
                  hintText: "Notunuzu Giriniz..."
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed:notKaydet, child:Text("Notu Kaydet")
                  ),
                ],
              ),
              SizedBox(height: 20),

              Expanded(child:notListesi.isEmpty ? Center(child: Text("Henüz Not Kaydedilmedi.")):ListView.builder(itemCount: notListesi.length,itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text(notListesi[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,color: Colors.red),
                      onPressed: () =>notSil(index),
                    ),
                  ),
                );
              },
              )
              ),
            ],
          ) ,
      ),
    );
  }
}
