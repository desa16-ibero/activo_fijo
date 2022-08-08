import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixed_asset.freezed.dart';

part 'fixed_asset.g.dart';

@freezed
class FixedAsset with _$FixedAsset {
  const factory FixedAsset({
    @JsonKey(name: 'NUM_ACTIVO_UIA') required final String activeNumUia,
    @JsonKey(name: 'DESCRIPCION') required final String description,
    @JsonKey(name: 'MARCA') required final String brand,
    @JsonKey(name: 'MODELO') required final String model,
    @JsonKey(name: 'SERIE') required final String serie,
    @JsonKey(name: 'NOM_EMP_RESP') required final String reponsibleName,
    @JsonKey(name: 'ID_SOLICITUD') required final int idRequest,
    @JsonKey(name: 'NUM_TIPO') required final String typeNumber,
    String? imgSignature,
    String? imgEvidence,
    String? name,
  }) = _FixedAsset;

  factory FixedAsset.fromJson(Map<String, dynamic> json) =>
      _$FixedAssetFromJson(json);

  static mapToFixedAssetScreen(FixedAsset fixedAsset) {
    return {
      "Número UIA:": fixedAsset.activeNumUia,
      "Marca:": fixedAsset.brand,
      "Modelo:": fixedAsset.model,
      "Serie:": fixedAsset.serie,
      "Nombre del empleado resposable:": fixedAsset.reponsibleName,
      "Descripción:": fixedAsset.description,
    };
  }
}
