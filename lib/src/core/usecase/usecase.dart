/* 
A generic UseCase class
wich is a callable class  that contains implementations of a method called “call” 
and this “call” method itself responsible for making the instance a callable instead of
 calling method belongs to that instance. 
*/
abstract class UseCase<T, P> {
  Future<T> call({P params});
}
