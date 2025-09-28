import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Yeni ikon paketi

void main() {
  runApp(const profilUygulamasi());
}

class profilUygulamasi extends StatelessWidget {
  const profilUygulamasi({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Ekranı',
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ProfilEkrani(),
    );
  }
}
class ProfilEkrani extends StatelessWidget{
  const ProfilEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Profili"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Padding(padding: EdgeInsetsGeometry.all(20.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      color:Colors.blue.shade200,
                      shape: BoxShape.circle,
                      border: BoxBorder.all(
                        color: Colors.blueAccent,
                        width: 4.0
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 80.0,
                      color: Colors.blueAccent,
                    ),
                    ),
                  const SizedBox(height: 16.0),

                  const Text("Mert Büyüknisan",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black)),
                  const SizedBox(height: 16.0),
                  const Text("Mobil Uygulama Geliştirici",style: TextStyle(fontSize: 16,color: Colors.black),),
                  ],
              ),
            ),
            const SizedBox(height: 30.0),
            const Text("Hakkımda",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),

            const Divider(height: 10, color: Colors.blueAccent,),
            const Text("Merhabalar, Ben Mert Büyüknisan mobil uygulama geliştirme alanında kariyer hedefliyorum.Kotlin ile projeler gerçekleştirdim şuanda da Flutter öğrenmeye başladım.",style:TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),textAlign: TextAlign.justify,),

            const SizedBox(height: 30.0,),

            const Text("İletişim",style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            const Divider(height: 10,color: Colors.blueAccent,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.linkedin,),
                SizedBox(width: 50,),
                Icon(FontAwesomeIcons.whatsapp,),
                SizedBox(width: 50,),
                Icon(Icons.mail),
                SizedBox(width: 50,),
                Icon(FontAwesomeIcons.github),


              ],
            )
          ],
        ),
        ),
      ) ,
    );

  }
}


