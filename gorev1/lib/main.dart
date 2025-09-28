import 'package:flutter/material.dart';

void main(){
  runApp(const SayacUygulamasi());
}

class SayacUygulamasi extends StatelessWidget{

  const SayacUygulamasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sayaç Uygulaması",
      home:  SayacEkrani(),
    );
  }
}

class SayacEkrani extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => SayacEkraniState();
}

class SayacEkraniState extends State<SayacEkrani>{
  int sayac=0;

  void sayacArttir(){
    setState(() {
      sayac++;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Sayaç Uygulaması"),
          centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Merhaba Ben Mert.",style: TextStyle(color:Colors.white,fontWeight:FontWeight.bold)
            ),SizedBox(height: 20,),
            Text("Sayaç: ${sayac}",style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: sayacArttir, child: Text("Arttır"),style:ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.lightGreenAccent)),),
          ],
        ),
      ),
    );
  }

}