// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logged_in_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoggedInUser _$LoggedInUserFromJson(Map<String, dynamic> json) {
  return _LoggedInUser.fromJson(json);
}

/// @nodoc
mixin _$LoggedInUser {
  String get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name', defaultValue: '')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name', defaultValue: '')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'api_key', defaultValue: '')
  String get apiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'api_secret', defaultValue: '')
  String get apiSecret => throw _privateConstructorUsedError;
  @JsonKey(name: 'email', defaultValue: '')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_profile_name', defaultValue: '')
  String? get roleProfileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_type')
  String? get userType => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  String? get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'depo_name')
  String? get depoName => throw _privateConstructorUsedError;
  @JsonKey(name: 'plant_name')
  String? get plantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'transporter')
  String? get transporter => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  String? get customer => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_no')
  String? get mobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'otp_verified')
  bool? get isOtpVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  List<UserRole>? get roles => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_status')
  RoleStatus? get roleStatus => throw _privateConstructorUsedError;

  /// Serializes this LoggedInUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoggedInUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoggedInUserCopyWith<LoggedInUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedInUserCopyWith<$Res> {
  factory $LoggedInUserCopyWith(
          LoggedInUser value, $Res Function(LoggedInUser) then) =
      _$LoggedInUserCopyWithImpl<$Res, LoggedInUser>;
  @useResult
  $Res call(
      {String name,
      String? username,
      @JsonKey(name: 'first_name', defaultValue: '') String? firstName,
      @JsonKey(name: 'last_name', defaultValue: '') String? lastName,
      @JsonKey(name: 'api_key', defaultValue: '') String apiKey,
      @JsonKey(name: 'api_secret', defaultValue: '') String apiSecret,
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
      @JsonKey(name: 'role_status') RoleStatus? roleStatus});

  $RoleStatusCopyWith<$Res>? get roleStatus;
}

