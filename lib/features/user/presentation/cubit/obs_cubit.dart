import 'package:flutter_bloc/flutter_bloc.dart';

class ObsCubit extends Cubit<bool> {
  ObsCubit() : super(true);

  void showPassword(bool isShow) {
    emit(isShow);
  }
}
