import 'package:api_project/bloc/cubit.dart';
import 'package:api_project/bloc/cubit_status.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitCounter()..getNewsBusiness()..getNewsSports()..getNewsScience(),
      child: BlocConsumer<CubitCounter, CubitStatus>(
        listener: (context, status) {},
        builder: (context, status) {
          var cubit = CubitCounter.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('${cubit.showScreen[cubit.indexBar]}'),
            ),
            body: cubit.showScreen[cubit.indexBar],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.indexBar,
              onTap: (index) {
                cubit.getIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper_outlined),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports),
                  label: 'Sports',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.science_outlined),
                  label: 'Science',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Setting',
                ),
              ],
            ),
         );
        },
      ),
    );
  }
}
