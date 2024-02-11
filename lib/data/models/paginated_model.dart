import 'package:abyaty/domain/entities/paginate_entity.dart';


class PaginationFieldsModel extends PaginateFieldsEntity {
  const PaginationFieldsModel({
    required super.currentPage,
    required super.lastPage,
  });

  factory PaginationFieldsModel.fromJson(Map<String, dynamic> json) {
    return PaginationFieldsModel(
      currentPage: json['current_page'],
      lastPage: json['last_page'],
    );
  }
}