/// @nodoc
class _$LoggedInUserCopyWithImpl<$Res, $Val extends LoggedInUser>
    implements $LoggedInUserCopyWith<$Res> {
  _$LoggedInUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoggedInUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? apiKey = null,
    Object? apiSecret = null,
    Object? email = freezed,
    Object? password = freezed,
    Object? roleProfileName = freezed,
    Object? userType = freezed,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? depoName = freezed,
    Object? plantName = freezed,
    Object? fullName = freezed,
    Object? transporter = freezed,
    Object? customer = freezed,
    Object? phone = freezed,
    Object? location = freezed,
    Object? bio = freezed,
    Object? mobileNo = freezed,
    Object? isOtpVerified = freezed,
    Object? roles = freezed,
    Object? roleStatus = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      apiSecret: null == apiSecret
          ? _value.apiSecret
          : apiSecret // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      roleProfileName: freezed == roleProfileName
          ? _value.roleProfileName
          : roleProfileName // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      depoName: freezed == depoName
          ? _value.depoName
          : depoName // ignore: cast_nullable_to_non_nullable
              as String?,
      plantName: freezed == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      transporter: freezed == transporter
          ? _value.transporter
          : transporter // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isOtpVerified: freezed == isOtpVerified
          ? _value.isOtpVerified
          : isOtpVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRole>?,
      roleStatus: freezed == roleStatus
          ? _value.roleStatus
          : roleStatus // ignore: cast_nullable_to_non_nullable
              as RoleStatus?,
    ) as $Val);
  }

  /// Create a copy of LoggedInUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoleStatusCopyWith<$Res>? get roleStatus {
    if (_value.roleStatus == null) {
      return null;
    }

    return $RoleStatusCopyWith<$Res>(_value.roleStatus!, (value) {
      return _then(_value.copyWith(roleStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoggedInUserImplCopyWith<$Res>
    implements $LoggedInUserCopyWith<$Res> {
  factory _$$LoggedInUserImplCopyWith(
          _$LoggedInUserImpl value, $Res Function(_$LoggedInUserImpl) then) =
      __$$LoggedInUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? username,
      @JsonKey(name: 'first_name', defaultValue: '') String? firstName,
      @JsonKey(name: 'last_name', defaultValue: '') String? lastName,
      @JsonKey(name: 'api_key', defaultValue: '') String apiKey,
      @JsonKey(name: 'api_secret', defaultValue: '') String apiSecret,
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
      @JsonKey(name: 'role_status') RoleStatus? roleStatus});

  @override
  $RoleStatusCopyWith<$Res>? get roleStatus;
}

/// @nodoc
class __$$LoggedInUserImplCopyWithImpl<$Res>
    extends _$LoggedInUserCopyWithImpl<$Res, _$LoggedInUserImpl>
    implements _$$LoggedInUserImplCopyWith<$Res> {
  __$$LoggedInUserImplCopyWithImpl(
      _$LoggedInUserImpl _value, $Res Function(_$LoggedInUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoggedInUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? username = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? apiKey = null,
    Object? apiSecret = null,
    Object? email = freezed,
    Object? password = freezed,
    Object? roleProfileName = freezed,
    Object? userType = freezed,
    Object? gender = freezed,
    Object? birthDate = freezed,
    Object? depoName = freezed,
    Object? plantName = freezed,
    Object? fullName = freezed,
    Object? transporter = freezed,
    Object? customer = freezed,
    Object? phone = freezed,
    Object? location = freezed,
    Object? bio = freezed,
    Object? mobileNo = freezed,
    Object? isOtpVerified = freezed,
    Object? roles = freezed,
    Object? roleStatus = freezed,
  }) {
    return _then(_$LoggedInUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      apiSecret: null == apiSecret
          ? _value.apiSecret
          : apiSecret // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      roleProfileName: freezed == roleProfileName
          ? _value.roleProfileName
          : roleProfileName // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      depoName: freezed == depoName
          ? _value.depoName
          : depoName // ignore: cast_nullable_to_non_nullable
              as String?,
      plantName: freezed == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      transporter: freezed == transporter
          ? _value.transporter
          : transporter // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      isOtpVerified: freezed == isOtpVerified
          ? _value.isOtpVerified
          : isOtpVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<UserRole>?,
      roleStatus: freezed == roleStatus
          ? _value.roleStatus
          : roleStatus // ignore: cast_nullable_to_non_nullable
              as RoleStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoggedInUserImpl extends _LoggedInUser {
  const _$LoggedInUserImpl(
      {required this.name,
      this.username,
      @JsonKey(name: 'first_name', defaultValue: '') this.firstName,
      @JsonKey(name: 'last_name', defaultValue: '') this.lastName,
      @JsonKey(name: 'api_key', defaultValue: '') required this.apiKey,
      @JsonKey(name: 'api_secret', defaultValue: '') required this.apiSecret,
      @JsonKey(name: 'email', defaultValue: '') this.email,
      @JsonKey(defaultValue: '') this.password,
      @JsonKey(name: 'role_profile_name', defaultValue: '')
      this.roleProfileName,
      @JsonKey(name: 'user_type') this.userType,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'birth_date') this.birthDate,
      @JsonKey(name: 'depo_name') this.depoName,
      @JsonKey(name: 'plant_name') this.plantName,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'transporter') this.transporter,
      @JsonKey(name: 'customer') this.customer,
      this.phone,
      this.location,
      this.bio,
      @JsonKey(name: 'mobile_no') this.mobileNo,
      @JsonKey(name: 'otp_verified') this.isOtpVerified,
      @JsonKey(name: 'roles') final List<UserRole>? roles,
      @JsonKey(name: 'role_status') this.roleStatus})
      : _roles = roles,
        super._();

  factory _$LoggedInUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoggedInUserImplFromJson(json);

  @override
  final String name;
  @override
  final String? username;
  @override
  @JsonKey(name: 'first_name', defaultValue: '')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name', defaultValue: '')
  final String? lastName;
  @override
  @JsonKey(name: 'api_key', defaultValue: '')
  final String apiKey;
  @override
  @JsonKey(name: 'api_secret', defaultValue: '')
  final String apiSecret;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  final String? email;
  @override
  @JsonKey(defaultValue: '')
  final String? password;
  @override
  @JsonKey(name: 'role_profile_name', defaultValue: '')
  final String? roleProfileName;
  @override
  @JsonKey(name: 'user_type')
  final String? userType;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  @override
  @JsonKey(name: 'birth_date')
  final String? birthDate;
  @override
  @JsonKey(name: 'depo_name')
  final String? depoName;
  @override
  @JsonKey(name: 'plant_name')
  final String? plantName;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'transporter')
  final String? transporter;
  @override
  @JsonKey(name: 'customer')
  final String? customer;
  @override
  final String? phone;
  @override
  final String? location;
  @override
  final String? bio;
  @override
  @JsonKey(name: 'mobile_no')
  final String? mobileNo;
  @override
  @JsonKey(name: 'otp_verified')
  final bool? isOtpVerified;
  final List<UserRole>? _roles;
  @override
  @JsonKey(name: 'roles')
  List<UserRole>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'role_status')
  final RoleStatus? roleStatus;

  @override
  String toString() {
    return 'LoggedInUser(name: $name, username: $username, firstName: $firstName, lastName: $lastName, apiKey: $apiKey, apiSecret: $apiSecret, email: $email, password: $password, roleProfileName: $roleProfileName, userType: $userType, gender: $gender, birthDate: $birthDate, depoName: $depoName, plantName: $plantName, fullName: $fullName, transporter: $transporter, customer: $customer, phone: $phone, location: $location, bio: $bio, mobileNo: $mobileNo, isOtpVerified: $isOtpVerified, roles: $roles, roleStatus: $roleStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedInUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.apiSecret, apiSecret) ||
                other.apiSecret == apiSecret) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.roleProfileName, roleProfileName) ||
                other.roleProfileName == roleProfileName) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.depoName, depoName) ||
                other.depoName == depoName) &&
            (identical(other.plantName, plantName) ||
                other.plantName == plantName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.transporter, transporter) ||
                other.transporter == transporter) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.isOtpVerified, isOtpVerified) ||
                other.isOtpVerified == isOtpVerified) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.roleStatus, roleStatus) ||
                other.roleStatus == roleStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        username,
        firstName,
        lastName,
        apiKey,
        apiSecret,
        email,
        password,
        roleProfileName,
        userType,
        gender,
        birthDate,
        depoName,
        plantName,
        fullName,
        transporter,
        customer,
        phone,
        location,
        bio,
        mobileNo,
        isOtpVerified,
        const DeepCollectionEquality().hash(_roles),
        roleStatus
      ]);

  /// Create a copy of LoggedInUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedInUserImplCopyWith<_$LoggedInUserImpl> get copyWith =>
      __$$LoggedInUserImplCopyWithImpl<_$LoggedInUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoggedInUserImplToJson(
      this,
    );
  }
}

