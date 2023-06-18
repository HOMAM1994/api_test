import 'package:api_project/bloc/cubit.dart';
import 'package:api_project/bloc/cubit_status.dart';
import 'package:api_project/sheared/sheared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sciences extends StatelessWidget {
  const Sciences({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitCounter, CubitStatus>(

      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CubitCounter.get(context);
        return ListView.separated(
            itemBuilder:(context,index)=>builderBody(cubit.science[index]),
            separatorBuilder: (context,index)=>const SizedBox(height: 20),
            itemCount: cubit.business.length);
      },
    );
  }
}
