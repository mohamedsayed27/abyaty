
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());

  static MainLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeCurrentIndex(int index){
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }
}
