import 'package:flutter/material.dart';
import 'package:istiqomah/models/habit.dart';
import 'package:istiqomah/widgets/habits/habits.dart';
import 'package:istiqomah/widgets/habits/modal/add.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
            children: <Widget>[
              _header(context),
              Consumer<HabitModel>(
                builder: (context, data, child) =>
                    HabitList(habits: data.habit),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      child: Row(children: [
        Expanded(
          child: Text(
            'ISTIQOMAH',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        RawMaterialButton(
          fillColor: Colors.white,
          shape: new CircleBorder(),
          constraints: BoxConstraints.expand(width: 50, height: 50),
          onPressed: () {
            modalAddHabit(context).then(
              (value) => {
                if (value != null && value != '')
                  Provider.of<HabitModel>(context, listen: false).add(
                    Habit(name: value),
                  )
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
          ),
        )
      ]),
    );
  }
}