abstract class _LoggedInUser extends LoggedInUser {
  const factory _LoggedInUser(
      {required final String name,
      final String? username,
      @JsonKey(name: 'first_name', defaultValue: '') final String? firstName,
      @JsonKey(name: 'last_name', defaultValue: '') final String? lastName,
      @JsonKey(name: 'api_key', defaultValue: '') required final String apiKey,
      @JsonKey(name: 'api_secret', defaultValue: '')
      required final String apiSecret,
      @JsonKey(name: 'email', defaultValue: '') final String? email,
      @JsonKey(defaultValue: '') final String? password,
      @JsonKey(name: 'role_profile_name', defaultValue: '')
      final String? roleProfileName,
      @JsonKey(name: 'user_type') final String? userType,
      @JsonKey(name: 'gender') final String? gender,
      @JsonKey(name: 'birth_date') final String? birthDate,
      @JsonKey(name: 'depo_name') final String? depoName,
      @JsonKey(name: 'plant_name') final String? plantName,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'transporter') final String? transporter,
      @JsonKey(name: 'customer') final String? customer,
      final String? phone,
      final String? location,
      final String? bio,
      @JsonKey(name: 'mobile_no') final String? mobileNo,
      @JsonKey(name: 'otp_verified') final bool? isOtpVerified,
      @JsonKey(name: 'roles') final List<UserRole>? roles,
      @JsonKey(name: 'role_status')
      final RoleStatus? roleStatus}) = _$LoggedInUserImpl;
  const _LoggedInUser._() : super._();

  factory _LoggedInUser.fromJson(Map<String, dynamic> json) =
      _$LoggedInUserImpl.fromJson;

  @override
  String get name;
  @override
  String? get username;
  @override
  @JsonKey(name: 'first_name', defaultValue: '')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name', defaultValue: '')
  String? get lastName;
  @override
  @JsonKey(name: 'api_key', defaultValue: '')
  String get apiKey;
  @override
  @JsonKey(name: 'api_secret', defaultValue: '')
  String get apiSecret;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  String? get email;
  @override
  @JsonKey(defaultValue: '')
  String? get password;
  @override
  @JsonKey(name: 'role_profile_name', defaultValue: '')
  String? get roleProfileName;
  @override
  @JsonKey(name: 'user_type')
  String? get userType;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'birth_date')
  String? get birthDate;
  @override
  @JsonKey(name: 'depo_name')
  String? get depoName;
  @override
  @JsonKey(name: 'plant_name')
  String? get plantName;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'transporter')
  String? get transporter;
  @override
  @JsonKey(name: 'customer')
  String? get customer;
  @override
  String? get phone;
  @override
  String? get location;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'mobile_no')
  String? get mobileNo;
  @override
  @JsonKey(name: 'otp_verified')
  bool? get isOtpVerified;
  @override
  @JsonKey(name: 'roles')
  List<UserRole>? get roles;
  @override
  @JsonKey(name: 'role_status')
  RoleStatus? get roleStatus;

  /// Create a copy of LoggedInUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoggedInUserImplCopyWith<_$LoggedInUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRole _$UserRoleFromJson(Map<String, dynamic> json) {
  return _UserRole.fromJson(json);
}

