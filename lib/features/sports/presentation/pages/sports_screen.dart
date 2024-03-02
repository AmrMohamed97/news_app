import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utiles/functions/functions.dart';
import 'package:news_app/core/utiles/widgets/news_builder.dart';
import 'package:news_app/features/news_layout/presentation/manager/news_cubit.dart';
import 'package:news_app/features/news_layout/presentation/manager/news_states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var sportsList=NewsCubit.get(context).sports;
        return sportsList.isEmpty? const Center(child: CircularProgressIndicator()):
        ListView.separated(
          itemBuilder:(context,index)=>NewsBuilder(context: context,category: sportsList[index]) ,
          separatorBuilder: (context,index)=>mySeparator(),
          itemCount: sportsList.length,
          physics: const BouncingScrollPhysics(),
        );
      },
    );
  }
}