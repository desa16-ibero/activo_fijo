// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FixedAsset _$$_FixedAssetFromJson(Map<String, dynamic> json) =>
    _$_FixedAsset(
      activeNumUia: json['NUM_ACTIVO_UIA'] as String,
      description: json['DESCRIPCION'] as String,
      brand: json['MARCA'] as String,
      model: json['MODELO'] as String,
      serie: json['SERIE'] as String,
      reponsibleName: json['NOM_EMP_RESP'] as String,
      idRequest: json['ID_SOLICITUD'] as int,
      typeNumber: json['NUM_TIPO'] as String,
      imgSignature: json['imgSignature'] as String?,
      imgEvidence: json['imgEvidence'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_FixedAssetToJson(_$_FixedAsset instance) =>
    <String, dynamic>{
      'NUM_ACTIVO_UIA': instance.activeNumUia,
      'DESCRIPCION': instance.description,
      'MARCA': instance.brand,
      'MODELO': instance.model,
      'SERIE': instance.serie,
      'NOM_EMP_RESP': instance.reponsibleName,
      'ID_SOLICITUD': instance.idRequest,
      'NUM_TIPO': instance.typeNumber,
      'imgSignature': instance.imgSignature,
      'imgEvidence': instance.imgEvidence,
      'name': instance.name,
    };
