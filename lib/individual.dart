import 'Genotype.dart';

class Individual {
  final Genotype _genotype;
  final String? name;
  static int _number = 0;

  Individual(String genotype, [String? providedName])
      : _genotype = Genotype(genotype: genotype),
        name = providedName ?? generateName();

  static String generateName() {
    Individual._number += 1;
    return "Indiv${Individual._number}";
  }

  get genotype => _genotype;

  @override
  String toString() {
    return "$name(${_genotype.bloodType})";
  }
}