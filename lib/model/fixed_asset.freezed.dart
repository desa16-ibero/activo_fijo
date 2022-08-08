// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fixed_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FixedAsset _$FixedAssetFromJson(Map<String, dynamic> json) {
  return _FixedAsset.fromJson(json);
}

/// @nodoc
mixin _$FixedAsset {
  @JsonKey(name: 'NUM_ACTIVO_UIA')
  String get activeNumUia => throw _privateConstructorUsedError;
  @JsonKey(name: 'DESCRIPCION')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'MARCA')
  String get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'MODELO')
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'SERIE')
  String get serie => throw _privateConstructorUsedError;
  @JsonKey(name: 'NOM_EMP_RESP')
  String get reponsibleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID_SOLICITUD')
  int get idRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'NUM_TIPO')
  String get typeNumber => throw _privateConstructorUsedError;
  String? get imgSignature => throw _privateConstructorUsedError;
  String? get imgEvidence => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FixedAssetCopyWith<FixedAsset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FixedAssetCopyWith<$Res> {
  factory $FixedAssetCopyWith(
          FixedAsset value, $Res Function(FixedAsset) then) =
      _$FixedAssetCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'NUM_ACTIVO_UIA') String activeNumUia,
      @JsonKey(name: 'DESCRIPCION') String description,
      @JsonKey(name: 'MARCA') String brand,
      @JsonKey(name: 'MODELO') String model,
      @JsonKey(name: 'SERIE') String serie,
      @JsonKey(name: 'NOM_EMP_RESP') String reponsibleName,
      @JsonKey(name: 'ID_SOLICITUD') int idRequest,
      @JsonKey(name: 'NUM_TIPO') String typeNumber,
      String? imgSignature,
      String? imgEvidence,
      String? name});
}

/// @nodoc
class _$FixedAssetCopyWithImpl<$Res> implements $FixedAssetCopyWith<$Res> {
  _$FixedAssetCopyWithImpl(this._value, this._then);

  final FixedAsset _value;
  // ignore: unused_field
  final $Res Function(FixedAsset) _then;

  @override
  $Res call({
    Object? activeNumUia = freezed,
    Object? description = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? serie = freezed,
    Object? reponsibleName = freezed,
    Object? idRequest = freezed,
    Object? typeNumber = freezed,
    Object? imgSignature = freezed,
    Object? imgEvidence = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      activeNumUia: activeNumUia == freezed
          ? _value.activeNumUia
          : activeNumUia // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      serie: serie == freezed
          ? _value.serie
          : serie // ignore: cast_nullable_to_non_nullable
              as String,
      reponsibleName: reponsibleName == freezed
          ? _value.reponsibleName
          : reponsibleName // ignore: cast_nullable_to_non_nullable
              as String,
      idRequest: idRequest == freezed
          ? _value.idRequest
          : idRequest // ignore: cast_nullable_to_non_nullable
              as int,
      typeNumber: typeNumber == freezed
          ? _value.typeNumber
          : typeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      imgSignature: imgSignature == freezed
          ? _value.imgSignature
          : imgSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      imgEvidence: imgEvidence == freezed
          ? _value.imgEvidence
          : imgEvidence // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FixedAssetCopyWith<$Res>
    implements $FixedAssetCopyWith<$Res> {
  factory _$$_FixedAssetCopyWith(
          _$_FixedAsset value, $Res Function(_$_FixedAsset) then) =
      __$$_FixedAssetCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'NUM_ACTIVO_UIA') String activeNumUia,
      @JsonKey(name: 'DESCRIPCION') String description,
      @JsonKey(name: 'MARCA') String brand,
      @JsonKey(name: 'MODELO') String model,
      @JsonKey(name: 'SERIE') String serie,
      @JsonKey(name: 'NOM_EMP_RESP') String reponsibleName,
      @JsonKey(name: 'ID_SOLICITUD') int idRequest,
      @JsonKey(name: 'NUM_TIPO') String typeNumber,
      String? imgSignature,
      String? imgEvidence,
      String? name});
}

