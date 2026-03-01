import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutterproject/states/user_state.dart';

class UserPage extends StatelessWidget {
  final UserState userState = UserState();

  UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: LayoutGrid(
          areas: '''
            overview overview overview
            potstran potstran budbill
            potstran potstran budbill
          ''',
          rowSizes: [
            1.fr,
            1.fr,
            1.fr,
          ],
          columnSizes: [1.fr, 1.fr, 1.fr],
          children: [
            Wrap( // Wrap for User's Overview
              direction: Axis.horizontal,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 20,
                  children: [
                    Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: screenWidth * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text('Current Balance',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text('4199.00',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.015,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text('Income',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text('4199.00',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.015,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                              ]
                            ),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text('Expenses',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text('4199.00',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.015,
                                    fontWeight: FontWeight.bold,
                                  )
                                ),
                              ]
                            ),
                          ),
                        )
                      ],
                    )
                  ]
                )
              ],
            ).inGridArea('overview'),

              Wrap( // Wrap for User's Pots and Transactions
                direction: Axis.vertical,
                children: [
                  Wrap(
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 20,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                spacing: 10,
                                children: [
                                  
                                  Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 150,
                                    children: [
                                      Text('Pots', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                      TextButton.icon(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right), label: Text('See details', style: TextStyle(fontSize: 16),),)
                                    ],
                                  ),

                                  Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 10,
                                    children: [
                                      Card(
                                        color: Colors.white70,
                                        child: Padding(
                                          padding:  const EdgeInsets.all(16.0),
                                          child: Wrap(
                                            direction: Axis.horizontal,
                                            children: [
                                              Icon(Icons.wallet, size: 36,),
                                              Column(
                                                children: [
                                                  Text('Total Saved', style: TextStyle(fontSize: 12),),
                                                  Text('4199.00', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        width: 200,
                                        child: Wrap(
                                        direction: Axis.horizontal,
                                        runSpacing: 5.0,
                                        children: [
                                            SizedBox(
                                              width: 100,
                                              child: Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Savings', style: TextStyle(fontSize: 12),),
                                                  Text('500.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Gift', style: TextStyle(fontSize: 12),),
                                                  Text('250.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Concert Tickets', style: TextStyle(fontSize: 12),),
                                                  Text('50.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: Column(
                                                spacing: 5,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('New Laptop', style: TextStyle(fontSize: 12),),
                                                  Text('10.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]
                      ),
                    ],
                  ),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          direction: Axis.vertical,
                          spacing: 10.0,
                          runSpacing: 10,
                          children: [
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 150,
                              children: [
                                Text('Transactions', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                TextButton.icon(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right), label: Text('View All', style: TextStyle(fontSize: 16),),)
                              ],
                            ),
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 10.0,
                              children: [
                                Row(
                                  spacing: 100,
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Icon(Icons.person, size: 36,),
                                        Text('Emma Richardson', style: TextStyle(fontSize: 18),),
                                      ]
                                    ),
                                    Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        Text('+500.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                        Text('19 Aug, 2024', style: TextStyle(fontSize: 12,))
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  spacing: 100,
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Icon(Icons.person, size: 36,),
                                        Text('Emma Richardson', style: TextStyle(fontSize: 18),),
                                      ]
                                    ),
                                    Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        Text('+500.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                        Text('19 Aug, 2024', style: TextStyle(fontSize: 12,))
                                      ],
                                    )
                                  ],
                                ),
                                
                                Row(
                                  spacing: 100,
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Icon(Icons.person, size: 36,),
                                        Text('Emma Richardson', style: TextStyle(fontSize: 18),),
                                      ]
                                    ),
                                    Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        Text('+500.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                        Text('19 Aug, 2024', style: TextStyle(fontSize: 12,))
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  spacing: 100,
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        Icon(Icons.person, size: 36,),
                                        Text('Emma Richardson', style: TextStyle(fontSize: 18),),
                                      ]
                                    ),
                                    Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        Text('+500.00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                        Text('19 Aug, 2024', style: TextStyle(fontSize: 12,))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                  ],
                ).inGridArea('potstran'),

                Wrap( // Wrap for User's Budgets and Recurring Bills
                  direction: Axis.vertical,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          direction: Axis.vertical,
                          spacing: 20.0,
                          children: [
                            Row(
                              spacing: 150,
                              children: [
                                Text('Budgets', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                TextButton.icon(onPressed: () {}, label: Text('See Detalis', style: TextStyle(fontSize: 16)), icon: Icon(Icons.keyboard_arrow_right),)
                              ],
                            ),

                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 30.0,
                              children: [
                                EasyPieChart(
                                  children: [
                                    PieData(value: 30.00, color: Colors.red),
                                    PieData(value: 750.00, color: Colors.green),
                                    PieData(value: 100.00, color: Colors.blue),
                                    PieData(value: 500.00, color: Colors.yellow),
                                  ],
                                  centerText: '1380.00 \n of limit 1500.00',
                                  centerStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                                ),
                                Column(
                                  spacing: 10.0,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Wrap(
                                        direction: Axis.vertical,
                                        spacing: 10.0,
                                        children: [
                                          Text('Entertainment', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                          Text('30.00', style: TextStyle(fontSize: 16),)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Wrap(
                                        direction: Axis.vertical,
                                        spacing: 10.0,
                                        children: [
                                          Text('Bills', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                          Text('750.00', style: TextStyle(fontSize: 16),)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Wrap(
                                        direction: Axis.vertical,
                                        spacing: 10.0,
                                        children: [
                                          Text('Dining Out', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                          Text('100.00', style: TextStyle(fontSize: 16),)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Wrap(
                                        direction: Axis.vertical,
                                        spacing: 10.0,
                                        children: [
                                          Text('Groceries', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                          Text('500.00', style: TextStyle(fontSize: 16),)
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          direction: Axis.vertical,
                          children: [
                            Wrap(
                              direction: Axis.horizontal,
                              spacing: 150,
                              children: [
                                Text('Recurring Bills', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                                TextButton.icon(onPressed: () {}, label: Text('See Detalis', style: TextStyle(fontSize: 16)), icon: Icon(Icons.keyboard_arrow_right),)
                              ],
                            ),
                            
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 10.0,
                              children: [
                                SizedBox(
                                  width: 400,
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      Text('Paid Bills', style: TextStyle(fontSize: 18),),
                                      Text('500.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                                    ]
                                  ),
                                ),
                               
                                SizedBox(
                                  width: 400,
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      Text('Total Upcoming', style: TextStyle(fontSize: 18),),
                                      Text('250.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                                    ]
                                  ),
                                ),
                                  
                                SizedBox(
                                  width: 400,
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      Text('Due Soon', style: TextStyle(fontSize: 18),),
                                      Text('60.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                                    ]
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ).inGridArea('budbill'),
          ],
        ),
      )
    );
  }
}