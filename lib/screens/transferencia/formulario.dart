import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phbank/components/editor.dart';
import 'package:phbank/model/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCampoNumeroConta = '0000';

const _textoBtConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                icone: Icons.account_balance,
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: _rotuloCampoValor,
                  dica: _dicaCampoValor,
                  icone: Icons.monetization_on),
              ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_textoBtConfirmar),
              ),
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valorTransferencia =
        double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valorTransferencia != null) {
      final transferenciaCriada =
          Transferencia(valorTransferencia, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
