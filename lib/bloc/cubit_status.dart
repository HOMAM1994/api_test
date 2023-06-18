abstract class CubitStatus{}
class InitialState extends CubitStatus{}
class BottomBar extends CubitStatus{}
class IsLoading extends CubitStatus{}
class BusinessSuccess extends CubitStatus{}
class SportSuccess extends CubitStatus{}
class ScienceSuccess extends CubitStatus{}
class NewsError extends CubitStatus{
  final String error;
  NewsError(this.error);
}