/// @nodoc
class __$$_FixedAssetCopyWithImpl<$Res> extends _$FixedAssetCopyWithImpl<$Res>
    implements _$$_FixedAssetCopyWith<$Res> {
  __$$_FixedAssetCopyWithImpl(
      _$_FixedAsset _value, $Res Function(_$_FixedAsset) _then)
      : super(_value, (v) => _then(v as _$_FixedAsset));

  @override
  _$_FixedAsset get _value => super._value as _$_FixedAsset;

  @override
  $Res call({
    Object? activeNumUia = freezed,
    Object? description = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? serie = freezed,
    Object? reponsibleName = freezed,
    Object? idRequest = freezed,
    Object? typeNumber = freezed,
    Object? imgSignature = freezed,
    Object? imgEvidence = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_FixedAsset(
      activeNumUia: activeNumUia == freezed
          ? _value.activeNumUia
          : activeNumUia // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      serie: serie == freezed
          ? _value.serie
          : serie // ignore: cast_nullable_to_non_nullable
              as String,
      reponsibleName: reponsibleName == freezed
          ? _value.reponsibleName
          : reponsibleName // ignore: cast_nullable_to_non_nullable
              as String,
      idRequest: idRequest == freezed
          ? _value.idRequest
          : idRequest // ignore: cast_nullable_to_non_nullable
              as int,
      typeNumber: typeNumber == freezed
          ? _value.typeNumber
          : typeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      imgSignature: imgSignature == freezed
          ? _value.imgSignature
          : imgSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      imgEvidence: imgEvidence == freezed
          ? _value.imgEvidence
          : imgEvidence // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FixedAsset implements _FixedAsset {
  const _$_FixedAsset(
      {@JsonKey(name: 'NUM_ACTIVO_UIA') required this.activeNumUia,
      @JsonKey(name: 'DESCRIPCION') required this.description,
      @JsonKey(name: 'MARCA') required this.brand,
      @JsonKey(name: 'MODELO') required this.model,
      @JsonKey(name: 'SERIE') required this.serie,
      @JsonKey(name: 'NOM_EMP_RESP') required this.reponsibleName,
      @JsonKey(name: 'ID_SOLICITUD') required this.idRequest,
      @JsonKey(name: 'NUM_TIPO') required this.typeNumber,
      this.imgSignature,
      this.imgEvidence,
      this.name});

  factory _$_FixedAsset.fromJson(Map<String, dynamic> json) =>
      _$$_FixedAssetFromJson(json);

  @override
  @JsonKey(name: 'NUM_ACTIVO_UIA')
  final String activeNumUia;
  @override
  @JsonKey(name: 'DESCRIPCION')
  final String description;
  @override
  @JsonKey(name: 'MARCA')
  final String brand;
  @override
  @JsonKey(name: 'MODELO')
  final String model;
  @override
  @JsonKey(name: 'SERIE')
  final String serie;
  @override
  @JsonKey(name: 'NOM_EMP_RESP')
  final String reponsibleName;
  @override
  @JsonKey(name: 'ID_SOLICITUD')
  final int idRequest;
  @override
  @JsonKey(name: 'NUM_TIPO')
  final String typeNumber;
  @override
  final String? imgSignature;
  @override
  final String? imgEvidence;
  @override
  final String? name;

  @override
  String toString() {
    return 'FixedAsset(activeNumUia: $activeNumUia, description: $description, brand: $brand, model: $model, serie: $serie, reponsibleName: $reponsibleName, idRequest: $idRequest, typeNumber: $typeNumber, imgSignature: $imgSignature, imgEvidence: $imgEvidence, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FixedAsset &&
            const DeepCollectionEquality()
                .equals(other.activeNumUia, activeNumUia) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality().equals(other.model, model) &&
            const DeepCollectionEquality().equals(other.serie, serie) &&
            const DeepCollectionEquality()
                .equals(other.reponsibleName, reponsibleName) &&
            const DeepCollectionEquality().equals(other.idRequest, idRequest) &&
            const DeepCollectionEquality()
                .equals(other.typeNumber, typeNumber) &&
            const DeepCollectionEquality()
                .equals(other.imgSignature, imgSignature) &&
            const DeepCollectionEquality()
                .equals(other.imgEvidence, imgEvidence) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activeNumUia),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(model),
      const DeepCollectionEquality().hash(serie),
      const DeepCollectionEquality().hash(reponsibleName),
      const DeepCollectionEquality().hash(idRequest),
      const DeepCollectionEquality().hash(typeNumber),
      const DeepCollectionEquality().hash(imgSignature),
      const DeepCollectionEquality().hash(imgEvidence),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_FixedAssetCopyWith<_$_FixedAsset> get copyWith =>
      __$$_FixedAssetCopyWithImpl<_$_FixedAsset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FixedAssetToJson(this);
  }
}

abstract class _FixedAsset implements FixedAsset {
  const factory _FixedAsset(
      {@JsonKey(name: 'NUM_ACTIVO_UIA') required final String activeNumUia,
      @JsonKey(name: 'DESCRIPCION') required final String description,
      @JsonKey(name: 'MARCA') required final String brand,
      @JsonKey(name: 'MODELO') required final String model,
      @JsonKey(name: 'SERIE') required final String serie,
      @JsonKey(name: 'NOM_EMP_RESP') required final String reponsibleName,
      @JsonKey(name: 'ID_SOLICITUD') required final int idRequest,
      @JsonKey(name: 'NUM_TIPO') required final String typeNumber,
      final String? imgSignature,
      final String? imgEvidence,
      final String? name}) = _$_FixedAsset;

  factory _FixedAsset.fromJson(Map<String, dynamic> json) =
      _$_FixedAsset.fromJson;

  @override
  @JsonKey(name: 'NUM_ACTIVO_UIA')
  String get activeNumUia;
  @override
  @JsonKey(name: 'DESCRIPCION')
  String get description;
  @override
  @JsonKey(name: 'MARCA')
  String get brand;
  @override
  @JsonKey(name: 'MODELO')
  String get model;
  @override
  @JsonKey(name: 'SERIE')
  String get serie;
  @override
  @JsonKey(name: 'NOM_EMP_RESP')
  String get reponsibleName;
  @override
  @JsonKey(name: 'ID_SOLICITUD')
  int get idRequest;
  @override
  @JsonKey(name: 'NUM_TIPO')
  String get typeNumber;
  @override
  String? get imgSignature;
  @override
  String? get imgEvidence;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_FixedAssetCopyWith<_$_FixedAsset> get copyWith =>
      throw _privateConstructorUsedError;
}
