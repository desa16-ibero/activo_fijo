// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  int? get account => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get digit => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get keyCareer => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get career => throw _privateConstructorUsedError;
  @HiveField(5)
  int? get keyPlan => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get namePlan => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get hashKiosk => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get password => throw _privateConstructorUsedError;
  @HiveField(9)
  bool? get saveSession => throw _privateConstructorUsedError;
  @HiveField(10)
  int? get profileID => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get profile => throw _privateConstructorUsedError;
  @HiveField(12)
  DateTime? get lastUpdatePassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) int? account,
      @HiveField(1) String? digit,
      @HiveField(2) String? name,
      @HiveField(3) int? keyCareer,
      @HiveField(4) String? career,
      @HiveField(5) int? keyPlan,
      @HiveField(6) String? namePlan,
      @HiveField(7) String? hashKiosk,
      @HiveField(8) String? password,
      @HiveField(9) bool? saveSession,
      @HiveField(10) int? profileID,
      @HiveField(11) String? profile,
      @HiveField(12) DateTime? lastUpdatePassword});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? digit = freezed,
    Object? name = freezed,
    Object? keyCareer = freezed,
    Object? career = freezed,
    Object? keyPlan = freezed,
    Object? namePlan = freezed,
    Object? hashKiosk = freezed,
    Object? password = freezed,
    Object? saveSession = freezed,
    Object? profileID = freezed,
    Object? profile = freezed,
    Object? lastUpdatePassword = freezed,
  }) {
    return _then(_value.copyWith(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as int?,
      digit: freezed == digit
          ? _value.digit
          : digit // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      keyCareer: freezed == keyCareer
          ? _value.keyCareer
          : keyCareer // ignore: cast_nullable_to_non_nullable
              as int?,
      career: freezed == career
          ? _value.career
          : career // ignore: cast_nullable_to_non_nullable
              as String?,
      keyPlan: freezed == keyPlan
          ? _value.keyPlan
          : keyPlan // ignore: cast_nullable_to_non_nullable
              as int?,
      namePlan: freezed == namePlan
          ? _value.namePlan
          : namePlan // ignore: cast_nullable_to_non_nullable
              as String?,
      hashKiosk: freezed == hashKiosk
          ? _value.hashKiosk
          : hashKiosk // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      saveSession: freezed == saveSession
          ? _value.saveSession
          : saveSession // ignore: cast_nullable_to_non_nullable
              as bool?,
      profileID: freezed == profileID
          ? _value.profileID
          : profileID // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatePassword: freezed == lastUpdatePassword
          ? _value.lastUpdatePassword
          : lastUpdatePassword // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? account,
      @HiveField(1) String? digit,
      @HiveField(2) String? name,
      @HiveField(3) int? keyCareer,
      @HiveField(4) String? career,
      @HiveField(5) int? keyPlan,
      @HiveField(6) String? namePlan,
      @HiveField(7) String? hashKiosk,
      @HiveField(8) String? password,
      @HiveField(9) bool? saveSession,
      @HiveField(10) int? profileID,
      @HiveField(11) String? profile,
      @HiveField(12) DateTime? lastUpdatePassword});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? digit = freezed,
    Object? name = freezed,
    Object? keyCareer = freezed,
    Object? career = freezed,
    Object? keyPlan = freezed,
    Object? namePlan = freezed,
    Object? hashKiosk = freezed,
    Object? password = freezed,
    Object? saveSession = freezed,
    Object? profileID = freezed,
    Object? profile = freezed,
    Object? lastUpdatePassword = freezed,
  }) {
    return _then(_$_User(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as int?,
      digit: freezed == digit
          ? _value.digit
          : digit // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      keyCareer: freezed == keyCareer
          ? _value.keyCareer
          : keyCareer // ignore: cast_nullable_to_non_nullable
              as int?,
      career: freezed == career
          ? _value.career
          : career // ignore: cast_nullable_to_non_nullable
              as String?,
      keyPlan: freezed == keyPlan
          ? _value.keyPlan
          : keyPlan // ignore: cast_nullable_to_non_nullable
              as int?,
      namePlan: freezed == namePlan
          ? _value.namePlan
          : namePlan // ignore: cast_nullable_to_non_nullable
              as String?,
      hashKiosk: freezed == hashKiosk
          ? _value.hashKiosk
          : hashKiosk // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      saveSession: freezed == saveSession
          ? _value.saveSession
          : saveSession // ignore: cast_nullable_to_non_nullable
              as bool?,
      profileID: freezed == profileID
          ? _value.profileID
          : profileID // ignore: cast_nullable_to_non_nullable
              as int?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatePassword: freezed == lastUpdatePassword
          ? _value.lastUpdatePassword
          : lastUpdatePassword // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'UserAdapter')
class _$_User implements _User {
  const _$_User(
      {@HiveField(0) this.account,
      @HiveField(1) this.digit,
      @HiveField(2) this.name,
      @HiveField(3) this.keyCareer,
      @HiveField(4) this.career,
      @HiveField(5) this.keyPlan,
      @HiveField(6) this.namePlan,
      @HiveField(7) this.hashKiosk,
      @HiveField(8) this.password,
      @HiveField(9) this.saveSession,
      @HiveField(10) this.profileID,
      @HiveField(11) this.profile,
      @HiveField(12) this.lastUpdatePassword});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @HiveField(0)
  final int? account;
  @override
  @HiveField(1)
  final String? digit;
  @override
  @HiveField(2)
  final String? name;
  @override
  @HiveField(3)
  final int? keyCareer;
  @override
  @HiveField(4)
  final String? career;
  @override
  @HiveField(5)
  final int? keyPlan;
  @override
  @HiveField(6)
  final String? namePlan;
  @override
  @HiveField(7)
  final String? hashKiosk;
  @override
  @HiveField(8)
  final String? password;
  @override
  @HiveField(9)
  final bool? saveSession;
  @override
  @HiveField(10)
  final int? profileID;
  @override
  @HiveField(11)
  final String? profile;
  @override
  @HiveField(12)
  final DateTime? lastUpdatePassword;

  @override
  String toString() {
    return 'User(account: $account, digit: $digit, name: $name, keyCareer: $keyCareer, career: $career, keyPlan: $keyPlan, namePlan: $namePlan, hashKiosk: $hashKiosk, password: $password, saveSession: $saveSession, profileID: $profileID, profile: $profile, lastUpdatePassword: $lastUpdatePassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.digit, digit) || other.digit == digit) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.keyCareer, keyCareer) ||
                other.keyCareer == keyCareer) &&
            (identical(other.career, career) || other.career == career) &&
            (identical(other.keyPlan, keyPlan) || other.keyPlan == keyPlan) &&
            (identical(other.namePlan, namePlan) ||
                other.namePlan == namePlan) &&
            (identical(other.hashKiosk, hashKiosk) ||
                other.hashKiosk == hashKiosk) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.saveSession, saveSession) ||
                other.saveSession == saveSession) &&
            (identical(other.profileID, profileID) ||
                other.profileID == profileID) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.lastUpdatePassword, lastUpdatePassword) ||
                other.lastUpdatePassword == lastUpdatePassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      account,
      digit,
      name,
      keyCareer,
      career,
      keyPlan,
      namePlan,
      hashKiosk,
      password,
      saveSession,
      profileID,
      profile,
      lastUpdatePassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@HiveField(0) final int? account,
      @HiveField(1) final String? digit,
      @HiveField(2) final String? name,
      @HiveField(3) final int? keyCareer,
      @HiveField(4) final String? career,
      @HiveField(5) final int? keyPlan,
      @HiveField(6) final String? namePlan,
      @HiveField(7) final String? hashKiosk,
      @HiveField(8) final String? password,
      @HiveField(9) final bool? saveSession,
      @HiveField(10) final int? profileID,
      @HiveField(11) final String? profile,
      @HiveField(12) final DateTime? lastUpdatePassword}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @HiveField(0)
  int? get account;
  @override
  @HiveField(1)
  String? get digit;
  @override
  @HiveField(2)
  String? get name;
  @override
  @HiveField(3)
  int? get keyCareer;
  @override
  @HiveField(4)
  String? get career;
  @override
  @HiveField(5)
  int? get keyPlan;
  @override
  @HiveField(6)
  String? get namePlan;
  @override
  @HiveField(7)
  String? get hashKiosk;
  @override
  @HiveField(8)
  String? get password;
  @override
  @HiveField(9)
  bool? get saveSession;
  @override
  @HiveField(10)
  int? get profileID;
  @override
  @HiveField(11)
  String? get profile;
  @override
  @HiveField(12)
  DateTime? get lastUpdatePassword;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
