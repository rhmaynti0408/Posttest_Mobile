import 'package:flutter/material.dart';
import 'package:posttest2_068_rahmayanti/navigator.dart';

void main() {
  runApp(const MyApp());
}

String? name = '';
String? alamat = '';
String? buku = '';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rahmayanti Book Store',
      theme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rahmayanti Book Store"),
      ),
      body: Stack(
        // berfungsi agar widget bisa tumpang tindih
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                  'assets/images/background2.jpg'), //membuat background landing page
              fit: BoxFit.fill,
            )),
          ),
          Container(
            // membuat kotak berwarna putih untuk di isikan konten seperti gambar
            padding: EdgeInsets.only(top: 40, bottom: 40),
            width: 300,
            height: 480,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    // membuat bayangan
                    color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 6),
                  )
                ]),
            child: Column(
              //dibuat column agar gambar ber susun secara vertical
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/images/buku1.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/buku2.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                ElevatedButton(
                  // tombol
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const NavigatorWidget()));
                  },
                  child: Text("Get Started"),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_printLatestValue);
    _controller2.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    print('Nama : ${_controller.text}');
    print('Alamat : ${_controller2.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to my store"),
      ),
      body: Stack(
        // berfungsi agar widget bisa tumpang tindih
        alignment: Alignment.center,
        children: <Widget>[
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Silahkan Pilih Buku',
                          style: TextStyle(fontSize: 18),
                        ),
                        Column(
                          children: <Widget>[
                            Divider(),
                            RadioListTile(
                                value: 'assets/images/jualan1.jpg',
                                groupValue: buku,
                                onChanged: (value) {
                                  setState(() {
                                    buku = value.toString();
                                  });
                                }),
                            Container(
                              child: Image.asset(
                                'assets/images/jualan1.jpg',
                                height: 150,
                                width: 150,
                              ),
                            ),
                            RadioListTile(
                                value: 'assets/images/jualan2.webp',
                                groupValue: buku,
                                onChanged: (value) {
                                  setState(() {
                                    buku = value.toString();
                                  });
                                }),
                            Container(
                              child: Image.asset(
                                'assets/images/jualan2.webp',
                                height: 150,
                                width: 150,
                              ),
                            ),
                            RadioListTile(
                                value: 'assets/images/jualan3.jpg',
                                groupValue: buku,
                                onChanged: (value) {
                                  setState(() {
                                    buku = value.toString();
                                  });
                                }),
                            Container(
                              child: Image.asset(
                                'assets/images/jualan3.jpg',
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: _controller,
                          onChanged: (value) {
                            print('Nama : $value');
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: 'Nama',
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        SizedBox(
                          width: 400,
                          child: TextField(
                            controller: _controller2,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              labelText: 'Alamat',
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: (() {
                              setState(() {
                                name = _controller.text;
                                alamat = _controller2.text;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const InfoUser()));
                            }),
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.blue),
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class InfoUser extends StatelessWidget {
  const InfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Pelanggan'),
      ),
      body: Stack(
        // berfungsi agar widget bisa tumpang tindih
        alignment: Alignment.center,
        children: <Widget>[
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: <Widget>[
                  Expanded(
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                          child: Image.asset(
                            '$buku',
                            height: 400,
                            width: 400,
                          ),
                        ),
                        Text("Nama : $name"),
                        Text("Alamat : $alamat"),
                      ],
                    )),
                  ),
                ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
