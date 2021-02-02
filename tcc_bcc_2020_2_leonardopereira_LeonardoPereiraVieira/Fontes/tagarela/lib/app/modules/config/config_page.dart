import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/icons/tagarella_icons_icons.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';
import 'config_controller.dart';

class ConfigPage extends StatefulWidget {
  final String title;
  const ConfigPage({Key key, this.title = "Configurações"}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends ModularState<ConfigPage, ConfigController> {
  //use 'controller' variable to access controller
  Tagarela tagarela;
  @override
  void dispose() {
    super.dispose();
    Tagarela.saveConfig();
    // animationCtrl.dispose();
  }

  @override
  void initState() {
    super.initState();
    tagarela = Tagarela();
  }

  Widget volume() {
    return Slider(
      value: Tagarela.config.volume != null ? Tagarela.config.volume * 100 : 0,
      min: 0,
      max: 100,
      divisions: 100,
      activeColor: TERTIARY,
      label: Tagarela.config.volume != null
          ? (Tagarela.config.volume * 100).round().toString()
          : '0',
      onChanged: (double value) {
        setState(() {
          Tagarela.config.volume = value / 100;
        });
      },
    );
  }

  Widget speed() {
    return Slider(
      value: Tagarela.config.speechRate != null
          ? Tagarela.config.speechRate * 100
          : 0,
      min: 0,
      max: 100,
      divisions: 100,
      activeColor: TERTIARY,
      label: Tagarela.config.speechRate != null
          ? (Tagarela.config.speechRate * 100).round().toString()
          : '0',
      onChanged: (double value) {
        setState(() {
          Tagarela.config.speechRate = value / 100;
        });
      },
    );
  }

  Widget passoFala() {
    return Slider(
      value: Tagarela.config.pitch != null &&
              Tagarela.config.pitch <= 2 &&
              Tagarela.config.pitch >= 0.5
          ? Tagarela.config.pitch
          : 0.5,
      min: 0.5,
      max: 2,
      divisions: 100,
      activeColor: TERTIARY,
      label: Tagarela.config.pitch != null
          ? ((Tagarela.config.pitch / 2) * 100).round().toString()
          : '1',
      onChanged: (double value) {
        setState(() {
          Tagarela.config.pitch = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: PRIMARY,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CheckboxListTile(
              activeColor: TERTIARY,
              title: const Text('Acessibilidade'),
              value: Tagarela.config.acessible,
              onChanged: (bool value) {
                setState(() {
                  Tagarela.config.acessible = !Tagarela.config.acessible;
                });
              },
              secondary: const Icon(TagarellaIcons.acessibilidade),
            ),
            Row(
              children: [
                Icon(Icons.volume_up),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .2,
                    child: Text(
                      "Volume",
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .53,
                  color: Colors.transparent,
                  child: volume(),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.directions_run),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      "Velocidade",
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .53,
                  child: speed(),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.announcement),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .2,
                    child: Text(
                      "Passo",
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .53,
                  child: passoFala(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
