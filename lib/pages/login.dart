import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            const SizedBox(
              height: 80.0,
            ),
            Column(
              children: [
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
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              decoration: const InputDecoration(
                //filled:Metin alanının arka planını insanlara yardım için doldurur
                filled: true, labelText: 'Password',
              ),
              //obscureText: truedeğeri, kullanıcının yazdığı girişi otomatik olarak parolalara uygun madde işaretleri ile değiştirir.
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }
}
