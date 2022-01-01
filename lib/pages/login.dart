import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Metin alanlarının değerlerini temizlemeyi mümkün kılmak için metinlerini kontrol etmek için TextEditingControllers ekleyeceğiz .
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(
              height: 80.0,
            ),
            Column(
              children: [
                Image.asset("assets/diamond.png"),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            const SizedBox(
              height: 120.0,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: _usernameFocusNode.hasFocus
                      ? Theme.of(context).colorScheme.secondary
                      : _unfocusedColor,
                ),
              ),
              focusNode: _usernameFocusNode,
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                //filled:Metin alanının arka planını doldurur
                //filled: true,
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: _passwordFocusNode.hasFocus
                      ? Theme.of(context).colorScheme.secondary
                      : _unfocusedColor,
                ),
              ),
              focusNode: _passwordFocusNode,
              //obscureText: truedeğeri, kullanıcının yazdığı girişi otomatik olarak parolalara uygun madde işaretleri ile değiştirir.
              obscureText: true,
            ),
            //button bar düğmeleri yatay olarak konumlandırır
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {
                    //TODO : text field'ı temizle
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  child: const Text('CANCEL'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                        //eğimli bir dikdörtgen kenarlık ekler
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.0),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //TODO bi önceki sayfayı aç
                    Navigator.pop(context);
                  },
                  child: const Text('NEXT'),
                  style: ButtonStyle(
                    //butona gölge ekler
                    elevation: MaterialStateProperty.all(8.0),
                    shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
