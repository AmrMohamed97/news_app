abstract class NewsStates{}

class NewsInitialStates extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final dynamic error;
  NewsGetBusinessErrorState({required this.error});

}

class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final dynamic error;
  NewsGetSportsErrorState({required this.error});
}

class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final dynamic error;
  NewsGetScienceErrorState({required this.error});
}

class NewsGetSettingsSuccessState extends NewsStates{}
class NewsGetSettingsErrorState extends NewsStates{
  final dynamic error;
  NewsGetSettingsErrorState({required this.error});
}

class NewsChangeModeState extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
  final dynamic error;
  NewsGetSearchErrorState({required this.error});
}