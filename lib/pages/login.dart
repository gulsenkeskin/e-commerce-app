import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Metin alanlarının değerlerini temizlemeyi mümkün kılmak için metinlerini kontrol etmek için TextEditingControllers ekleyeceğiz .
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children:<Widget> [
            const SizedBox(
              height: 80.0,
            ),
            Column(
              children: <Widget>[
                Image.asset("assets/diamond.png"),
                const SizedBox(
                  height: 16.0,
                ),
                const Text("SHRINE"),
              ],
            ),
            const SizedBox(
              height: 120.0,
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                //filled:Metin alanının arka planını insanlara yardım için doldurur
                filled: true, labelText: 'Password',
              ),
              //obscureText: truedeğeri, kullanıcının yazdığı girişi otomatik olarak parolalara uygun madde işaretleri ile değiştirir.
              obscureText: true,
            ),
            //button bar düğmeleri yatay olarak konumlandırır
            ButtonBar(
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      //TODO : text field'ı temizle
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                    child: const Text('CANCEL')
                ),
                ElevatedButton(
                    onPressed: (){
                      //TODO bi önceki sayfayı aç
                      Navigator.pop(context);
                    },
                    child: const Text('NEXT')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
