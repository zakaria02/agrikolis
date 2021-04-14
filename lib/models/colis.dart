class Colis {
  String userUID;
  String uid;
  String client;
  double poids;
  double prix;

  Colis({
    this.userUID,
    this.uid,
    this.client,
    this.poids,
    this.prix,
  });

  @override
  String toString() {
    return "Num Colis : $uid\nClient : $client\nPoids : $poids kg\nPrix : $prix €";
  }

  Map<String, dynamic> toJson() => {
        'client': this.client,
        'poids': this.poids,
        'prix': this.prix,
      };
}
