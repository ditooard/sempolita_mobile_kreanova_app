class RecordData {
  final String boxId;
  final int weight;
  final int length;
  final String recordedAt;
  final int id;

  RecordData({
    required this.boxId,
    required this.weight,
    required this.length,
    required this.recordedAt,
    required this.id,
  });

  factory RecordData.fromJson(Map<String, dynamic> json) {
    return RecordData(
      boxId: json['box_id'],
      weight: json['weight'],
      length: json['length'],
      recordedAt: json['recorded_at'],
      id: json['id'],
    );
  }
}
