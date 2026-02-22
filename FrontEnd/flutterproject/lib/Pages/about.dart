import 'package:flutter/material.dart';
//import 'dart:ui';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/loginIMG.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 2,
          constraints: BoxConstraints(maxWidth: 1220,maxHeight: 720,minWidth: 950),
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 80, 37, 102),
                Color.fromARGB(255, 69, 15, 101),
                Color.fromARGB(255, 54, 35, 68),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(6))
          ),      
        child: Column(
          children: [
            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE6E2D9),
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 46),
                  shape: const CircleBorder(),
                  textStyle: TextStyle(fontSize: 17),
                ),
                child: Icon(Icons.arrow_back),
              ),
            ),

            Text(
              'About Us',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 26),

                Text(
                  '''
                  💰 Personal Finance Management System is a full-stack application designed to help users manage their personal finances efficiently.
                  It allows users to track income, expenses, recurring payments, budgets, and savings goals through an intuitive Flutter interface.
                  The project uses Microsoft SQL Server as its relational database, ensuring data integrity, security, and scalability.
                  It is developed as part of my academic journey in Systems Analysis and Development, combining theory with practical experience.
                  Features
                  Track personal income and expenses
                  Manage recurring expenses such as subscriptions or installments
                  Create and monitor savings goals (“pots”)
                  Define spending limits with budgets
                  Analyze financial balance over time
                  Database Highlights
                  Users: stores personal and authentication data
                  Recurring Bills: tracks subscriptions and installment payments
                  User Transactions: logs all incomes and expenses
                  Pots: defines savings targets
                  Budgets: monitors spending limits
                  The Flutter frontend provides a dashboard, transaction registration, recurring expense management, and budget tracking.
                  The interface is clean, responsive, and scalable for future improvements.
                  Future Plans
                  REST API integration
                  Transaction categorization and analytics dashboards
                  Authentication and authorization
                  Advanced reporting and insights generation
                  This project reflects both academic learning and professional experience and is intended for educational and portfolio purposes.
                                      ''',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                      ),
                    
                  )
            ],
          ),
        )
      ),
    );
  }
}
