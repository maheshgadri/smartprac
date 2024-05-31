import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Welcome, Mypcot !!'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.png'), // Replace with your image asset
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DashboardHeader(),
              SizedBox(height: 16),
              OrdersSection(),
              SizedBox(height: 16),
              TimelineSection(),
              SizedBox(height: 230),
              NewOrderSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF2C3D63),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color:  Color(0xFF2C3D63),
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/home.svg',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/customers.svg',
              width: 24,
              height: 24,
            ),
            label: 'Customers',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/khata.svg',
              width: 24,
              height: 24,
            ),
            label: 'Khata',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/orders.svg',
              width: 24,
              height: 24,
            ),
            label: 'Orders',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define the action to be taken when the FAB is pressed
        },
        child: Icon(Icons.add,color: Colors.white),
        shape: CircleBorder(),
        backgroundColor: Color(0xFF2C3D63),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



class DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.note_alt, size: 40, color: Colors.white),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('You have 3 active orders from', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/avatar1.png')),
                CircleAvatar(backgroundImage: AssetImage('assets/avatar2.png')),
                CircleAvatar(backgroundImage: AssetImage('assets/avatar3.png')),
              ],
            ),
            SizedBox(height: 8),
            Text('02 Pending Orders from', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/avatar4.png')),
                CircleAvatar(backgroundImage: AssetImage('assets/avatar5.png')),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class OrdersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          'Orders',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TimelineSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('January, 23 2021'),
        Row(
          children: [
            Text('TIMELINE'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        Row(
          children: [
            Text('JAN, 2021'),
            Icon(Icons.calendar_today),
          ],
        ),
      ],
    );
  }
}

class NewOrderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New order created', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFF2C3D63),)),
              Text('New Order created with Order', style: TextStyle(fontSize: 14, color: Colors.grey)),
              Text('09:00 AM', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),

          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF8C00), // Set the color to #343434
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/new_order.svg',
                width: 36, // Adjust the size of the SVG icon to fit within the circular container
                height: 36, // Adjust the size of the SVG icon to fit within the circular container
                color: Colors.white, // Set the color of the SVG icon
              ),
            ),
          ),


          SizedBox(width: 16),
        ],
      ),
    );
  }
}