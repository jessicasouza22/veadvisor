// 2.1 CadastreOPet

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vetadvisor/fluxoprontuariodigital/novaConsulta.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfil.dart';
import 'package:vetadvisor/fluxoprontuariodigital/perfilPaciente.dart';
import 'package:vetadvisor/prelogin/logado.dart';


import '../firebase/doenca_service.dart';
import '../objetos/paciente.dart';
import '../recursos/Constants.dart';
import '../recursos/Variaveis.dart';
import '../recursos/dialogUtils.dart';

enum SingingCharacterTipoDoPet { Cachorro, Gato, Animais }

enum SingingCharacterEstado { Casado, Divorciado, Outro }

enum SingingCharacterGenero { Masculino, Feminino, Especifique }

final meses = [
  'Janeiro',
  'Fevereiro',
  'Marco',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
];
final ano = [
  '2000',
  '2001',
  '2002',
  'Abril',
  'Maio',
  'Junho',
  'Julho',
  'Agosto',
  'Setembro',
  'Outubro',
  'Novembro',
  'Dezembro'
];

DropdownMenuItem<String> buildMenuItem(String meses) => DropdownMenuItem(
      value: meses,
      child: Text(
        meses,
        style: TextStyle(
          fontSize: 8,
        ),
      ),
    );

DropdownMenuItem<String> buildMenuAno(String ano) => DropdownMenuItem(
      value: ano,
      child: Text(
        ano,
        style: TextStyle(
          fontSize: 8,
        ),
      ),
    );

class CadastreOPet extends StatelessWidget {
  const CadastreOPet({super.key});

  @override
  Widget build(BuildContext context) {
    return const CadastreOPetPage();
  }
}

class CadastreOPetPage extends StatefulWidget {
  const CadastreOPetPage({super.key, this.restorationId});
  final String? restorationId;
  @override
  State<CadastreOPetPage> createState() => _CadastreOPetState();
}

class _CadastreOPetState extends State<CadastreOPetPage> with RestorationMixin{


  @override
  initState() {
    super.initState();

    DoencaService.listarRacasCaninas();
  }

