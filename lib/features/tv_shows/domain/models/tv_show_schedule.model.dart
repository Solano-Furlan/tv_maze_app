import 'package:equatable/equatable.dart';

class TvShowSchedule extends Equatable {
  const TvShowSchedule({
    required this.time,
    required this.days,
  });

  final String? time;
  final List<String>? days;

  @override
  List<Object?> get props => [
        time,
        days,
      ];
}
