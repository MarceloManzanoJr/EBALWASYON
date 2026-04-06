import 'package:flutter/material.dart';
import 'package:ebalwasyon/utils/theme/theme.dart';
import 'package:ebalwasyon/utils/home_page/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebalwasyon ng Payong Teknikal',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ATheme.lightTheme,
      darkTheme: ATheme.darkTheme,
      // Set your EbalwasyonForm as the home
      home: const EbalwasyonForm(),
    );
  }
}