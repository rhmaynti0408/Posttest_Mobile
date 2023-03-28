import 'package:flutter/material.dart';
import 'package:posttest2_068_rahmayanti/navigator.dart';

void main() {
  runApp(const MyApp());
}

// enum StatusPesan { sewa, beli }

String? name = '';
String? alamat = '';
String? buku = '';
String? _statusPesan = '';
// String? HeroBuku = '';

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
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rahmayanti Book Store"),
      ),
      body: Stack(
        // berfungsi agar widget bisa tumpang tindih
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/background2.jpg',
            width: lebar,
            height: tinggi,
            fit: BoxFit.fill,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //     image: AssetImage(
          //         'assets/images/background2.jpg'), //membuat background landing page

          //   )),
          // ),

          Container(
            // membuat kotak berwarna putih untuk di isikan konten seperti gambar
            padding: EdgeInsets.only(top: 40, bottom: 40),
            width: lebar - 100,
            height: tinggi - 100,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "Buku1",
                  child: Image.asset(
                    'assets/images/buku1.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                Hero(
                  tag: "Buku2",
                  child: Image.asset(
                    'assets/images/buku2.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                ElevatedButton(
                  // tombol
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 2),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    NavigatorWidget())
                        // MaterialPageRoute(
                        //     builder: (_) => const NavigatorWidget())
                        );
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to my Book Store"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            // buku 1
            child: InkWell(
              splashColor: Colors.pink.withAlpha(30),
              onTap: () {
                setState(() {
                  buku = 'assets/images/buku1.png';
                  // HeroBuku = 'Buku1';
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const OrderPage()));
              },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Hero(
                      tag: "Buku1",
                      // padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/buku1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text("Buku1"),
                    subtitle: Text("Rp10000"),
                  ),
                ],
              ),
            ),
          ),
          Card(
            // buku 2
            child: InkWell(
              splashColor: Colors.pink.withAlpha(30),
              onTap: () {
                setState(() {});
              },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Hero(
                      tag: "Buku2",
                      // padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/buku2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text("Buku1"),
                    subtitle: Text("Rp10000"),
                  ),
                ],
              ),
            ),
          ),
          Card(
            // buku 3
            child: InkWell(
              onTap: () {
                setState(() {});
              },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/jualan1.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text("Buku1"),
                    subtitle: Text("Rp10000"),
                  ),
                ],
              ),
            ),
          ),
          Card(
            // buku 4
            child: InkWell(
              splashColor: Colors.pink.withAlpha(30),
              onTap: () {
                setState(() {});
              },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/jualan1.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text("Buku1"),
                    subtitle: Text("Rp10000"),
                  ),
                ],
              ),
            ),
          ),
          Card(
            // buku 5
            child: InkWell(
              splashColor: Colors.pink.withAlpha(30),
              onTap: () {
                setState(() {});
              },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/jualan1.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text("Buku1"),
                    subtitle: Text("Rp10000"),
                  ),
                ],
              ),
            ),
          ),
          Card(
            // buku 6
            child: InkWell(
              splashColor: Colors.pink.withAlpha(30),
              onTap: () {
                setState(() {});
              },
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/jualan1.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const ListTile(
                    title: Text("Buku1"),
                    subtitle: Text("Rp10000"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
    return Container(
      padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
      child: Scaffold(
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
                            'Info Pesan Buku',
                            style: TextStyle(fontSize: 18),
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Container(
                            // tag: HeroBuku,
                            child: Image.asset(
                              '$buku',
                              height: 400,
                              width: 400,
                            ),
                          ),
                          ListTile(
                            title: const Text("Sewa"),
                            leading: Radio(
                              value: "sewa",
                              groupValue: _statusPesan,
                              onChanged: (value) {
                                setState(() {
                                  _statusPesan = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text("Beli"),
                            leading: Radio(
                              value: "Beli",
                              groupValue: _statusPesan,
                              onChanged: (value) {
                                setState(() {
                                  _statusPesan = value;
                                });
                              },
                            ),
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
      ),
    );
  }
}

class InfoUser extends StatelessWidget {
  const InfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
      child: Scaffold(
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
                          Text("Status : di$_statusPesan"),
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
      ),
    );
  }
}
