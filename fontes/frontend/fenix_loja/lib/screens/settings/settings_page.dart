import 'package:fenix_loja/app_properties.dart';
import 'package:fenix_loja/custom_background.dart';
import 'package:fenix_loja/screens/auth/welcome_back_page.dart';
import 'package:fenix_loja/screens/settings/change_country.dart';
import 'package:fenix_loja/screens/settings/change_password_page.dart';
import 'package:fenix_loja/screens/settings/legal_about_page.dart';
import 'package:fenix_loja/screens/settings/notifications_settings_page.dart';
import 'package:flutter/material.dart';

import 'change_language_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MainBackground(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          brightness: Brightness.light,
          backgroundColor: Colors.transparent,
          title: Text(
            'Configurações',
            style: TextStyle(color: darkGrey),
          ),
          elevation: 0,
        ),
        body: SafeArea(
          bottom: true,
          child: LayoutBuilder(
                      builder:(builder,constraints)=> SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight),
                          child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Geral',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: Text('Idioma A / का'),
                    leading: Image.asset('assets/icons/language.png'),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ChangeLanguagePage())),
                  ),
                   ListTile(
                    title: Text('Alterar país'),
                     leading: Image.asset('assets/icons/country.png'),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ChangeCountryPage())),
                  ),
                   ListTile(
                    title: Text('Notificações'),
                     leading: Image.asset('assets/icons/notifications.png'),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => NotificationSettingsPage())),
                  ),
                   ListTile(
                    title: Text('Jurídico e sobre'),
                     leading: Image.asset('assets/icons/legal.png'),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => LegalAboutPage())),
                  ),
                   ListTile(
                    title: Text('Sobre nós'),
                     leading: Image.asset('assets/icons/about_us.png'),
                    onTap: (){},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      'Conta',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                    title: Text('Alterar senha'),
                    leading: Image.asset('assets/icons/change_pass.png'),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ChangePasswordPage())),
                  ),
                  ListTile(
                    title: Text('Sair'),
                      leading: Image.asset('assets/icons/sign_out.png'),
                    onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => WelcomeBackPage())),
                  ),
                  
                ],
              ),
            ),
                        ),
                      )
          ),
        ),
      ),
    );
  }
}
