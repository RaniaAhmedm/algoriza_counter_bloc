import 'package:counter_bloc/bloc/States/bloc.dart';
import 'package:counter_bloc/bloc/States/bloc_States.dart';
import 'package:counter_bloc/screens/Users/Widget/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  static const String routeName = 'Users Screen';

  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  @override
  Widget build(BuildContext context) {

    BlocApp blocApp = BlocProvider.of(context);
    return BlocConsumer<BlocApp, BlocState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Users',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: blocApp.userNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    labelText: 'Username',
                    labelStyle:
                        const TextStyle(color: Colors.teal, fontSize: 16),
                    suffixIcon: TextButton(
                        onPressed: () {
                          blocApp.insertUserData();
                        },
                        child:  Text(
                          blocApp.selectUser.isEmpty?
                          'Save':'Update',
                          style: const TextStyle(color: Colors.teal, fontSize: 16),
                        ))),
              ),
              Expanded(
                child: RefreshIndicator(
                  color: Colors.teal,
                  onRefresh: () async {
                    blocApp.getUsersData();

                  },
                  child: ListView.separated(
                      itemBuilder: (context, index) => UserItem(
                            item: blocApp.users[index],
                          ),
                      separatorBuilder: (context, index) => Container(
                          height: 1,
                          color: Colors.blueGrey[200],
                          width: double.infinity),
                      itemCount: blocApp.users.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
