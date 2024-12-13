import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String reference_ID = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khalti Integration'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          //Using MainAxisSize.max uses the maximum space given
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
                onPressed: () {
                  payWithKhalti();
                },
                child: const Text('Make Payment')),
            Text(reference_ID)
          ],
        ),
      ),
    );
  }

  payWithKhalti() {
    KhaltiScope.of(context)
        //amount is defined in 'paisa' so 1000 paisa means NRP.10
        .pay(
            config: PaymentConfig(
                amount: 1000,
                productIdentity: 'productIdentity',
                productName: 'productName'),
            //We can use multiple PaymentPreferences
            preferences: [PaymentPreference.khalti],
            onSuccess: onSuccess,
            onFailure: onFailure,
            onCancel: onCancel);
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Payment Successful'),
            actions: [
              SimpleDialogOption(
                child: Text('OK'),
                onPressed: (() {
                  setState(() {
                    reference_ID = success.idx;
                  });
                  Navigator.pop(context);
                }),
              )
            ],
          );
        });
  }

  void onFailure(PaymentFailureModel failure) {
    debugPrint(failure.toString());
  }

  void onCancel() {
    debugPrint('Cancelled');
  }
}
