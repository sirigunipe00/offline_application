import 'package:freezed_annotation/freezed_annotation.dart';

part 'logged_in_user.freezed.dart';
part 'logged_in_user.g.dart';

@freezed
class LoggedInUser with _$LoggedInUser {
  const LoggedInUser._();

  const factory LoggedInUser({
    required String name,
    String? username,
    @JsonKey(name: 'first_name', defaultValue: '') String? firstName,
    @JsonKey(name: 'last_name', defaultValue: '') String? lastName,
    @JsonKey(name: 'api_key', defaultValue: '') required String apiKey,
    @JsonKey(name: 'api_secret', defaultValue: '') required String apiSecret,
    @JsonKey(name: 'email', defaultValue: '') String? email,
    @JsonKey(defaultValue: '') String? password,
    @JsonKey(name: 'role_profile_name', defaultValue: '')
    String? roleProfileName,
    @JsonKey(name: 'user_type') String? userType,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'birth_date') String? birthDate,
    @JsonKey(name: 'depo_name') String? depoName,
    @JsonKey(name: 'plant_name') String? plantName,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'transporter') String? transporter,
    @JsonKey(name: 'customer') String? customer,
    String? phone,
    String? location,
    String? bio,
    @JsonKey(name: 'mobile_no') String? mobileNo,
    @JsonKey(name: 'otp_verified') bool? isOtpVerified,
    @JsonKey(name: 'roles') List<UserRole>? roles,
    @JsonKey(name: 'role_status') RoleStatus? roleStatus,
  }) = _LoggedInUser;

  factory LoggedInUser.fromJson(Map<String, dynamic> json) =>
      _$LoggedInUserFromJson(json);
}
@freezed
class UserRole with _$UserRole {
  const factory UserRole({
    @JsonKey(name: 'role') String? role,
  }) = _UserRole;

  factory UserRole.fromJson(Map<String, dynamic> json) => _$UserRoleFromJson(json);
}

@freezed
class RoleStatus with _$RoleStatus {
  const RoleStatus._();

  const factory RoleStatus({
    @JsonKey(name: 'Show Dashboards in Mobile App') int? showDashboards,
    @JsonKey(name: 'Show Gate Entry in Mobile App') int? showGateEntry,
    @JsonKey(name: 'Show Gate Exit in Mobile App') int? showGateExit,
    @JsonKey(name: 'Show Logistic Request in Mobile App') int? showLogisticRequest,
    @JsonKey(name: 'Show Transporter Confirmation in Mobile App') int? showTransporterConfirmation,
    @JsonKey(name: 'Show Vehicle Reporting in Mobile App') int? showVehicleReporting,
    @JsonKey(name: 'Show Loading Confirmation in Mobile App') int? showLoadingConfirmation,
    @JsonKey(name: 'Show Proof of Delivery in Mobile App') int? showpod,
    @JsonKey(name: 'Show Gate Management in Mobile App') int? showgaetManagement,
  }) = _RoleStatus;

  factory RoleStatus.fromJson(Map<String, dynamic> json) =>
      _$RoleStatusFromJson(json);
}
