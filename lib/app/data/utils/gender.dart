enum Gender {
  male(0, "Laki-laki"),
  female(1, "Perempuan");

  final int codes;
  final String name;

  const Gender(this.codes, this.name);
}
