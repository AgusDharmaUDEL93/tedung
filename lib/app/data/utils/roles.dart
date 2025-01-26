enum Role {
  worker(0, "Pekerja"),
  executive(1, "Eksekutif"),
  psychologist(2, "Psikolog");

  final int codes;
  final String name;

  const Role(this.codes, this.name);
}
