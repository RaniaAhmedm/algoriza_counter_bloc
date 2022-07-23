import 'package:counter_bloc/bloc/States/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserItem extends StatelessWidget {
  final Map item;

  const UserItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocApp blocApp = BlocProvider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: InkWell(
        onTap: () {
          blocApp.selectedUserToUpdate(user: item);
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.teal,
              child: Text(
                '${item['id']}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                '${item['name']}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
