import 'package:cloud_firestore/cloud_firestore.dart';

import '../objetos/doenca.dart';
import '../recursos/Variaveis.dart';

class DoencaService {

  static Future<List<Doenca>> buscaDoencas(String sinaisSearch, String especieSearch, bool buscaCompleta) async {

    //print("sinal: " + sinaisSearch + " especie: " + especieSearch + " completa: " + buscaCompleta.toString());

    List<Doenca> _doencas = [];

    // Referência à coleção "doencas"
    var collectionRef = FirebaseFirestore.instance.collection('doencas');

    var especieQuery = await collectionRef
        .where("especie", arrayContains: especieSearch)
        .get();

    var sinaisQuery = especieQuery.docs
        .where((document) {
      // Converte os valores para letras minúsculas antes de comparar
      var sinais = (document.data()["sinais"] as List)?.map((sinal) => sinal.toLowerCase())?.toList();
      var sinaisSearchTrimmed = sinaisSearch.trim().toLowerCase(); // Remove espaços em branco no início e final da palavra buscada
      return sinais?.contains(sinaisSearchTrimmed) ?? false;
    })
        .toList();

    // Verificar se a busca completa está ativada
    if (!buscaCompleta) {

      // Consulta para filtrar os documentos com base na lista de distúrbios selecionados


      for (var document in sinaisQuery) {

        // Verificar se o atributo "disturbios" é uma String e está presente na lista de distúrbios selecionados
        if (document.data()["disturbio"] is String &&
            Variaveis.disturbiosSelecionados.contains(document.data()["disturbio"])) {
          var doenca = Doenca(
            dicas: document.data()["dicas"].toString(),
            disturbio: document.data()["disturbio"].toString(),
            especie: document.data()["especie"].toString(),
            etaria: document.data()["etaria"].toString(),
            exComp: document.data()["exComp"].toString(),
            exCompRes: document.data()["exCompRes"].toString(),
            exFis: document.data()["exFis"].toString(),
            exFisTermosPopulares: document.data()["exFisTermosPopulares"].toString(),
            fatoresDeRisco: document.data()["fatoresDeRisco"].toString(),
            nome: document.data()["nome"].toString(),
            porte: document.data()["porte"].toString(),
            racial: document.data()["racial"].toString(),
            referencias: document.data()["referencias"].toString(),
            sexo: document.data()["sexo"].toString(),
            sinais: document.data()["sinais"].toString(),
            sinaisClinicosTermosPopulares: document.data()["sinaisClinicosTermosPopulares"].toString(),
            cardExpandido: false,

          );

          _doencas.add(doenca);
        }
      }
    } else {



      for (var document in sinaisQuery) {

        var doenca = Doenca(
            dicas: document.data()["dicas"].toString(),
            disturbio: document.data()["disturbio"].toString(),
            especie: document.data()["especie"].toString(),
            etaria: document.data()["etaria"].toString(),
            exComp: document.data()["exComp"].toString(),
            exCompRes: document.data()["exCompRes"].toString(),
            exFis: document.data()["exFis"].toString(),
            exFisTermosPopulares: document.data()["exFisTermosPopulares"].toString(),
            fatoresDeRisco: document.data()["fatoresDeRisco"].toString(),
            nome: document.data()["nome"].toString(),
            porte: document.data()["porte"].toString(),
            racial: document.data()["racial"].toString(),
            referencias: document.data()["referencias"].toString(),
            sexo: document.data()["sexo"].toString(),
            sinais: document.data()["sinais"].toString(),
            sinaisClinicosTermosPopulares: document.data()["sinaisClinicosTermosPopulares"].toString(),
            cardExpandido: false
        );



        _doencas.add(doenca);
      }
    }

    return _doencas;

  }
}