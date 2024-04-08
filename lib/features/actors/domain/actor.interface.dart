import 'package:equatable/equatable.dart';

class IActor extends Equatable {
  const IActor({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.country,
    required this.birthday,
  });

  final String id;
  final String imageUrl;
  final String name;
  final String? country;
  final DateTime? birthday;

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        country,
        birthday,
      ];
}
