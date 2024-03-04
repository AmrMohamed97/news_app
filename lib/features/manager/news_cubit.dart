import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utiles/cache_helper/cache_helper.dart';
import 'package:news_app/core/utiles/dio_helper/dio_helper.dart';
import 'package:news_app/features/business/pages/business_screen.dart';
import 'package:news_app/features/manager/news_states.dart';
 import 'package:news_app/features/science/pages/science_screen.dart';
import 'package:news_app/features/sports/pages/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit():super(NewsInitialStates());

  int currentIndex=0;
  List<BottomNavigationBarItem> bottomItems= const [
    BottomNavigationBarItem(
      icon:Icon(Icons.business) ,
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.sports) ,
      label:'Sports' ,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];
  List<Widget> screen= const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
   ];
  static NewsCubit get(context)=>BlocProvider.of(context);

  void changeBottomNavBar({required int newIndex}){
    currentIndex = newIndex;
    // if(currentIndex==1){
    //   getSports();
    // }
    // if(currentIndex==2){
    //   getScience();
    // }
    // if(currentIndex==3){
    //   getSettings();
    // }
    emit(NewsBottomNavState());
  }

  List<dynamic> business =[];

  void getBusiness()async{
    // if(business.isEmpty){
  emit(NewsLoadingState());
  await DioHelper.getData(
  url: 'v2/top-headlines',
  parameter: {
  'country':'eg',
  'category':'business',
  'apikey':'daa010b93cb64fcfbde6b10b6161c62f',
  },).then((value) {
  business=value.data['articles'];
   emit(NewsGetBusinessSuccessState());
  }).catchError((exception) {
   emit(NewsGetBusinessErrorState(error: exception));
  });
  }
  //   else{
  //     emit(NewsGetBusinessSuccessState());
  //   }
  // }

  List<dynamic> sports =[];
  void getSports()async{
    // if(sports.isEmpty){
    emit(NewsLoadingState());
    await DioHelper.getData(
        url: 'v2/top-headlines',
        parameter: {
          'country':'eg',
          'category':'sports',
          'apikey':'daa010b93cb64fcfbde6b10b6161c62f',
        },
    ).then((value) {
      sports=value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((exception){
       emit(NewsGetSportsErrorState(error: exception));
    });
  }
  //   else{
  //     emit(NewsGetSportsSuccessState());
  //   }
  // }

  List<dynamic> science =[];
  void getScience()async{
    // if(science.isEmpty){
      emit(NewsLoadingState());
    await DioHelper.getData(
        url: 'v2/top-headlines',
        parameter: {
          'country':'eg',
          'category':'science',
          'apikey':'daa010b93cb64fcfbde6b10b6161c62f',
        },
    ).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
       emit(NewsGetScienceErrorState(error: error));
    });
  }
  //   else{
  //     emit(NewsGetScienceSuccessState());
  //   }
  // }

  List<dynamic> settings=[];
  void getSettings()async{
    // if(settings.isEmpty){
    emit(NewsLoadingState());
    await DioHelper.getData(
      url: 'v2/top-headlines',
      parameter:{
        'country':'eg',
        'category':'settings',
        'apikey':'daa010b93cb64fcfbde6b10b6161c62f',

      },
    ).then((value) {
      settings =value.data['articles'];
      emit(NewsGetSettingsSuccessState());
    }).catchError((error){
       emit(NewsGetSettingsErrorState(error: error));
    });
  }
  //   else{
  //     emit(NewsGetSettingsSuccessState());
  //   }
  // }

  bool isDark=false;
  void changeMode()async {
    if(CacheHelper.getMode(key: 'isDark')!=null){
      isDark = !(CacheHelper.getMode(key: 'isDark')==true?true:false);
      await CacheHelper.setMode(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
    });
    }
    else {
      isDark = !isDark;
      await CacheHelper.setMode(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }

  List<dynamic> search=[];
  void getSearch({String? value})async{
    emit(NewsGetSearchLoadingState());
    await DioHelper.getData(
      url: 'v2/everything',
      parameter:{
        'q': value ,
        'apikey':'daa010b93cb64fcfbde6b10b6161c62f',
      } ).then((value) {
        search =value.data['articles'];
        emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error: error));
    });
  }
}