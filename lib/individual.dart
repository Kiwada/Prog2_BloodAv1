import 'genotype.dart';

class Individual {
  final Genotype _genotype;
  final String? name;
  static int _count = 0;

  Individual(String genotype, [String? providedName])
      : _genotype = Genotype(genotype: genotype),
        name = providedName ?? generateName();

  static String generateName() {
    Individual._count += 1;
    return "Indiv${Individual._count}";
  }

  get genotype => _genotype;

  @override
  String toString() {
    return "$name(${_genotype.bloodType})";
  }
}