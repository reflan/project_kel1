class Dosen {
  String? dsnNidn;
  String? dsnNama;
  String? dsnAlamat;
  String? dsnGol;
  String? dsnProdi;

  Dosen({
    this.dsnNidn,
    this.dsnNama,
    this.dsnAlamat,
    this.dsnGol,
    this.dsnProdi,
  });

  factory Dosen.fromJson(Map<String, dynamic> json) => Dosen(
        dsnNidn: json['dsnNidn'],
        dsnNama: json['dsnNama'],
        dsnAlamat: json['dsnAlamat'],
        dsnGol: json['dsnGol'],
        dsnProdi: json['dsnProdi'],
      );

  Map<String, dynamic> toJson() => {
        'dsnNidn': this.dsnNidn,
        'dsnNama': this.dsnNama,
        'dsnAlamat': this.dsnAlamat,
        'dsnGol': this.dsnGol,
        'dsnProdi': this.dsnProdi,
      };
}
