import 'package:flutter/material.dart';
import 'pay_bills_page.dart';

class EnergyUsageBillingPage extends StatelessWidget {
  final List<BillingInfo> billingHistory = [
    BillingInfo(
      date: '2024-07-01',
      dueDate: '2023-07-15',
      service: 'Electricity',
      amount: 2975,
      isPaid: true,
    ),
        BillingInfo(
      date: '2023-07-01',
      dueDate: '2023-07-15',
      service: 'Electricity',
      amount: 2478,
      isPaid: true,
    ),
        BillingInfo(
      date: '2023-07-01',
      dueDate: '2023-07-15',
      service: 'Electricity',
      amount: 2673,
      isPaid: true,
    ),
            BillingInfo(
      date: '2023-07-01',
      dueDate: '2023-07-15',
      service: 'Electricity',
      amount: 2888,
      isPaid: true,
    ),
        BillingInfo(
      date: '2023-07-01',
      dueDate: '2023-07-15',
      service: 'Electricity',
      amount: 2673,
      isPaid: true,
    ),
    BillingInfo(
      date: '2023-07-01',
      dueDate: '2023-07-15',
      service: 'Electricity',
      amount: 2657,
      isPaid: true,
    ),
    BillingInfo(
      date: '2023-07-01',
      dueDate: '2023-07-15',
      service: 'Electricity',
      amount: 1964,
      isPaid: true,
    ),
    BillingInfo(
      date: '2023-07-01',
      dueDate: '2023-07-15',
      service: 'Electricity',
      amount: 2122,
      isPaid: true,
    ),
    BillingInfo(
      date: '2023-07-01',
      dueDate: '2023-07-15',
      service: 'Electricity',
      amount: 2135,
      isPaid: true,
    ),
    BillingInfo(
      date: '2024-06-01',
      dueDate: '2024-07-27',
      service: 'Electricity',
      amount: 3123,
      isPaid: false,
    ),
  ];

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
                SizedBox(height: 40),
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
                          'Energy Usage and Billing History',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 48), // Space to balance the arrow back icon
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Unpaid',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        if (billingHistory
                            .where((item) => !item.isPaid)
                            .isEmpty)
                          Center(
                            child: Text('No unpaid bills'),
                          )
                        else
                          ...billingHistory
                              .where((item) => !item.isPaid)
                              .map((item) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8.0),
                                    child: BillingItemRow(item: item),
                                  ))
                              .toList(),
                        SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PayBillsPage()),
                              );
                            },
                            child: Text('Pay Now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Paid',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          Expanded(
                            child: ListView(
                              children: billingHistory
                                  .where((item) => item.isPaid)
                                  .map((item) => Padding(
                                        padding:
                                            const EdgeInsets.symmetric(vertical: 8.0),
                                        child: BillingItemRow(item: item),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BillingItemRow extends StatelessWidget {
  final BillingInfo item;

  BillingItemRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: item.isPaid, onChanged: (value) {}),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date: ${item.date}'),
              Text('Due Date: ${item.dueDate}'),
              Text('Service: ${item.service}'),
            ],
          ),
        ),
        Text('PHP ${item.amount}'),
      ],
    );
  }
}

class BillingInfo {
  final String date;
  final String dueDate;
  final String service;
  final int amount;
  final bool isPaid;

  BillingInfo({
    required this.date,
    required this.dueDate,
    required this.service,
    required this.amount,
    required this.isPaid,
  });
}
