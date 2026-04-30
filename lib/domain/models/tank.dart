class TankBatch {
  final int id;
  final String name;
  final int formulationId;
  final double volume;
  final double volumeRemaining;
  final DateTime preparedAt;
  final String? notes;

  const TankBatch({
    required this.id,
    required this.name,
    required this.formulationId,
    required this.volume,
    required this.volumeRemaining,
    required this.preparedAt,
    this.notes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TankBatch &&
          other.id == id &&
          other.name == name &&
          other.formulationId == formulationId &&
          other.volume == volume &&
          other.volumeRemaining == volumeRemaining &&
          other.preparedAt == preparedAt &&
          other.notes == notes);

  @override
  int get hashCode => Object.hash(
        id,
        name,
        formulationId,
        volume,
        volumeRemaining,
        preparedAt,
        notes,
      );

  @override
  String toString() =>
      'TankBatch(id: $id, name: $name, formulationId: $formulationId, '
      'volume: $volume, volumeRemaining: $volumeRemaining, '
      'preparedAt: $preparedAt, notes: $notes)';
}

class TankUsageEvent {
  final int id;
  final int tankBatchId;
  final String eventType;
  final double volume;
  final DateTime createdAt;
  final String? notes;

  const TankUsageEvent({
    required this.id,
    required this.tankBatchId,
    required this.eventType,
    required this.volume,
    required this.createdAt,
    this.notes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TankUsageEvent &&
          other.id == id &&
          other.tankBatchId == tankBatchId &&
          other.eventType == eventType &&
          other.volume == volume &&
          other.createdAt == createdAt &&
          other.notes == notes);

  @override
  int get hashCode => Object.hash(
        id,
        tankBatchId,
        eventType,
        volume,
        createdAt,
        notes,
      );

  @override
  String toString() =>
      'TankUsageEvent(id: $id, tankBatchId: $tankBatchId, '
      'eventType: $eventType, volume: $volume, createdAt: $createdAt, '
      'notes: $notes)';
}

class SubstanceUsed {
  final int id;
  final int substanceId;
  final double? weight;

  const SubstanceUsed({
    required this.id,
    required this.substanceId,
    this.weight,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubstanceUsed &&
          other.id == id &&
          other.substanceId == substanceId &&
          other.weight == weight);

  @override
  int get hashCode => Object.hash(id, substanceId, weight);

  @override
  String toString() =>
      'SubstanceUsed(id: $id, substanceId: $substanceId, weight: $weight)';
}
