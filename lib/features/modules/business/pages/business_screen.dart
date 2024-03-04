import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utiles/functions/functions.dart';
import 'package:news_app/core/utiles/widgets/news_builder.dart';
import 'package:news_app/features/manager/news_cubit.dart';
import 'package:news_app/features/manager/news_states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var businessList=NewsCubit.get(context).business;
        return businessList.isNotEmpty? ListView.separated(
          itemBuilder:(context,index)=>NewsBuilder(context: context,category: businessList[index]) ,
          separatorBuilder: (context,index)=>mySeparator(),
          itemCount: businessList.length,
          physics: const BouncingScrollPhysics(),):const Center(child: CircularProgressIndicator());
      },
    );
  }
}