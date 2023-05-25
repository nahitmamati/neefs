
import 'package:bloc/bloc.dart';

class SliderIndexCubit extends Cubit<int> {
  SliderIndexCubit() : super(0);
  int sliderIndex = 0;
  void changeIndex(int index){
    sliderIndex = index;
    emit(index);
  }
}