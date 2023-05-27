
import 'package:bloc/bloc.dart';

class SliderIndexCubit extends Cubit<int> {
  SliderIndexCubit() : super(0);

  set index(int i) => emit(i);
  int get index => state;
}