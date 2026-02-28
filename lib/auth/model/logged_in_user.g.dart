// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoggedInUserImpl _$$LoggedInUserImplFromJson(Map<String, dynamic> json) =>
    _$LoggedInUserImpl(
      name: json['name'] as String,
      username: json['username'] as String?,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      apiKey: json['api_key'] as String? ?? '',
      apiSecret: json['api_secret'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      roleProfileName: json['role_profile_name'] as String? ?? '',
      userType: json['user_type'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birth_date'] as String?,
      depoName: json['depo_name'] as String?,
      plantName: json['plant_name'] as String?,
      fullName: json['full_name'] as String?,
      transporter: json['transporter'] as String?,
      customer: json['customer'] as String?,
      phone: json['phone'] as String?,
      location: json['location'] as String?,
      bio: json['bio'] as String?,
      mobileNo: json['mobile_no'] as String?,
      isOtpVerified: json['otp_verified'] as bool?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => UserRole.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleStatus: json['role_status'] == null
          ? null
          : RoleStatus.fromJson(json['role_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoggedInUserImplToJson(_$LoggedInUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'api_key': instance.apiKey,
      'api_secret': instance.apiSecret,
      'email': instance.email,
      'password': instance.password,
      'role_profile_name': instance.roleProfileName,
      'user_type': instance.userType,
      'gender': instance.gender,
      'birth_date': instance.birthDate,
      'depo_name': instance.depoName,
      'plant_name': instance.plantName,
      'full_name': instance.fullName,
      'transporter': instance.transporter,
      'customer': instance.customer,
      'phone': instance.phone,
      'location': instance.location,
      'bio': instance.bio,
      'mobile_no': instance.mobileNo,
      'otp_verified': instance.isOtpVerified,
      'roles': instance.roles,
      'role_status': instance.roleStatus,
    };

_$UserRoleImpl _$$UserRoleImplFromJson(Map<String, dynamic> json) =>
    _$UserRoleImpl(
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$UserRoleImplToJson(_$UserRoleImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
    };

_$RoleStatusImpl _$$RoleStatusImplFromJson(Map<String, dynamic> json) =>
    _$RoleStatusImpl(
      showDashboards: (json['Show Dashboards in Mobile App'] as num?)?.toInt(),
      showGateEntry: (json['Show Gate Entry in Mobile App'] as num?)?.toInt(),
      showGateExit: (json['Show Gate Exit in Mobile App'] as num?)?.toInt(),
      showLogisticRequest:
          (json['Show Logistic Request in Mobile App'] as num?)?.toInt(),
      showTransporterConfirmation:
          (json['Show Transporter Confirmation in Mobile App'] as num?)
              ?.toInt(),
      showVehicleReporting:
          (json['Show Vehicle Reporting in Mobile App'] as num?)?.toInt(),
      showLoadingConfirmation:
          (json['Show Loading Confirmation in Mobile App'] as num?)?.toInt(),
      showpod: (json['Show Proof of Delivery in Mobile App'] as num?)?.toInt(),
      showgaetManagement:
          (json['Show Gate Management in Mobile App'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RoleStatusImplToJson(_$RoleStatusImpl instance) =>
    <String, dynamic>{
      'Show Dashboards in Mobile App': instance.showDashboards,
      'Show Gate Entry in Mobile App': instance.showGateEntry,
      'Show Gate Exit in Mobile App': instance.showGateExit,
      'Show Logistic Request in Mobile App': instance.showLogisticRequest,
      'Show Transporter Confirmation in Mobile App':
          instance.showTransporterConfirmation,
      'Show Vehicle Reporting in Mobile App': instance.showVehicleReporting,
      'Show Loading Confirmation in Mobile App':
          instance.showLoadingConfirmation,
      'Show Proof of Delivery in Mobile App': instance.showpod,
      'Show Gate Management in Mobile App': instance.showgaetManagement,
    };
