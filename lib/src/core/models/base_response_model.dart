import '../entities/base_response.dart';

// ignore: must_be_immutable
class BaseResponseModel extends BaseResponse {
  BaseResponseModel(
      {String? status,
      String? message,
      int? pageCount,
      int? totalRecords,
      int? pageSize,
      int? pageIndex,
      dynamic data})
      : super(
          status: status,
          message: message,
          pageCount: pageCount,
          totalRecords: totalRecords,
          pageSize: pageSize,
          pageIndex: pageIndex,
          data: data,
        );

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      BaseResponseModel(
        status: json["status"],
        message: json["message"],
        pageCount: json["pageCount"],
        totalRecords: json["totalRecords"],
        pageSize: json["pageSize"],
        pageIndex: json["pageIndex"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "pageCount": pageCount,
        "totalRecords": totalRecords,
        "pageSize": pageSize,
        "pageIndex": pageIndex,
        "data": data,
      };
}
