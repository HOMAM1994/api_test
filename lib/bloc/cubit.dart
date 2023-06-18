import 'package:api_project/bloc/cubit_status.dart';
import 'package:api_project/screen/business.dart';
import 'package:api_project/screen/sciences.dart';
import 'package:api_project/screen/sports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_project/remote/diohalper.dart';

import '../screen/setting.dart';

class CubitCounter extends Cubit<CubitStatus> {
  CubitCounter() : super(InitialState());

  static CubitCounter get(context) => BlocProvider.of(context);
  List showScreen = [
    Business(),
    Sports(),
    Sciences(),
    Setting(),
  ];
  List <dynamic> business=[];
  List <dynamic> sports=[];
  List <dynamic> science=[];
  int indexBar=0;
  getIndex(index){
    indexBar=index;
    emit(BottomBar());
  }
  getNewsBusiness(){
    emit(IsLoading());
    DioHelper.getData(url:'/v2/top-headlines',
      query: {
        //https://newsapi.org/v2/top-headlines?country=eg&apiKey=a266b0cf79ed45be8861f6029ec98199
        'country':'us',
        'category':'business',
        'apiKey':'a266b0cf79ed45be8861f6029ec98199',
      },).then((value){
      business=value.data['articles'];
      emit(BusinessSuccess());
    }).catchError(
            (error){
              emit(NewsError(error));
              print (error);
            });
  }
  getNewsSports(){
    emit(IsLoading());
    DioHelper.getData(url:'/v2/top-headlines',
      query: {
        //https://newsapi.org/v2/top-headlines?country=eg&apiKey=a266b0cf79ed45be8861f6029ec98199
        'country':'us',
        'category':'sports',
        'apiKey':'a266b0cf79ed45be8861f6029ec98199',
      },).then((value){
      sports=value.data['articles'];
      emit(SportSuccess());
    }).catchError(
            (error){
          emit(NewsError(error));
          print (error);
        });
  }
  getNewsScience(){
    emit(IsLoading());
    DioHelper.getData(url:'/v2/top-headlines',
      query: {
        //https://newsapi.org/v2/top-headlines?country=eg&apiKey=a266b0cf79ed45be8861f6029ec98199
        'country':'us',
        'category':'science',
        'apiKey':'a266b0cf79ed45be8861f6029ec98199',
      },).then((value){
      science=value.data['articles'];
      emit(ScienceSuccess());
    }).catchError(
            (error){
          emit(NewsError(error));
          print (error);
        });
  }

}

