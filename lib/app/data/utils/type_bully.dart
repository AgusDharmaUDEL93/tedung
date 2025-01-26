enum TypeBully {
  verbal(0, "Verbal"),
  nonVerbal(1, "Non Verbal"),
  professional(2, "Professional"),
  digital(3, "Digital");

  final int codes;
  final String name;

  const TypeBully(this.codes, this.name);
}
