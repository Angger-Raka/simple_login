import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable()
class Language extends Equatable {
  final String? code;
  final String? name;

  const Language({this.code, this.name});

  factory Language.fromJson(Map<String, dynamic> json) {
    return _$LanguageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  Language copyWith({
    String? code,
    String? name,
  }) {
    return Language(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [code, name];
}
