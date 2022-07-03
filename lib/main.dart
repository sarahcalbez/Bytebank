import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.pink,
      // inputDecorationTheme: MyInputTheme().theme(),
      // ),
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  final _accountNumberController = TextEditingController();
  final _valueController = TextEditingController();

  TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Transfer'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: _accountNumberController,
                style: const TextStyle(
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                    labelText: 'Account number', hintText: '0000'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                controller: _valueController,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Value',
                    hintText: '0.00'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: ElevatedButton(
                child: const Text('Confirm'),
                onPressed: () {
                  debugPrint('Your transfer is confirmed!');
                  final int? accountNumber =
                      int.tryParse(_accountNumberController.text);
                  final double? value = double.tryParse(_valueController.text);
                  if (accountNumber != null && value != null) {
                    final confirmedTransfer = Transfer(value, accountNumber);
                    debugPrint('$confirmedTransfer');
                  }
                },
              ),
            ),
          ],
        ));
  }
}

class TransferList extends StatelessWidget {
  const TransferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: Column(
        children: <Widget>[
          TransferItem(Transfer(100.00, 12340)),
          TransferItem(Transfer(200.00, 23340)),
          TransferItem(Transfer(300.00, 35640)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => true,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  // ignore: use_key_in_widget_constructors
  const TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
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

  @override
  String toString() {
    return 'Transfer{Value: $value, Account Number: $accountNumber}';
  }
}
