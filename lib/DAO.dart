import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'Usuario.dart';

class DAO {

  Future<Database>_recuperarBancoDados() async {
    final path = await getDatabasesPath();
    final localBD = join(path, "bancoIncoBit.db");

    var retorno = await openDatabase(
      localBD,
      version: 3,
      onCreate: (db, dbVersaoRecente) {
        String sql = "CREATE TABLE usuarios (""id INTEGER PRIMARY KEY AUTOINCREMENT, ""nome VARCHAR, dataNascimento VARCHAR, telefone VARCHAR, localizacao VARCHAR, email VARCHAR , senha VARCHAR)";
        db.execute(sql);
      }
    );

    print("Aberto " + retorno.isOpen.toString());
    return retorno;
  }

  Future<int> salvarDadosUsuario(String nome, String dataNasc, String telefone,
      String localizacao, String email, String senha) async {
    // CRIPTOGRAFIA DA SENHA:
    var bytesToHash = utf8.encode(senha);
    var converted = md5.convert(bytesToHash);

    print("MD5 SENHA: ${converted}");

    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario  = {
    "nome" : nome,
    "dataNascimento" : dataNasc,
    "telefone" : telefone,
    "localizacao" : localizacao,
    "email" : email,
    "senha" : converted.toString()
    };

    int id = await db.insert("usuarios", dadosUsuario);
    print("IDUser: ${id}");
    await db.close();
    return id;
  }

  listarUsuarios() async {
    Database db = await _recuperarBancoDados();
    String sql = "SELECT * FROM usuarios";

    List usuarios = await db.rawQuery(sql);

    for(var elm in usuarios) {
      print(" id: ${elm["id"]}   nome: ${elm["nome"]}   email: ${elm["email"]}   senha: ${elm["senha"]}");
    }
    await db.close();
  }

  Future<Usuario>listarUnicoUsuario(String email) async {
    Database db = await _recuperarBancoDados();
    Usuario user = new Usuario(-1, "", "", "", "", "", "");
    List usuario = await db.query(
        "usuarios",
        columns: ["id", "nome", "email", "senha"],
        where: "email = ?",
        whereArgs: [email]
    );

    if(!usuario.isEmpty) {
      user = new Usuario(
          usuario[0]["id"], usuario[0]["nome"], usuario[0]["dataNascimento"],
          usuario[0]["telefone"], usuario[0]["localizacao"], usuario[0]["email"], usuario[0]["senha"]);
    }

    print("user = ${user.toString()}");

    await db.close();
    return user;
  }

  Future<Usuario>listarUnicoUsuarioByID(int id) async {
    Database db = await _recuperarBancoDados();
    Usuario user = new Usuario(-1, "", "", "", "", "", "");
    List usuario = await db.query(
        "usuarios",
        columns: ["id", "nome", "email", "senha"],
        where: "id = ?",
        whereArgs: [id]
    );

    if(!usuario.isEmpty) {
      user = new Usuario(
          usuario[0]["id"], usuario[0]["nome"], usuario[0]["dataNasc"],
          usuario[0]["telefone"], usuario[0]["localizacao"], usuario[0]["email"], usuario[0]["senha"]);
    }

    print("user = ${user.toString()}");

    await db.close();
    return user;
  }

  // A PARTIR DAQUI
  updateUsuario(int id, String nome, String email, String senha) async {
    // CRIPTOGRAFIA DA SENHA:
    var bytesToHash = utf8.encode(senha);
    var converted = md5.convert(bytesToHash);

    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario  = {
      "nome" : nome,
      "email" : email,
      "senha" : converted.toString()
    };

    int retorno = await db.update(
      "usuarios", dadosUsuario,
      where: "id = ?",
      whereArgs: [id],
    );

    print("UPDATEUsuario: ${retorno}");
    await db.close();
  }

  updateUsuarioNome(int id, String nome) async {
    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario  = {
      "nome" : nome,
    };

    int retorno = await db.update(
      "usuarios", dadosUsuario,
      where: "id = ?",
      whereArgs: [id],
    );

    print("UPDATENomeUsuario: ${retorno}");
    await db.close();
  }

  updateUsuarioEmail(int id, String email) async {
    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario  = {
      "email" : email,
    };

    int retorno = await db.update(
      "usuarios", dadosUsuario,
      where: "id = ?",
      whereArgs: [id],
    );
    await db.close();
    print("UPDATEEmailUsuario: ${retorno}");
  }

  updateUsuarioSenha(int id, String senha) async {
    // CRIPTOGRAFIA DA SENHA:
    var bytesToHash = utf8.encode(senha);
    var converted = md5.convert(bytesToHash);

    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario  = {
      "senha" : converted,
    };

    int retorno = await db.update(
      "usuarios", dadosUsuario,
      where: "id = ?",
      whereArgs: [id],
    );
    await db.close();
    print("UPDATESenhaUsuario: ${retorno}");
  }

  excluirUsuario(int id) async {

    print("Excluir user: ${id}");
    Database db = await _recuperarBancoDados();
    int retorno = await db.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id],
    );
    print("Item excluido: ${retorno}");
    await db.close();
  }

  excluirComentario(int id) async {
    Database db = await _recuperarBancoDados();
    int retorno = await db.delete(
      "comentarios",
      where: "id = ?",
      whereArgs: [id],
    );
    await db.close();
    print("Item excluido: ${retorno}");
  }
}