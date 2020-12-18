enum DogSize { SMALL, MEDIUM, LARGE, XLARGE }

enum DogBreed { BullDogs, Hounds, Labs, Poodles }

enum HairType { SHORT, LONG, CURLY, SHAGGY }

enum Temperament { Timid, Aggressive, Rambunctious, CalmAndCool }

class PetProfile {
  DogSize size;
  DogBreed breed;
  HairType hairType;
  Temperament personality;
  int age; // This needs to be updated as the time goes
  bool vaccination; // Rabies vaccination
  String specialAttention;
  String petName;
}
