import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils extends StatelessWidget {
  static final DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
        required String text,
        required String botaoConfirma,
        required String botaoExtra,
        required String botaoCancela,
        required Function funcaoBotaoConfirma,
        required Function funcaoBotaoExtra,
        required Function funcaoBotaoCancela}) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: Colors.white.withOpacity(0.9),
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(text),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(botaoConfirma),
              onPressed: () async {
                funcaoBotaoConfirma();
              },
            ),
            botaoExtra != "" ? TextButton(
              child: Text(botaoExtra),
              onPressed: () async {
                funcaoBotaoExtra();
              },
            ) : Column(),
            TextButton(
              child: Text(botaoCancela),
              onPressed: () async {
                funcaoBotaoCancela();
              },
            ),

          ],
        );
      },
    );
  }


  static void dialogBuscandoNoBanco(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Pesquisando no banco de dados'),
        content: const CupertinoActivityIndicator(
            radius: 20.0, color: CupertinoColors.activeBlue),
        actions: <CupertinoDialogAction>[

          CupertinoDialogAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}