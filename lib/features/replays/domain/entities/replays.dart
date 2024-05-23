import '../../../review_rate/domain/entities/rate.dart'; // Import the Rate model

class Replay {
  final int? id;
  final String? replay;
  final int? remarkId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  // final Rate? rate;

  Replay({
    required this.id,
    required this.replay,
    required this.remarkId,
    required this.createdAt,
    required this.updatedAt,
    // required this.rate,
  });
}
