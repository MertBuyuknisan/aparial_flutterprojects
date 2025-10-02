import 'package:flutter/material.dart';
import 'ikincisayfa.dart';

class BirinciSayfa extends StatefulWidget {
  const BirinciSayfa({super.key});

  @override
  State<BirinciSayfa> createState() => _BirinciSayfaState();
}

class _BirinciSayfaState extends State<BirinciSayfa> {

  Color _backgroundColor = Colors.white;

  void _arkaplandegistir() {

    setState(() {
      _backgroundColor = Colors.indigoAccent.shade700;
    });
  }

  void _mesajgoster(){
   const snackbar=SnackBar(content:Text("Merhaba Flutter!!"));
   ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
final url="https://cmspanel.tvplus.com.tr/uploads/marvel0_5_005fa9e70c.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text(
          "Birinci Sayfa",
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Butonlar ile renk değiştirme ve mesaj gösterme",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.network(
                 url ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                          onPressed: _arkaplandegistir,
                          child: Text(
                            "Arka Plan Rengini Değiştir",
                            style: TextStyle(color: Colors.purple),
                          )),
                    ),
                  ),
              
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(onPressed:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>IkinciSayfa()));
                      }, child: Text("Diğer Sayfaya Git",style: TextStyle(color: Colors.purple),)),
                    ),
                  ),
                    Expanded(
                    child: Container(
                      height: 60,
                      child: IconButton(
                        onPressed: _mesajgoster,
                        icon: Icon(Icons.message),
                        iconSize: 30.0,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
