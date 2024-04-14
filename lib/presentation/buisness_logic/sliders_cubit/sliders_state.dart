part of 'sliders_cubit.dart';

sealed class SlidersState {}

final class SlidersInitial extends SlidersState {}


class GetSlidersLoading extends SlidersState {}

class GetSlidersSuccess extends SlidersState {}

class GetSlidersError extends SlidersState {
  final String error;

  GetSlidersError({required this.error});
}