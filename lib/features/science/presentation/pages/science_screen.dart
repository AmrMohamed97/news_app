import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:news_app/core/utiles/functions/functions.dart';
import 'package:news_app/core/utiles/widgets/news_builder.dart';
import 'package:news_app/features/news_layout/presentation/manager/news_cubit.dart';
import 'package:news_app/features/news_layout/presentation/manager/news_states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var scienceList=NewsCubit.get(context).science;
        return scienceList.isEmpty?const Center(child: CircularProgressIndicator())
            :ListView.separated(
            itemBuilder:(context,index)=>NewsBuilder(context: context,category: scienceList[index]) ,
            separatorBuilder: (context,index)=>mySeparator(),
            itemCount: scienceList.length,
            physics: const BouncingScrollPhysics(),
        );
      },
    );
  }
}