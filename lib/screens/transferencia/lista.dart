import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phbank/model/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_tituloAppBar)),
        body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            })).then((transferenciaRecebida) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida!);
              });
            });
          },
          child: Icon(Icons.add),
        ));
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
        ),
        title: Text("Valor Transferido: " + _transferencia.valor.toString()),
        subtitle: Text(
            "Conta Destinatário: " + _transferencia.numeroConta.toString()),
      ),
    );
  }
}
