// import 'package:flutter/material.dart';
// import 'package:theme_patrol/theme_patrol.dart';
// import 'features.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ThemePatrol(
//       light: ThemeData(
//         brightness: Brightness.light,
//         primarySwatch: Colors.red,
//         primaryColor: Colors.red,
//         accentColor: Colors.red,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         useTextSelectionTheme: true,
//       ),
//       dark: ThemeData(
//         brightness: Brightness.dark,
//         primarySwatch: Colors.red,
//         primaryColor: Colors.red,
//         accentColor: Colors.red,
//         toggleableActiveColor: Colors.red,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         useTextSelectionTheme: true,
//       ),
//       mode: ThemeMode.system,
//       builder: (context, theme) {
//         return MaterialApp(
//           title: 'Smart Select',
//           theme: theme.light,
//           darkTheme: theme.dark,
//           themeMode: theme.mode,
//           home: Features(),
//         );
//       },
//     );
//   }
// }

import 'package:awesome_select/awesome_select.dart';
import 'package:awesomeselect/select.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12),
            HondaSelectOutline<int>(
              title: 'Pilih Produk',
              choiceItems: this.list,
              onChange: this.onChangeProduct,
              selectedValue: this.selectedProduct,
              // isLoading: _.isLoadingProduct,
            ),
            SmartSelect<int>.single(
              title: 'Jajaln',
              selectedValue: this.selectedProduct,
              choiceItems: this.list,
              onChange: (state) => this.onChangeProduct(state, state.value),
              modalFilter: true,
              modalFilterAuto: true,
              modalHeaderStyle: S2ModalHeaderStyle(
                backgroundColor: Colors.white,
                actionsIconTheme: IconThemeData(color: Colors.red),
                iconTheme: IconThemeData(color: Colors.black54),
                textStyle: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: this.gantiList,
                  child: Text('Ganti list'),
                ),
                ElevatedButton(
                  onPressed: this.setValue,
                  child: Text('Set value'),
                ),
                ElevatedButton(
                  onPressed: this.tambahList,
                  child: Text('Tambah list'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int selectedProduct;

  onChangeProduct(state, value) {
    this.selectedProduct = value;
    setState(() {});
  }

  List<S2Choice<int>> list = [
    S2Choice(value: 2, title: 'Dua'),
  ];

  gantiList() {
    setState(() {
      this.selectedProduct = null;
      this.list = [
        S2Choice(value: 1, title: 'Satu'),
        S2Choice(value: 2, title: 'Dua'),
      ];
    });
  }

  setValue() {
    setState(() {
      this.selectedProduct = 1;
    });
  }

  tambahList() {
    S2Choice<int> last = this.list.last;
    setState(() {
      this.list.add(S2Choice<int>(
          value: (last.value + 1), title: 'Tambahan ${last.value + 1}'));
    });
  }
}
