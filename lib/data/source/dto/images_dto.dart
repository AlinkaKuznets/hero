import 'package:hero/domain/model/images.dart';

class ImagesDto {
  final String xs;
  final String sm;
  final String md;
  final String lg;

  ImagesDto({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  Images toDomain() => Images(xs: xs, sm: sm, md: md, lg: lg);

  factory ImagesDto.fromJson(Map<String, dynamic> json) {
    return ImagesDto(
      xs: json['xs'],
      sm: json['sm'],
      md: json['md'],
      lg: json['lg'],
    );
  }
}
