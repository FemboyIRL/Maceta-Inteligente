class Recomendation {
  final String type;
  final String recommendation;

  Recomendation({required this.type, required this.recommendation});

  factory Recomendation.fromMap(Map<String, dynamic> map) {
    return Recomendation(
      type: map['type'] as String,
      recommendation: map['recommendation'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'recommendation': recommendation,
    };
  }
}
