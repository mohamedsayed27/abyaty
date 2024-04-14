import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/services/services_locator.dart';
import '../../../domain/entities/sliders/slider_details_entity.dart';
import '../../../domain/use_cases/sliders_use_cases/sliders_use_cases.dart';

part 'sliders_state.dart';

class SlidersCubit extends Cubit<SlidersState> {
  final GetSlidersDataUseCase _getSlidersDataUseCase = sl();

  SlidersCubit() : super(SlidersInitial());

  static SlidersCubit get(context) => BlocProvider.of(context);

  List<SliderDetailsEntity> slidersList = [];
  bool getSlider = false;

  void getSliders() async {
    getSlider = true;
    emit(GetSlidersLoading());
    final response = await _getSlidersDataUseCase(const NoParameters());
    response.fold((l) {
      getSlider = false;
      emit(GetSlidersError(
        error: l.baseErrorModel.message ?? "",
      ));
    }, (r) {
      slidersList = r.sliderDetailsEntity ?? [];
      print(slidersList);
      getSlider = false;
      emit(GetSlidersSuccess());
    });
  }
}
