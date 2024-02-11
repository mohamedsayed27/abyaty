import 'package:equatable/equatable.dart';

class  PaginateFieldsEntity extends Equatable{
  final int currentPage;
  final int lastPage;

  const PaginateFieldsEntity({required this.currentPage, required this.lastPage,});
  @override
  // TODO: implement props
  List<Object?> get props => [
    currentPage,
    lastPage
  ];

}