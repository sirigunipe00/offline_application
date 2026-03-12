

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    @JsonKey(name: 'subject') required String subject,
    @JsonKey(name: 'description') required String description,  
  }) = _TaskModel;
factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);
}