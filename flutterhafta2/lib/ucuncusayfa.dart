import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UcuncuSayfa extends StatefulWidget {
  const UcuncuSayfa({super.key});

  @override
  State<UcuncuSayfa> createState() => _UcuncuSayfaState();
}

class _UcuncuSayfaState extends State<UcuncuSayfa> {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception("Kullanıcılar alınamadı");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Listesi"),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Kullanıcı bulunamadı"));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Text(
                      user.name[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(user.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.email),
                      Text("Şehir: ${user.city}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class User {
  final String name;
  final String email;
  final String city;

  User({required this.name, required this.email, required this.city});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      city: json['address']['city'],
    );
  }
}
