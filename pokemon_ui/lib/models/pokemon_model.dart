class PokemonModel {
  int? id, num, candyCount;
  double? height, weight, spawnChance, avgSpawns, spawnTime;
  String? name, img, candy, egg;
  List<String>? weeknesses, type;
  List<int>? multipliers;

  PokemonModel({
    this.avgSpawns,
    this.candy,
    this.candyCount,
    this.egg,
    this.height,
    this.id,
    this.img,
    this.multipliers,
    this.name,
    this.num,
    this.spawnChance,
    this.spawnTime,
    this.type,
    this.weeknesses,
    this.weight,
  });

  PokemonModel fromMap(map) {
    return PokemonModel(
      name: map['name'],
      avgSpawns: map['avgSpawns'],
      candy: map['candy'],
      egg: map['egg'],
      height: map['height'],
      id: map['id'],
      img: map['img'],
      multipliers: map['multipliers'],
      num: int.parse(map['num']),
      spawnChance: map['spawnChance'],
      spawnTime: map['spawnTime'],
      type: map['type'],
      weeknesses: map['weeknesses'],
      weight: double.parse(map['weight'].substring(0, -2)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'num': num,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candy_count': candyCount,
      'egg': egg,
      'spawnChance': spawnChance,
      'avgSpawns': avgSpawns,
      'spawnTime': spawnTime,
      'multipliers': multipliers,
      'weeknesses': weeknesses,
    };
  }
}
