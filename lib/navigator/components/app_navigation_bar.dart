import 'package:dictionary/providers/navigation_bar_provider.dart';
import 'package:dictionary/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = context.watch<BottomNavBarState>().index;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex:
            Provider.of<BottomNavBarState>(context, listen: true).index,
        selectedItemColor: Colors.amber[800],
        onTap: (input) => context.read<BottomNavBarState>().onChanged(input),
      ),
    );
  }
}


// Container(
//       decoration: AppContainerStyle.border.copyWith(
//         color: AppColors.darkGreen,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children:  [
//             GestureDetector(
//               child: const Icon(
//                 Icons.ad_units,
//                 size: 35,
//               ),
//               onTap: () {
             
//               },
//             ),
//             GestureDetector(
//               child: const Icon(
//                 Icons.access_alarm,
//                 size: 35,
//               ),
//               onTap: () {
                
//               },
//             ),
//             GestureDetector(
//               child: const Icon(
//                 Icons.account_balance_wallet_rounded,
//                 size: 35,
//               ),
//               onTap: () {
                
//               },
//             ),
//           ],
//         ),
//       ),
//     );