/// @nodoc
mixin _$UserRole {
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;

  /// Serializes this UserRole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoleCopyWith<UserRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleCopyWith<$Res> {
  factory $UserRoleCopyWith(UserRole value, $Res Function(UserRole) then) =
      _$UserRoleCopyWithImpl<$Res, UserRole>;
  @useResult
  $Res call({@JsonKey(name: 'role') String? role});
}

/// @nodoc
class _$UserRoleCopyWithImpl<$Res, $Val extends UserRole>
    implements $UserRoleCopyWith<$Res> {
  _$UserRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoleImplCopyWith<$Res>
    implements $UserRoleCopyWith<$Res> {
  factory _$$UserRoleImplCopyWith(
          _$UserRoleImpl value, $Res Function(_$UserRoleImpl) then) =
      __$$UserRoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'role') String? role});
}

/// @nodoc
class __$$UserRoleImplCopyWithImpl<$Res>
    extends _$UserRoleCopyWithImpl<$Res, _$UserRoleImpl>
    implements _$$UserRoleImplCopyWith<$Res> {
  __$$UserRoleImplCopyWithImpl(
      _$UserRoleImpl _value, $Res Function(_$UserRoleImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
  }) {
    return _then(_$UserRoleImpl(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoleImpl implements _UserRole {
  const _$UserRoleImpl({@JsonKey(name: 'role') this.role});

  factory _$UserRoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoleImplFromJson(json);

  @override
  @JsonKey(name: 'role')
  final String? role;

  @override
  String toString() {
    return 'UserRole(role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoleImpl &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role);

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoleImplCopyWith<_$UserRoleImpl> get copyWith =>
      __$$UserRoleImplCopyWithImpl<_$UserRoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoleImplToJson(
      this,
    );
  }
}

abstract class _UserRole implements UserRole {
  const factory _UserRole({@JsonKey(name: 'role') final String? role}) =
      _$UserRoleImpl;

  factory _UserRole.fromJson(Map<String, dynamic> json) =
      _$UserRoleImpl.fromJson;

  @override
  @JsonKey(name: 'role')
  String? get role;

  /// Create a copy of UserRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoleImplCopyWith<_$UserRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoleStatus _$RoleStatusFromJson(Map<String, dynamic> json) {
  return _RoleStatus.fromJson(json);
}

/// @nodoc
mixin _$RoleStatus {
  @JsonKey(name: 'Show Dashboards in Mobile App')
  int? get showDashboards => throw _privateConstructorUsedError;
  @JsonKey(name: 'Show Gate Entry in Mobile App')
  int? get showGateEntry => throw _privateConstructorUsedError;
  @JsonKey(name: 'Show Gate Exit in Mobile App')
  int? get showGateExit => throw _privateConstructorUsedError;
  @JsonKey(name: 'Show Logistic Request in Mobile App')
  int? get showLogisticRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'Show Transporter Confirmation in Mobile App')
  int? get showTransporterConfirmation => throw _privateConstructorUsedError;
  @JsonKey(name: 'Show Vehicle Reporting in Mobile App')
  int? get showVehicleReporting => throw _privateConstructorUsedError;
  @JsonKey(name: 'Show Loading Confirmation in Mobile App')
  int? get showLoadingConfirmation => throw _privateConstructorUsedError;
  @JsonKey(name: 'Show Proof of Delivery in Mobile App')
  int? get showpod => throw _privateConstructorUsedError;
  @JsonKey(name: 'Show Gate Management in Mobile App')
  int? get showgaetManagement => throw _privateConstructorUsedError;

  /// Serializes this RoleStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoleStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleStatusCopyWith<RoleStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleStatusCopyWith<$Res> {
  factory $RoleStatusCopyWith(
          RoleStatus value, $Res Function(RoleStatus) then) =
      _$RoleStatusCopyWithImpl<$Res, RoleStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Show Dashboards in Mobile App') int? showDashboards,
      @JsonKey(name: 'Show Gate Entry in Mobile App') int? showGateEntry,
      @JsonKey(name: 'Show Gate Exit in Mobile App') int? showGateExit,
      @JsonKey(name: 'Show Logistic Request in Mobile App')
      int? showLogisticRequest,
      @JsonKey(name: 'Show Transporter Confirmation in Mobile App')
      int? showTransporterConfirmation,
      @JsonKey(name: 'Show Vehicle Reporting in Mobile App')
      int? showVehicleReporting,
      @JsonKey(name: 'Show Loading Confirmation in Mobile App')
      int? showLoadingConfirmation,
      @JsonKey(name: 'Show Proof of Delivery in Mobile App') int? showpod,
      @JsonKey(name: 'Show Gate Management in Mobile App')
      int? showgaetManagement});
}

/// @nodoc
class _$RoleStatusCopyWithImpl<$Res, $Val extends RoleStatus>
    implements $RoleStatusCopyWith<$Res> {
  _$RoleStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoleStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showDashboards = freezed,
    Object? showGateEntry = freezed,
    Object? showGateExit = freezed,
    Object? showLogisticRequest = freezed,
    Object? showTransporterConfirmation = freezed,
    Object? showVehicleReporting = freezed,
    Object? showLoadingConfirmation = freezed,
    Object? showpod = freezed,
    Object? showgaetManagement = freezed,
  }) {
    return _then(_value.copyWith(
      showDashboards: freezed == showDashboards
          ? _value.showDashboards
          : showDashboards // ignore: cast_nullable_to_non_nullable
              as int?,
      showGateEntry: freezed == showGateEntry
          ? _value.showGateEntry
          : showGateEntry // ignore: cast_nullable_to_non_nullable
              as int?,
      showGateExit: freezed == showGateExit
          ? _value.showGateExit
          : showGateExit // ignore: cast_nullable_to_non_nullable
              as int?,
      showLogisticRequest: freezed == showLogisticRequest
          ? _value.showLogisticRequest
          : showLogisticRequest // ignore: cast_nullable_to_non_nullable
              as int?,
      showTransporterConfirmation: freezed == showTransporterConfirmation
          ? _value.showTransporterConfirmation
          : showTransporterConfirmation // ignore: cast_nullable_to_non_nullable
              as int?,
      showVehicleReporting: freezed == showVehicleReporting
          ? _value.showVehicleReporting
          : showVehicleReporting // ignore: cast_nullable_to_non_nullable
              as int?,
      showLoadingConfirmation: freezed == showLoadingConfirmation
          ? _value.showLoadingConfirmation
          : showLoadingConfirmation // ignore: cast_nullable_to_non_nullable
              as int?,
      showpod: freezed == showpod
          ? _value.showpod
          : showpod // ignore: cast_nullable_to_non_nullable
              as int?,
      showgaetManagement: freezed == showgaetManagement
          ? _value.showgaetManagement
          : showgaetManagement // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleStatusImplCopyWith<$Res>
    implements $RoleStatusCopyWith<$Res> {
  factory _$$RoleStatusImplCopyWith(
          _$RoleStatusImpl value, $Res Function(_$RoleStatusImpl) then) =
      __$$RoleStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Show Dashboards in Mobile App') int? showDashboards,
      @JsonKey(name: 'Show Gate Entry in Mobile App') int? showGateEntry,
      @JsonKey(name: 'Show Gate Exit in Mobile App') int? showGateExit,
      @JsonKey(name: 'Show Logistic Request in Mobile App')
      int? showLogisticRequest,
      @JsonKey(name: 'Show Transporter Confirmation in Mobile App')
      int? showTransporterConfirmation,
      @JsonKey(name: 'Show Vehicle Reporting in Mobile App')
      int? showVehicleReporting,
      @JsonKey(name: 'Show Loading Confirmation in Mobile App')
      int? showLoadingConfirmation,
      @JsonKey(name: 'Show Proof of Delivery in Mobile App') int? showpod,
      @JsonKey(name: 'Show Gate Management in Mobile App')
      int? showgaetManagement});
}

/// @nodoc
class __$$RoleStatusImplCopyWithImpl<$Res>
    extends _$RoleStatusCopyWithImpl<$Res, _$RoleStatusImpl>
    implements _$$RoleStatusImplCopyWith<$Res> {
  __$$RoleStatusImplCopyWithImpl(
      _$RoleStatusImpl _value, $Res Function(_$RoleStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoleStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showDashboards = freezed,
    Object? showGateEntry = freezed,
    Object? showGateExit = freezed,
    Object? showLogisticRequest = freezed,
    Object? showTransporterConfirmation = freezed,
    Object? showVehicleReporting = freezed,
    Object? showLoadingConfirmation = freezed,
    Object? showpod = freezed,
    Object? showgaetManagement = freezed,
  }) {
    return _then(_$RoleStatusImpl(
      showDashboards: freezed == showDashboards
          ? _value.showDashboards
          : showDashboards // ignore: cast_nullable_to_non_nullable
              as int?,
      showGateEntry: freezed == showGateEntry
          ? _value.showGateEntry
          : showGateEntry // ignore: cast_nullable_to_non_nullable
              as int?,
      showGateExit: freezed == showGateExit
          ? _value.showGateExit
          : showGateExit // ignore: cast_nullable_to_non_nullable
              as int?,
      showLogisticRequest: freezed == showLogisticRequest
          ? _value.showLogisticRequest
          : showLogisticRequest // ignore: cast_nullable_to_non_nullable
              as int?,
      showTransporterConfirmation: freezed == showTransporterConfirmation
          ? _value.showTransporterConfirmation
          : showTransporterConfirmation // ignore: cast_nullable_to_non_nullable
              as int?,
      showVehicleReporting: freezed == showVehicleReporting
          ? _value.showVehicleReporting
          : showVehicleReporting // ignore: cast_nullable_to_non_nullable
              as int?,
      showLoadingConfirmation: freezed == showLoadingConfirmation
          ? _value.showLoadingConfirmation
          : showLoadingConfirmation // ignore: cast_nullable_to_non_nullable
              as int?,
      showpod: freezed == showpod
          ? _value.showpod
          : showpod // ignore: cast_nullable_to_non_nullable
              as int?,
      showgaetManagement: freezed == showgaetManagement
          ? _value.showgaetManagement
          : showgaetManagement // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleStatusImpl extends _RoleStatus {
  const _$RoleStatusImpl(
      {@JsonKey(name: 'Show Dashboards in Mobile App') this.showDashboards,
      @JsonKey(name: 'Show Gate Entry in Mobile App') this.showGateEntry,
      @JsonKey(name: 'Show Gate Exit in Mobile App') this.showGateExit,
      @JsonKey(name: 'Show Logistic Request in Mobile App')
      this.showLogisticRequest,
      @JsonKey(name: 'Show Transporter Confirmation in Mobile App')
      this.showTransporterConfirmation,
      @JsonKey(name: 'Show Vehicle Reporting in Mobile App')
      this.showVehicleReporting,
      @JsonKey(name: 'Show Loading Confirmation in Mobile App')
      this.showLoadingConfirmation,
      @JsonKey(name: 'Show Proof of Delivery in Mobile App') this.showpod,
      @JsonKey(name: 'Show Gate Management in Mobile App')
      this.showgaetManagement})
      : super._();

  factory _$RoleStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleStatusImplFromJson(json);

  @override
  @JsonKey(name: 'Show Dashboards in Mobile App')
  final int? showDashboards;
  @override
  @JsonKey(name: 'Show Gate Entry in Mobile App')
  final int? showGateEntry;
  @override
  @JsonKey(name: 'Show Gate Exit in Mobile App')
  final int? showGateExit;
  @override
  @JsonKey(name: 'Show Logistic Request in Mobile App')
  final int? showLogisticRequest;
  @override
  @JsonKey(name: 'Show Transporter Confirmation in Mobile App')
  final int? showTransporterConfirmation;
  @override
  @JsonKey(name: 'Show Vehicle Reporting in Mobile App')
  final int? showVehicleReporting;
  @override
  @JsonKey(name: 'Show Loading Confirmation in Mobile App')
  final int? showLoadingConfirmation;
  @override
  @JsonKey(name: 'Show Proof of Delivery in Mobile App')
  final int? showpod;
  @override
  @JsonKey(name: 'Show Gate Management in Mobile App')
  final int? showgaetManagement;

  @override
  String toString() {
    return 'RoleStatus(showDashboards: $showDashboards, showGateEntry: $showGateEntry, showGateExit: $showGateExit, showLogisticRequest: $showLogisticRequest, showTransporterConfirmation: $showTransporterConfirmation, showVehicleReporting: $showVehicleReporting, showLoadingConfirmation: $showLoadingConfirmation, showpod: $showpod, showgaetManagement: $showgaetManagement)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleStatusImpl &&
            (identical(other.showDashboards, showDashboards) ||
                other.showDashboards == showDashboards) &&
            (identical(other.showGateEntry, showGateEntry) ||
                other.showGateEntry == showGateEntry) &&
            (identical(other.showGateExit, showGateExit) ||
                other.showGateExit == showGateExit) &&
            (identical(other.showLogisticRequest, showLogisticRequest) ||
                other.showLogisticRequest == showLogisticRequest) &&
            (identical(other.showTransporterConfirmation,
                    showTransporterConfirmation) ||
                other.showTransporterConfirmation ==
                    showTransporterConfirmation) &&
            (identical(other.showVehicleReporting, showVehicleReporting) ||
                other.showVehicleReporting == showVehicleReporting) &&
            (identical(
                    other.showLoadingConfirmation, showLoadingConfirmation) ||
                other.showLoadingConfirmation == showLoadingConfirmation) &&
            (identical(other.showpod, showpod) || other.showpod == showpod) &&
            (identical(other.showgaetManagement, showgaetManagement) ||
                other.showgaetManagement == showgaetManagement));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      showDashboards,
      showGateEntry,
      showGateExit,
      showLogisticRequest,
      showTransporterConfirmation,
      showVehicleReporting,
      showLoadingConfirmation,
      showpod,
      showgaetManagement);

  /// Create a copy of RoleStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleStatusImplCopyWith<_$RoleStatusImpl> get copyWith =>
      __$$RoleStatusImplCopyWithImpl<_$RoleStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleStatusImplToJson(
      this,
    );
  }
}

abstract class _RoleStatus extends RoleStatus {
  const factory _RoleStatus(
      {@JsonKey(name: 'Show Dashboards in Mobile App')
      final int? showDashboards,
      @JsonKey(name: 'Show Gate Entry in Mobile App') final int? showGateEntry,
      @JsonKey(name: 'Show Gate Exit in Mobile App') final int? showGateExit,
      @JsonKey(name: 'Show Logistic Request in Mobile App')
      final int? showLogisticRequest,
      @JsonKey(name: 'Show Transporter Confirmation in Mobile App')
      final int? showTransporterConfirmation,
      @JsonKey(name: 'Show Vehicle Reporting in Mobile App')
      final int? showVehicleReporting,
      @JsonKey(name: 'Show Loading Confirmation in Mobile App')
      final int? showLoadingConfirmation,
      @JsonKey(name: 'Show Proof of Delivery in Mobile App') final int? showpod,
      @JsonKey(name: 'Show Gate Management in Mobile App')
      final int? showgaetManagement}) = _$RoleStatusImpl;
  const _RoleStatus._() : super._();

  factory _RoleStatus.fromJson(Map<String, dynamic> json) =
      _$RoleStatusImpl.fromJson;

  @override
  @JsonKey(name: 'Show Dashboards in Mobile App')
  int? get showDashboards;
  @override
  @JsonKey(name: 'Show Gate Entry in Mobile App')
  int? get showGateEntry;
  @override
  @JsonKey(name: 'Show Gate Exit in Mobile App')
  int? get showGateExit;
  @override
  @JsonKey(name: 'Show Logistic Request in Mobile App')
  int? get showLogisticRequest;
  @override
  @JsonKey(name: 'Show Transporter Confirmation in Mobile App')
  int? get showTransporterConfirmation;
  @override
  @JsonKey(name: 'Show Vehicle Reporting in Mobile App')
  int? get showVehicleReporting;
  @override
  @JsonKey(name: 'Show Loading Confirmation in Mobile App')
  int? get showLoadingConfirmation;
  @override
  @JsonKey(name: 'Show Proof of Delivery in Mobile App')
  int? get showpod;
  @override
  @JsonKey(name: 'Show Gate Management in Mobile App')
  int? get showgaetManagement;

  /// Create a copy of RoleStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleStatusImplCopyWith<_$RoleStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
