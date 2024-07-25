import 'package:flutter/material.dart';
import 'energy_usage_billing_page.dart';
import 'total_amount_due_page.dart';
import 'pay_bills_page.dart';
import 'outage_schedule_page.dart';
import 'login_page.dart';
import '../widgets/home_button.dart';

class CustomerHomePage extends StatefulWidget {
  final String username;

  CustomerHomePage({required this.username});

  @override
  _CustomerHomePageState createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = (_currentPage + 1) % 3;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(widget.username),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  widget.username[0].toUpperCase(),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green[700],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('Energy Usage and Billing History'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnergyUsageBillingPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.money),
                    title: Text('Total Amount Due'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TotalAmountDuePage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Pay Bills'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PayBillsPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.schedule),
                    title: Text('Outage Schedule'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OutageSchedulePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                            registeredUsers: [],
                          )),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        'Customer Home Page',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Welcome back!',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Notifications'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.notification_important),
                                title: Text('Notification 1'),
                                subtitle: Text('Details of notification 1'),
                              ),
                              ListTile(
                                leading: Icon(Icons.notification_important),
                                title: Text('Notification 2'),
                                subtitle: Text('Details of notification 2'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'News Section',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              child: PageView(
                controller: _pageController,
                children: [
                  buildNewsItem('Electric Price Hike!', 'assets/images/pay-bills.jpg'),
                  buildNewsItem('Typhoon Affects Grid', 'assets/images/typhoon.jpg'),
                  buildNewsItem('A fresh new app for Batelec users!', 'assets/images/batelec1logowhite.jpg'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Services',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  HomeButton(
                    text: 'Energy Usage and Billing History',
                    icon: Icons.history,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnergyUsageBillingPage()),
                      );
                    },
                  ),
                  HomeButton(
                    text: 'Total Amount Due',
                    icon: Icons.money,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TotalAmountDuePage()),
                      );
                    },
                  ),
                  HomeButton(
                    text: 'Pay Bills',
                    icon: Icons.credit_card,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PayBillsPage()),
                      );
                    },
                  ),
                  HomeButton(
                    text: 'Outage Schedule',
                    icon: Icons.schedule,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OutageSchedulePage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNewsItem(String title, String imagePath) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
