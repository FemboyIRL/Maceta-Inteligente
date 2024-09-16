class Plant {
  int id;
  String nombreComun;
  List<String> nombreCientifico;
  List<String> otrosNombres;
  String ciclo;
  String cantidadRiego;
  List<String> luzNecesaria;
  DefaultImage imagenPredeterminada;

  Plant({
    required this.id,
    required this.nombreComun,
    required this.nombreCientifico,
    required this.otrosNombres,
    required this.ciclo,
    required this.cantidadRiego,
    required this.luzNecesaria,
    required this.imagenPredeterminada,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      id: json['id'],
      nombreComun: json['common_name'],
      nombreCientifico: List<String>.from(json['scientific_name']),
      otrosNombres: List<String>.from(json['other_name']),
      ciclo: json['cycle'],
      cantidadRiego: json['watering'],
      luzNecesaria: List<String>.from(json['sunlight']),
      imagenPredeterminada: DefaultImage.fromJson(json['default_image']),
    );
  }
}

class DefaultImage {
  int licencia;
  String nombreLicencia;
  String urlLicencia;
  String urlOriginal;
  String urlRegular;
  String urlMediana;
  String urlPequena;
  String miniatura;

  DefaultImage({
    required this.licencia,
    required this.nombreLicencia,
    required this.urlLicencia,
    required this.urlOriginal,
    required this.urlRegular,
    required this.urlMediana,
    required this.urlPequena,
    required this.miniatura,
  });

  factory DefaultImage.fromJson(Map<String, dynamic> json) {
    return DefaultImage(
      licencia: json['license'],
      nombreLicencia: json['license_name'],
      urlLicencia: json['license_url'],
      urlOriginal: json['original_url'],
      urlRegular: json['regular_url'],
      urlMediana: json['medium_url'],
      urlPequena: json['small_url'],
      miniatura: json['thumbnail'],
    );
  }
}
