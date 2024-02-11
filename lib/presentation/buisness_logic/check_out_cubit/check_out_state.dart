
abstract class CheckOutState {}

class CheckOutInitial extends CheckOutState {}


class ChangeDateState extends CheckOutState {}
class ChangeTimeState extends CheckOutState {}
class ChangeDeliveryDestinationIndexState extends CheckOutState {}
class ChangeDeliveryTimeIndexState extends CheckOutState {}
class ClearDeliveryTimeData extends CheckOutState {}
class SubmitDeliveryTimeData extends CheckOutState {}
