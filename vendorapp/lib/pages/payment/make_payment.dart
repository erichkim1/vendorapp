import 'package:flutter/material.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MakePayment extends StatefulWidget {
  /*
  MakePayment({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;
*/
  @override
  _MakePaymentState createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);

    try {
      print('Success!');
      // Send this to my back-end. you can check/veirfy if this is valid! and can get the info necessary
      // we can charge the card, etc via calling the square back-end
      result.nonce;

      // Make sure we handle the UI before run this completecardentry!
      InAppPayments.completeCardEntry(
        onCardEntryComplete: () => _cardEntryComplete,
      );
    } on Exception catch (ex) {
      print('there are problems!');
      InAppPayments.showCardNonceProcessingError(ex.toString());
    }
  }

  void _cardEntryComplete() {
    // success
    print('Inside of _cardEntryComplete');
  }

  void _cardEntryCancel() {
    print('Inside of _cardEntryCancel');
  }

  void _pay() {
    // you only need to call this once!
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-WRovjf-cUgMr8eJTe_K-3A');
    InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _cardNonceRequestSuccess,
        onCardEntryCancel: _cardEntryCancel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Make Payment: ${widget.user.email}')),
      appBar: AppBar(title: Text('Make Payment')),
      //body: Text('Payment Email: ${widget.user.email}'),
      body: Text('Payment Email'),
      floatingActionButton: FloatingActionButton(
        onPressed: _pay,
        tooltip: 'Payment',
        child: Icon(Icons.payment),
      ),
    );
  }
}
