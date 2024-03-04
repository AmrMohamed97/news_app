import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utiles/functions/functions.dart';
import 'package:news_app/core/utiles/widgets/custom_form_field.dart';
import 'package:news_app/core/utiles/widgets/news_builder.dart';
import 'package:news_app/features/manager/news_cubit.dart';
import 'package:news_app/features/manager/news_states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var search = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white12,
                    ),
                    child: CustomFormField(
                        hintText: 'Search',
                        prefix: Icons.search,
                        controller: searchController,
                        onChanged: (value) {
                          NewsCubit.get(context)
                              .getSearch(value: value.toString());
                        }),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        NewsBuilder(context: context, category: search[index]),
                    separatorBuilder: (context, index) => mySeparator(),
                    itemCount: search.length,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
