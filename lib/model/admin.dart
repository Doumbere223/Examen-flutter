class AdminModel {
  int id;
  String nom;
  String email;
  String password;
  String confirmpassword;

  AdminModel ({this.id, this.nom, this.email, this.password, this.confirmpassword});


  factory AdminModel.fromJson(Map<String, dynamic> json ) => AdminModel(
    id: json['id'],
    email: json['email'],
    password: json['password'],
    confirmpassword: json['confirmpassword']
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": password,
    "passWord": password,
    "confirmpassword": confirmpassword
  };
}