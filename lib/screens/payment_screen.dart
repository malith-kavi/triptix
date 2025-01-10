import 'package:flutter/material.dart';
import 'package:triptix/constants.dart';



class PaymentGatewayUI extends StatefulWidget {
  @override
  _PaymentGatewayUIState createState() => _PaymentGatewayUIState();
}

class _PaymentGatewayUIState extends State<PaymentGatewayUI> {
  String selectedPaymentMethod = 'Visa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PaymentMethodButton(
                  logoPath: 'assets/images/visa.png',
                  label: 'Visa',
                  isSelected: selectedPaymentMethod == 'Visa',
                  onTap: () {
                    setState(() {
                      selectedPaymentMethod = 'Visa';
                    });
                  },
                ),
                SizedBox(width: 20),
                PaymentMethodButton(
                  logoPath: 'assets/images/Mastercard.png',
                  label: 'Mastercard',
                  isSelected: selectedPaymentMethod == 'Mastercard',
                  onTap: () {
                    setState(() {
                      selectedPaymentMethod = 'Mastercard';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Enter Payment Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Cardholder Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                hintText: '1234 5678 9012 3456',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      hintText: 'MM/YY',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      hintText: '123',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Billing Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 300, 
                height: 60, 
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Payment Successful'),
                          content: Text(
                            'Your payment using $selectedPaymentMethod has been processed successfully!',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('Pay Now',style: BodyText4,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodButton extends StatelessWidget {
  final String logoPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  PaymentMethodButton({
    required this.logoPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? mainColor : Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(logoPath, fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? mainColor : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
