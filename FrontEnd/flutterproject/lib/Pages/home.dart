import 'package:flutter/material.dart';
import 'package:flutterproject/Components/UserPage.dart';
import 'package:flutterproject/States/user_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDrawerOpen = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final UserState userState = UserState();
  int _selectedIndex = 0;

  Widget _getPage(int index) {
    switch (_selectedIndex) {
      case 0:
        return UserPage();
      case 1:
        return Text("Transactions Page"); // TransactionsPage();
      case 2:
        return Text("Budgets Page"); // BudgetsPage();
      case 3:
        return Text("Pots Page"); // PotsPage();
      case 4:
        return Text("Recurring Bills Page"); // RecurringBillsPage();
      default:
        return UserPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _getPage(_selectedIndex),
      drawer: HomeDrawer(
        onPageSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      onDrawerChanged: (isOpen) {
        setState(() {
          _isDrawerOpen = isOpen;
        });
      },
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: _isDrawerOpen
          ? null
          : FloatingActionButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(Icons.keyboard_double_arrow_right),

            )
    );
  }
}

class HomeDrawer extends StatefulWidget {
  final ValueChanged<int> onPageSelected;
  const HomeDrawer({super.key, required this.onPageSelected});

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  bool didLoadUser = false;

  @override
  void initState() {
    super.initState();
    final userState = Provider.of<UserState>(context, listen: false);
    if (userState.user != null) {
      setState(() {
        didLoadUser = true;
      });

      // userState.setUser() -> implementar lógica para carregar os dados do usuário a partir de uma API
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Finance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Overview'),
            onTap: () {
              widget.onPageSelected(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.currency_exchange),
            title: Text('Transactions'),
            onTap: () {
              widget.onPageSelected(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.pie_chart),
            title: Text('Budgets'),
            onTap: () {
              widget.onPageSelected(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Pots'),
            onTap: () {
              widget.onPageSelected(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Recurring Bills'),
            onTap: () {
              widget.onPageSelected(4);
              Navigator.pop(context);
            },
          ),

          SizedBox(height: 750),
          ListTile(
            leading: Icon(Icons.keyboard_double_arrow_left),
            title: Text('Minimize Menu'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}