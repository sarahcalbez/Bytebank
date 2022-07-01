import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: TransferList(),
        appBar: AppBar(
          title: const Text('Transactions'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => true,
          child: const Icon(Icons.add),
        ),
      ),
    ));

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        TransferItem(Transfer(100.00, 12340)),
        TransferItem(Transfer(200.00, 23340)),
        TransferItem(Transfer(300.00, 35640)),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}
