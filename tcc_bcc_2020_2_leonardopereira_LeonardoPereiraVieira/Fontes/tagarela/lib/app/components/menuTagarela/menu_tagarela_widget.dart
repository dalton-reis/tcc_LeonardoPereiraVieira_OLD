import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/icons/braille_hand_icons.dart';
import 'package:tagarela/app/modules/braille/shared/models/util_braille.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';

class MenuTagarelaWidget extends StatelessWidget {
  final Color corlorHeader;
  final List<ListTile> extraTile;
  const MenuTagarelaWidget({Key key, this.corlorHeader, this.extraTile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
              color: corlorHeader != null ? corlorHeader : PRIMARY),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Módulos',
            style: TextStyle(fontSize: 18),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            'Tagarella',
            style: TextStyle(fontSize: 16),
          ),
          onTap: () {
            ///Para voltar a pagina home e eliminar as paginas existentes até o /home
            Modular.to.pushNamedAndRemoveUntil(
              '/home',
              ModalRoute.withName('/home'),
            );
          },
        ),
        ListTile(
          leading: Icon(Braille_hand.braille_hand),
          title: Text(
            'Braille',
            style: TextStyle(fontSize: 16),
          ),
          onTap: () {
            ConfigBraille.getSlide().then((value) {
              if (value) {
                Modular.to.pushNamedAndRemoveUntil(
                  '/home/braille',
                  ModalRoute.withName('/home'),
                );
              } else {
                Modular.to.pushNamedAndRemoveUntil(
                  '/home/slide',
                  ModalRoute.withName('/home'),
                );
              }
            });
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            'Configurações',
            style: TextStyle(fontSize: 16),
          ),
          onTap: () {
            Modular.to.pushNamed('home/config');
          },
        ),
        (extraTile != null ? Divider() : Container()),
        (extraTile != null ? Column(children: extraTile) : Container()),
        Divider(),
        ListTile(
          title: Text(
            'Informações',
            style: TextStyle(fontSize: 18),
          ),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text(
            'Sobre',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ]),
    );
  }
}
