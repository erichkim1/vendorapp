import 'package:flutter/material.dart';

class PaymentOptions extends StatefulWidget {
  PaymentOptions({Key key}) : super(key: key);

  @override
  PaymentOptionsState createState() => PaymentOptionsState();
}

class PaymentOptionsState extends State<PaymentOptions> {
  _onItemPress(BuildContext context, int index) {
    switch (index) {
      case 0:
        // pay via new card
        print('pay via new card');
        /*
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MakePayment(),
          ),
        );
          */
        break;
      case 1:
        Navigator.pushNamed(context, '/existing_cards');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Register a new card'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.separated(
              itemBuilder: (context, index) {
                Icon icon;
                Text text;

                switch (index) {
                  case 0:
                    icon = Icon(Icons.add_circle, color: theme.primaryColor);
                    text = Text('Pay via new card');
                    break;
                  case 1:
                    icon = Icon(Icons.credit_card, color: theme.primaryColor);
                    text = Text('Pay via existing card');
                    break;
                }

                return InkWell(
                    onTap: () {
                      _onItemPress(context, index);
                    },
                    child: ListTile(
                      title: text,
                      leading: icon,
                    ));
              },
              separatorBuilder: (context, index) =>
                  Divider(color: theme.primaryColor),
              itemCount: 2),
        ));
  }
}
