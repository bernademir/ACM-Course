import 'package:acmweek3/core/enum/service_path_enum.dart';

class PostServiceException implements Exception {
  final ServicePathEnum data;

  PostServiceException(this.data);
  @override
  String toString() {
    return 'Service not found $data';
  }
}