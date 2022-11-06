class Usuario {

  int _id = 0;
  String _nome = "";
  String _dataNasc = "";
  String _telefone = "";
  String _localizacao = "";
  String _email = "";
  String _senha = "";

  Usuario(int id, String nome, String dataNasc, String telefone,
      String localizacao, String email, String senha) {
    this._id = id;
    this._nome = nome;
    this._dataNasc = dataNasc;
    this._telefone = telefone;
    this._localizacao = localizacao;
    this._email = email;
    this._senha = senha;
  }

  int getId() {
    return this._id;
  }

  String getNome() {
    return this._nome;
  }

  String getDataNasc() {
    return this._dataNasc;
  }

  String getTelefone() {
    return this._telefone;
  }

  String getLocalizacao() {
    return this._localizacao;
  }

  String getEmail() {
    return this._email;
  }

  String getSenha() {
    return this._senha;
  }


  void setId(int id) {
   this._id = id;
  }

  void setNome(String nome) {
    this._nome = nome;
  }

  void setDataNasc(String dataNasc) {
    this._dataNasc = dataNasc;
  }

  void setTelefone(String telefone) {
    this._telefone = telefone;
  }

  void setLocalizacao(String localizacao) {
    this._localizacao = localizacao;
  }

  void setEmail(String email) {
    this._email = email;
  }

  void setSenha(String senha) {
    this._senha = senha;
  }

}
