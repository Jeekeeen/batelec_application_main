import 'package:flutter/material.dart';

class PayBillsPage extends StatefulWidget {
  @override
  _PayBillsPageState createState() => _PayBillsPageState();
}

class _PayBillsPageState extends State<PayBillsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String selectedPaymentMethod = 'Credit Card';

  void _showPaymentDetailsDialog(BuildContext context, String paymentMethod) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter $paymentMethod Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (paymentMethod == 'Credit Card') ...[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: cardNumberController,
                  decoration: InputDecoration(labelText: 'Card Number'),
                ),
                TextField(
                  controller: expiryDateController,
                  decoration: InputDecoration(labelText: 'Expiry Date'),
                ),
                TextField(
                  controller: cvvController,
                  decoration: InputDecoration(labelText: 'CVV'),
                ),
              ],
              if (paymentMethod == 'GCash') ...[
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
              ],
              if (paymentMethod == 'Debit Card') ...[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: cardNumberController,
                  decoration: InputDecoration(labelText: 'Card Number'),
                ),
                TextField(
                  controller: expiryDateController,
                  decoration: InputDecoration(labelText: 'Expiry Date'),
                ),
                TextField(
                  controller: cvvController,
                  decoration: InputDecoration(labelText: 'CVV'),
                ),
              ],
              if (paymentMethod == 'PayMaya') ...[
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text('You have successfully paid the electric bill as of Jun 2024.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Go back to the previous page
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40), // Space for status bar
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Pay Bills',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Jake', // Placeholder for username
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '09171234567',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Location',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Sta. Teresita, Taal, Batangas, Street 129',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Amount to Pay',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'PHP 3,123.78',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[700]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Options',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          title: Text('Credit Card'),
                          leading: Radio<String>(
                            value: 'Credit Card',
                            groupValue: selectedPaymentMethod,
                            onChanged: (String? value) {
                              setState(() {
                                selectedPaymentMethod = value!;
                              });
                              _showPaymentDetailsDialog(context, 'Credit Card');
                            },
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          title: Text('GCash'),
                          leading: Radio<String>(
                            value: 'GCash',
                            groupValue: selectedPaymentMethod,
                            onChanged: (String? value) {
                              setState(() {
                                selectedPaymentMethod = value!;
                              });
                              _showPaymentDetailsDialog(context, 'GCash');
                            },
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          title: Text('Debit Card'),
                          leading: Radio<String>(
                            value: 'Debit Card',
                            groupValue: selectedPaymentMethod,
                            onChanged: (String? value) {
                              setState(() {
                                selectedPaymentMethod = value!;
                              });
                              _showPaymentDetailsDialog(context, 'Debit Card');
                            },
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          title: Text('PayMaya'),
                          leading: Radio<String>(
                            value: 'PayMaya',
                            groupValue: selectedPaymentMethod,
                            onChanged: (String? value) {
                              setState(() {
                                selectedPaymentMethod = value!;
                              });
                              _showPaymentDetailsDialog(context, 'PayMaya');
                            },
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[700],
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Total: PHP 1500.00',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  _showSuccessDialog(context);
                },
                child: Text(
                  'Pay Now',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
