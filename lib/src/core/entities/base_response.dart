import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BaseResponse extends Equatable {
  BaseResponse({
    this.status,
    this.message,
    this.pageCount,
    this.totalRecords,
    this.pageSize,
    this.pageIndex,
    this.data,
  });

  final String? status;
  final String? message;
  final int? pageCount;
  final int? totalRecords;
  final int? pageSize;
  final int? pageIndex;
  dynamic data;

  @override
  List<Object?> get props =>
      [status, message, pageCount, totalRecords, pageSize, pageIndex, data];
}
