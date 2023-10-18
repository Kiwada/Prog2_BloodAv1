class Genotype {
  final String genotype;

  static const listOfGenotype = [
    "AA",
    "Ai",
    "BB",
    "Bi",
    "AB",
    "ii",
  ];
  static const _listOfAlleles = {
    "AA": ["A", "A"],
    "Ai": ["A", "i"],
    "BB": ["B", "B"],
    "Bi": ["B", "i"],
    "AB": ["A", "B"],
    "ii": ["i", "i"],
  };
  static const _bloodTypeAndGenotype = <String, List<String>>{
    "A": ["AA", "Ai"],
    "B": ["BB", "Bi"],
    "AB": ["AB"],
    "O": ["ii"],
  };
  static const _bloodTypeAndAgglutinogens = <String, List<String>>{
    "A": ["A"],
    "B": ["B"],
    "AB": ["A", "B"],
    "O": [],
  };
  static const _associatedAgglutininGenotype = <String, List<String>>{
    "AA": ["B"],
    "Ai": ["B"],
    "BB": ["A"],
    "Bi": ["A"],
    "AB": [],
    "ii": ["A", "B"],
  };
  static const _bloodCompatibility = <String, List<List>>{
    "A": [
      ["A", "AB"],
      ["A", "O"]
    ],
    "B": [
      ["B", "AB"],
      ["B", "O"]
    ],
    "AB": [
      ["AB"],
      ["A", "B", "AB", "O"]
    ],
    "O": [
      ["A", "B", "AB", "O"],
      ["o"]
    ]
  };

  Genotype({required this.genotype}) {
    if (!listOfGenotype.contains(genotype)) {
      throw ArgumentError(
          'O genótipo deve estar entre esses: "AA", "Ai", "BB", "Bi", "AB", "ii"');
    }
  }

  get alleles {
    return _listOfAlleles[genotype];
  }

  get bloodType {
    for (var key in _bloodTypeAndGenotype.keys) {
      if (_bloodTypeAndGenotype[key]?.contains(genotype) == true) {
        return key;
      }
    }
  }

  get agglutinogens {
    return _bloodTypeAndAgglutinogens[bloodType]?.toSet().toList();
  }

  get agglutinins {
    return _associatedAgglutininGenotype[genotype]?.toSet().toList();
  }

  List offsprings(Genotype genotype2) {
    List temp = [];
    List gametes = genotype.split("");
    List gametes2 = genotype2.genotype.split("");
    for (var gamete in gametes) {
      for (var gamete2 in gametes2) {
        List t = [gamete, gamete2];
        t.sort();
        temp.add(t.join(""));
      }
    }
    return temp.toSet().toList();
  }

  bool compatible(Genotype genotype2) {
    final bloodTypeCompatibility = _bloodCompatibility[bloodType];
    if (bloodTypeCompatibility != null &&
        bloodTypeCompatibility[0].contains(genotype2.bloodType)) {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return genotype;
  }
}
