
import 'package:flutter/cupertino.dart';

class Questao extends StatelessWidget {

  String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Text(texto);
  }
}
