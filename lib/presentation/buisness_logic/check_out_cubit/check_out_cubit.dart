
import 'package:flutter_bloc/flutter_bloc.dart';
import 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(CheckOutInitial());
  static CheckOutCubit get(context) => BlocProvider.of(context);

  DateTime? chosenDate;
  String? time;
  DateTime? submittedChosenDate;
  String? submittedTime;
  bool deliveryTimeDataSubmitted = false;
  int deliveryDestinationIndex = 0;
  int deliveryTimeIndex = 0;
  int submittedDeliveryTimeIndex = 0;
  void changeDate(DateTime dateTime){
    chosenDate = dateTime;
    emit(ChangeDateState());
  }
  void changeTime(String time){
    this.time = time;
    emit(ChangeTimeState());
  }
  void changeDeliveryDestinationIndex(int index){
    deliveryDestinationIndex = index;
    emit(ChangeDeliveryDestinationIndexState());
  }
  void changeDeliveryTimeIndex(int index){
    deliveryTimeIndex = index;
    emit(ChangeDeliveryTimeIndexState());
  }
  Future<void> clearDeliveryTimeData() async{
    chosenDate = null;
    time = null;
    deliveryDestinationIndex = 0;
    deliveryTimeIndex = 0;
    emit(ClearDeliveryTimeData());
  }
  Future<void> deliveryTimeDataSubmit() async{
   if(deliveryTimeDataSubmitted==false){
     deliveryTimeDataSubmitted = true;
     submittedChosenDate = chosenDate;
     submittedTime = time;
     submittedDeliveryTimeIndex = deliveryTimeIndex;
     emit(SubmitDeliveryTimeData());
   }
  }
}