  // Esse trecho é necessário para o calendário da idade
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
  RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2000),
          lastDate: DateTime(2060),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;

        _nascimento.text = "${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}";
      });
    }
  }
  // Esse trecho é necessário para o calendário da idade

  bool _salvandoPetNoBancoDeDados = false;

  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  String _especie = "Cachorro";
  String _sexo = "Fêmea";
  final _raca = TextEditingController();
  final _nascimento = TextEditingController();
  final _peso = TextEditingController();

  final _id = TextEditingController();


  bool _castrado = false;
  bool _vacinado = false;
  bool _vermifugado = false;

  final _responsavel = TextEditingController();

  var db = FirebaseFirestore.instance;
  var idDocumentoFirebase = "";

  set value(String? value) {}

  @override
  Widget build(BuildContext context) {

    String? racaSelecionada;

    setState(() {
      Variaveis.pacienteEmEdicao.nome != null ? _nome.text = Variaveis.pacienteEmEdicao.nome! : "";
      Variaveis.pacienteEmEdicao.especie != null ? _especie = Variaveis.pacienteEmEdicao.especie! : "";
      Variaveis.pacienteEmEdicao.sexo != null ? _sexo = Variaveis.pacienteEmEdicao.sexo! : "";
      Variaveis.pacienteEmEdicao.raca != null ? _raca.text = Variaveis.pacienteEmEdicao.raca! : "";
      Variaveis.pacienteEmEdicao.peso != null ? _peso.text = Variaveis.pacienteEmEdicao.peso.toString() : "";
      Variaveis.pacienteEmEdicao.id != null ? _id.text = Variaveis.pacienteEmEdicao.id.toString() : "";
      Variaveis.pacienteEmEdicao.castrado != null ? _castrado = Variaveis.pacienteEmEdicao.castrado! : false;
      Variaveis.pacienteEmEdicao.vacinado!= null ? _vacinado = Variaveis.pacienteEmEdicao.vacinado! : false;
      Variaveis.pacienteEmEdicao.vermifugado != null ? _vermifugado = Variaveis.pacienteEmEdicao.vermifugado! : false;
      Variaveis.pacienteEmEdicao.responsavel != null ? _responsavel.text = Variaveis.pacienteEmEdicao.responsavel.toString() : "";
    });



    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(Icons.arrow_back, color: Colors.white),

          backgroundColor: const Color(0xFF3C10BB),

          //  title: const Text("Cadastro do Pet"),
          centerTitle: true,
          actions: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        IconButton(
                            color: Colors.transparent,
                            onPressed: () {

                            },
                            icon: Builder(
                                builder: (context) => IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();

                                      /*
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (
                                                context) =>  const NovaConsulta()),
                                      );

                                       */

                                    },
                                    icon: const Icon(Icons.arrow_back))),),
                        const Text(
                          "Cadastro do Pet ",
                          //textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              print("clicado no notificacao");
                            },
                            icon: Icon(MdiIcons.bellBadgeOutline)),
                      ],
                    )))
          ],
        ),
        body: Container(

          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('imagens/homeGeral.png'),
                fit: BoxFit.fitWidth
              //colorFilter: new ColorFilter.mode(Cores.azulSafe.withOpacity(1), BlendMode.dstATop))
            ),
          ),
          child:
          //backgroundColor: const Color(0xFF3C10BB),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                        child: GestureDetector(
                          child:
                          File('${Constants.diretorioVetAdvisor}/avatar.png')
                              .existsSync()
                              ? Image.file(
                            File(
                                '${Constants.diretorioVetAdvisor}/avatar.png'),
                            // um condicional

                            //maxSizeBytes: 3000 * 1000,
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          )
                              : Image.asset("imagens/user.png"),
                          onTap: () {},
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit_note_outlined,
                              color: Colors.white)),
                      const Text(
                        'Editar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('* Nome do Pet',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(17)),
                          ),
                          child: TextFormField(
                            controller: _nome,
                            validator: (text){
                              if(text == null || text.isEmpty){
                                return "Por favor, digite o seu nome do seu pet.";
                              }
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide: const BorderSide(
                                  color: Color(0xFF3C10BB),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Tipo de Pet",
                            style: TextStyle(color: Colors.white)),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: "Cachorro",
                                  groupValue: _especie,
                                  onChanged:(value) {
                                    setState((){
                                      _especie = value!;
                                    });
                                    DoencaService.listarRacasCaninas();
                                  },

                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                ),
                                const Text("Cachorro",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: "Gato",
                                  groupValue: _especie,
                                  onChanged:(value) {
                                    setState((){
                                      _especie = value!;
                                    });

                                    DoencaService.listarRacasFelinas();
                                  },

                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                ),
                                const Text("Gato",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white))
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: "Animais exóticos",
                                  groupValue: _especie,
                                  onChanged:(value) {
                                    setState((){
                                      _especie = value!;
                                    });
                                  },

                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                ),
                                const Text("Animais Exóticos",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Gênero",
                            style: TextStyle(color: Colors.white)),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  value: "Fêmea",
                                  groupValue: _sexo,
                                  onChanged:(value) {
                                    setState((){
                                      _sexo = value!;
                                    });
                                  },

                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                ),
                                const Text("Fêmea",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: "Macho",
                                  groupValue: _sexo,
                                  onChanged:(value) {
                                    setState((){
                                      _sexo = value!;
                                    });
                                  },

                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.white),
                                ),
                                const Text("Macho",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Raça',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(17)),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // Abrir o menu pop-up ao clicar no TextFormField
                              final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
                              showMenu<String>(
                                context: context,
                                position: RelativeRect.fromRect(
                                  Rect.fromPoints(Offset.zero, overlay.size.bottomRight(Offset.zero)),
                                  Offset.zero & overlay.size,
                                ),
                                items: Variaveis.racasSelecionadas.map((raca) {
                                  return PopupMenuItem<String>(
                                    value: raca,
                                    child: Text(raca),
                                  );
                                }).toList(),
                              ).then((String? raca) {
                                if (raca != null) {
                                  setState(() {
                                    racaSelecionada = raca;
                                    _raca.text = raca;
                                  });
                                }
                              });
                            },
                            child: TextFormField(
                              enabled: false,
                              textAlign: TextAlign.center,
                              controller: _raca,
                              decoration: InputDecoration(
                                hintText: "Clique para selecionar",

                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Peso (em gramas)',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(17)),
                          ),
                          child: TextFormField(
                            controller: _peso,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide: const BorderSide(
                                  color: Color(0xFF3C10BB),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Data de nascimento',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(17)),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _restorableDatePickerRouteFuture.present();
                            },
                            child: TextFormField(
                              enabled: false,
                              controller: _nascimento,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF3C10BB),
                                    width: 1.0,
                                  ),
                                ),
                              ),

                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Responsável',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(17)),
                          ),
                          child: TextFormField(
                            //enabled: false,
                            controller: _responsavel,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide: const BorderSide(
                                  color: Color(0xFF3C10BB),
                                  width: 1.0,
                                ),
                              ),
                            ),

                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ID do Pet',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(17)),
                          ),
                          child: TextFormField(
                            controller: _id,
                            enabled: false,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide: const BorderSide(
                                  color: Color(0xFF3C10BB),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Animal Castrado?',
                                      //textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.white)),

                                  Switch(
                                      value: _castrado,
                                      activeColor: Colors.white,

                                      onChanged: (value) {
                                        setState(() {
                                          _castrado = !_castrado;
                                        });
                                      }),

                                ]),
                            /*
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DropdownButton<String>(
                          items: meses.map(buildMenuItem).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        ),
                        DropdownButton<String>(
                          items: ano.map(buildMenuAno).toList(),
                          onChanged: (value) =>
                              setState(() => this.value = value),
                        )
                      ]),

                 */

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Animal Vacinado?',
                                      //textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.white)),
                                  Switch(
                                      value: _vacinado,
                                      activeColor: Colors.white,

                                      onChanged: (value) {
                                        setState(() {
                                          _vacinado = !_vacinado;
                                        });
                                      }),
                                ]),
                            /*
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Cadastrar vacina",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Icon(MdiIcons.chevronDoubleRight,
                          color: Colors.white),
                    ]),

                 */
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Animal Vermifugado?',
                                      //textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.white)),
                                  Switch(
                                      value: _vermifugado,
                                      activeColor: Colors.white,

                                      onChanged: (value) {
                                        setState(() {
                                          _vermifugado = !_vermifugado;
                                        });
                                      }),
                                ]),
                            /*
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                     children: const [
                      Text(
                        "Cadastrar vermífugo >>",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Icon(MdiIcons.chevronDoubleRight,
                          color: Colors.white),
                    ]),

                  */
                          ])),


                  /*
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Responsável Legal do Pet',
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                        const Padding(padding: EdgeInsets.only(bottom: 5)),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(17)),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide: const BorderSide(
                                  color: Color(0xFF3C10BB),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                   */

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Builder(
                        builder: (context) => ElevatedButton(
                            onPressed: () async {

                              DialogUtils.dialogSalvandoNoBanco(context);

                              setState(() {
                                _salvandoPetNoBancoDeDados = true;
                              });

                              if (_formKey.currentState!.validate()) {

                                final paciente = <String, dynamic>{
                                  "nome": _nome.text,
                                  "especie": _especie,
                                  "sexo": _sexo,
                                  "raca": _raca.text,
                                  "peso": int.parse(_peso.text),
                                  "nascimento": _converteRestorableDateTimeToTimestamp(_selectedDate),
                                  "id": _id.text,
                                  "castrado": _castrado,
                                  "vacinado" : _vacinado,
                                  "vermifugado" : _vermifugado,
                                  "responsavel" : _responsavel.text,
                                  "email" : FirebaseAuth.instance.currentUser?.email.toString()
                                };

                                if(await DoencaService.atualizaPaciente(paciente)) {

                                  setState(() {
                                    _salvandoPetNoBancoDeDados = false;
                                  });

                                  var pacienteAdicionado = Paciente(
                                    nome: _nome.text,
                                    especie: _especie,
                                    sexo: _sexo,
                                    raca: _raca.text,
                                    peso: int.parse(_peso.text),
                                    nascimento: _converteRestorableDateTimeToTimestamp(_selectedDate),
                                    id: _id.text,
                                    castrado: _castrado,
                                    vacinado: _vacinado,
                                    vermifugado: _vermifugado,
                                    responsavel: FirebaseAuth.instance.currentUser?.displayName.toString(),
                                    email: FirebaseAuth.instance.currentUser?.email.toString()
                                  );

                                  setState(() {
                                    Variaveis.pacientes.add(pacienteAdicionado);
                                  });


                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();

                                } else {
                                  final snackBar = SnackBar(
                                    content: const Text('Ocorreu um erro ao tentar salvar os dados. Tente novamente mais tarde.'),
                                    action: SnackBarAction(
                                      label: 'Fechar',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                  Navigator.of(context).pop();
                                }

                              }

                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.white),
                            child: const Text(
                              'Salvar',
                              style: TextStyle(color: Color(0xFF3C10BB)),
                            )),
                      ),
                      Builder(
                        builder: (context) => ElevatedButton(
                            onPressed: () {

                              Navigator.of(context).pop();

                              /*
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Perfil()),
                              );

                               */


                            },
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.white),
                            child: const Text(
                              'Sair',
                              style: TextStyle(color: Color(0xFF3C10BB)),
                            )),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10))


                ],
              ),
            )
          ),
        ));
  }

  Timestamp _converteRestorableDateTimeToTimestamp(RestorableDateTime restorableDateTime) {
    DateTime dateTime = restorableDateTime.value;
    Timestamp timestamp = Timestamp.fromDate(dateTime);
    return timestamp;
  }


}
