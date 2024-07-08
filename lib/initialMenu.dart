import 'package:ammvee_release/addOns/isLoading.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/logIn.dart';
import 'package:ammvee_release/medInfoCard.dart';
import 'package:flutter/material.dart';

class initialMenu extends StatefulWidget {
  const initialMenu({Key? key}) : super(key: key);

  @override
  State<initialMenu> createState() => _ChooseYourInstance();
}

class _ChooseYourInstance extends State<initialMenu> {
  bool loading = true;
  String dropdownvalue = 'Buscar Medicamento';
  List<String> medsArray = [
    "Aceite Mineral",
    "Acepromacina",
    "Acetato de metilprednisolona (intra-articular)",
    "Acetato de metilprednisolona (oftálmico)",
    "Acetazolamida",
    "Acetilcisteína",
    "(mucolítico)",
    "Acetilcisteína (lavado de bolsas guturales) ",
    "Acetilcisteína (oftálmica)",
    "Aciclovir",
    "Ácido Aminocapróico",
    "Ácido Ascórbico (Vitamina C)",
    "Ácido fólico",
    "Ácido Meclofenamico",
    "ACTH (Hormona Adrenocortocotropica)",
    "Ademetionina",
    "Albuterol (Salbutamol)",
    "Alopurinol",
    "Alprazolam",
    "Altrenogest",
    "Amikacina (intra-articular)",
    "Amikacina (Perfusión regional)",
    "Amikacina (reproducción) ",
    "Amikacina Sulfato",
    "Aminofilina",
    "Amoxicilina",
    "Ampicilina (para lavado intrauterino)",
    "Ampicilina sódica",
    "Anfotericina B",
    "Antitoxina tetánica",
    "Arginina (L)",
    "Arginina-Vasopresina (ADH)",
    "Arsénico sódico tiarsetasamida",
    "Aspirina (ácido acetilsalicílico)",
    "Atracurium besilate",
    "Atropina (oftálmica)",
    "Atropina (sulfato)",
    "Aurothioglucose (Tiomalato sódico de oro)",
    "Azatioprina",
    "Azitromicina",
    "Azosulfamida",
    "Azul de metileno",
    "Bacillus Calmette-Guerin (Vacuna)",
    "Bacitracina de Zinc",
    "Baclofeno",
    "Bario (sulfato)",
    "Benztropine Mesylate",
    "Bicarbonato de sodio",
    "Biosponge (Esmectita)",
    "Bismuto Subsalicilato",
    "Boldenona",
    "Borogluconato de Calcio",
    "Bretilio",
    "Bromhexina",
    "Bromuro de ipratropio",
    "Bromuro de Potasio",
    "Bromuro de Propanteline",
    "Butorfanol",
    "Cabergoline",
    "Cafeína",
    "Calcio EDTA",
    "Caolin pectina",
    "Carbamacepina",
    "Carbón activado",
    "Carprofeno",
    "Cefalexina",
    "Cefalotina",
    "Cefazolina",
    "Cefazolina (oftálmica)",
    "Cefazolina (reproducción)",
    "Cefepime",
    "Cefotaxima sódica",
    "Cefpodoxima proxetil",
    "Ceftazidima ",
    "Ceftiofur ",
    "Ceftiofur (intra-articular) sódico",
    "Ceftiofur (reproducción) sódico",
    "Ceftiofur acido libre cristalino",
    "Ceftriaxona ",
    "Ciclosporina A",
    "(oftálmico)",
    "Cimetidina",
    "Ciprofloxacina (oftálmica)",
    "Ciproheptadina",
    "Cisaprida",
    "Cisplatino",
    "Claritromicina ",
    "Clembuterol",
    "Clomipramina",
    "Cloprostenol sódico",
    "Cloranfenicol (oftálmico)",
    "Cloranfenicol Palmitato",
    "Cloranfenicol sodio succinato",
    "Cloruro de Calcio",
    "Cloruro de Potasio",
    "Colchicina",
    "Cromoglicato de sodio",
    "Dantroleno",
    "Dapsona",
    "Deslorelina Acetato",
    "Detomidina",
    "Dexametasona",
    "Dexametasona (oftálmica)",
    "Dextran 80",
    "Dextrosa 50%",
    "Diazepam",
    "Diazepam (reproducción)",
    "Diclofenaco (oftálmico)",
    "Dietilcarbamazina",
    "Difenhidramina",
    "Digoxina",
    "Dihidroestreptomicina",
    "Dimetil sulfoxido (DMSO)",
    "Dinoprost trometamina ",
    "Dioctisulfosucciniato (DSS) 5%",
    "Dipirona",
    "Diyodohidroxiquinoleina",
    "Dobutamina",
    "Domperidona",
    "Dopamina",
    "Doxapram",
    "Doxiciclina",
    "D-xilosa (glucosa)",
    "Efedrina (HCL)",
    "Enalapril",
    "Enrofloxacina",
    "Epinefrina",
    "Eritromicina esteareato",
    "Eritromicina etilsuccinato",
    "Eritropoyetina",
    "Estanozolol",
    "Estradiol 17 β",
    "Estradiol Cipionato",
    "Estreptomicina ",
    "Estrógenos conjugados",
    "Etodolaco",
    "Famotidin",
    "Fenbendazol",
    "Fenilbutazona",
    "Fenilefrina (HCL)",
    "Fenilpropanolamina",
    "Fenitoína liberación prolongada",
    "Fenobarbital",
    "Fenoxibenzamina",
    "Firocoxib",
    "Fluconazol",
    "Flufenazina",
    "Flunixin de meglumine",
    "Fluorouracilo (5-FU)",
    "Flurbiprofeno (oftálmico)",
    "Fluticasona",
    "Fosfato de Potasio",
    "Fosfato de Sodio",
    "Furosemida",
    "Gabapentina",
    "Gentamicina",
    "Gentamicina ( perfusiones regionales)",
    "Gentamicina (oftálmica)",
    "Gentamicina (reproducción)",
    "GNRH (Hormona Liberadora de Gonadotropina)",
    "Gonadotropina corionica",
    "Gonadotropina coriónica humana (HCG)",
    "Griseofulvina",
    "Guaifenesina",
    "Heparina",
    "Heparina de bajo peso molecular",
    "Hetastarch",
    "Hialuronato de sodio",
    "Hialuronato de sodio (intra-articular)",
    "Hidralazina (HCL)",
    "Hidrato de Cloral",
    "Hidroxizina (HCL)",
    "Ibuprofeno",
    "Imidocarb",
    "Imipenem-cilastatina",
    "Imipramina (HCL)",
    "Insulina Protamina Zinc",
    "Insulina R o N",
    "Interferón Alfa",
    "Interferón Alfa 2a recombinante",
    "Iohexol",
    "Isonazida",
    "Isoxuprina (HCL)",
    "Itraconazol",
    "Itraconazol 1% oftálmico",
    "Ivermectina",
    "Ketamina (analgesia)",
    "Ketamina (anestesia)",
    "Ketoconazol",
    "Ketoprofeno",
    "Lactasa",
    "Lactulosa",
    "Levamisol",
    "Levotiroxina",
    "Lidocaína",
    "Lidocaína (reproducción)",
    "Loperamida",
    "Lufenuron",
    "Magnesio, sulfato de (gastrointestinal)",
    "Maleato de Pirilamina",
    "Manitol",
    "Meclizina",
    "Meloxicam",
    "Meperidina",
    "Metformina",
    "Metionina",
    "Metocarbamol",
    "Metoclopramida",
    "Metrizamida",
    "Metronidazol",
    "Miconazol (oftálmico) 1%",
    "Miconazol tópico",
    "Midazolam",
    "Misoprostol",
    "Mitomicina oftálmica 0.4%",
    "Morfina",
    "Morfina (epidural)",
    "Moxidectina",
    "N- Butilescopolamina",
    "Naloxona",
    "Naproxeno",
    "Natamicina oftálmica",
    "Nedocromilo sódico",
    "Neostigmina",
    "Nitazoxanida",
    "Nitroglicerina tópica",
    "Norepinefrina",
    "Ofloxacina oftálmica",
    "Omeprazol",
    "Oxacilina",
    "Oxitetraciclina",
    "Oxitocina",
    "Pamoato Tartrato de Pirantel",
    "Pantoprazol ",
    "Penicilamina",
    "Penicilina G Potasica ",
    "Penicilina G procaínica ",
    "Penicilina Potasica V",
    "Pentobarbital sodico",
    "Pentoxifilina",
    "Pergolida",
    "Pilocarpina oftálmica",
    "Pirimetamina",
    "Piroxicam",
    "Plasma hiperinmune",
    "Polimixina B",
    "Ponazuril",
    "Prazicuantel",
    "Prednisolona",
    "Prednisolona Acetato de, 1% oftálmico",
    "Prednisolona Sódica Succionato",
    "Procainamida",
    "Progesterona y Estradiol 17 β",
    "Propanolol",
    "Propofol",
    "Psyllium Plantago (polvo)",
    "Quinapril",
    "Ranitidina",
    "Reserpina",
    "Reserpina (reproducción)",
    "Rifampicina",
    "Rimantadina",
    "Romifidina",
    "Rubeola (inmunomodulador)",
    "Salmeterol",
    "Selenio",
    "Sildenafil",
    "Solución Heparinizada",
    "Solución salina hipertónica 7%",
    "Succinato de Metilprednisolona",
    "Sucralfato",
    "Suero autólogo oftálmico",
    "Sulfadiazina sódica (oftálmica)",
    "Sulfadiazina/Trimetoprim",
    "Sulfametoxazol/trimetoprim ",
    "Sulfato de magnesio",
    "Sulfato de Neomicina",
    "Sulfato de Quinidina",
    "Sulfonato de poliestireno sódico",
    "Telitromicina",
    "Terbutalina",
    "Testosterona",
    "Tétanos (antitoxina) oftálmica",
    "Tetraciclina",
    "Tiamina (vitamina B1)",
    "Ticarciclina (reproducción)",
    "Ticarcilina",
    "Ticarcilina con ácido clavulánico",
    "Timolol (oftálmico)",
    "Tiroxina",
    "Tobramicina (oftálmica)",
    "Tolazolina",
    "Tramadol",
    "Triamcinolona Acetonida",
    "Triamcinolona Acetonida (intraarticular)",
    "Triamcinolona Acetonida (oftálmica)",
    "Trilostano",
    "Tripelenamina",
    "Ursodial",
    "Valaciclovir",
    "Vancomicina",
    "Vasopresina",
    "Vinagre",
    "Vincristina",
    "Vitamina B (complejo)",
    "Vitamina C",
    "Vitamina E",
    "Vitamina E/Selenio ",
    "Vitamina K1",
    "Voriconazol",
    "Xilacina",
    "Yodo povidona 2% oftalmica",
    "Yodo povidona solución 0.5% (reproduccion)",
    "Yoduro de Potasio",
    "Yoduro de Sodio",
    "Yohimbina"
  ];

  bool virgin = true;
  List<String> filteredList = [];
  late String medName;

  @override
  void initState() {
    super.initState();
    //TODO: "GET" FROM DB INFORMATION OF MEDICINE NAMES
    setState(() {
      filteredList.addAll(medsArray);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => loading
      ? const isLoading()
      : PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              leading: IconButton(
                icon: const Icon(Icons.power_settings_new_sharp),
                color: Colors.black,
                onPressed: () {
                  showAlertDialog(context);
                },
              ),
              centerTitle: true,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png',
                      height: MediaQuery.of(context).size.height * 0.03),
                ],
              ),
              actions: <Widget>[
                Opacity(
                  opacity: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.people_alt_sharp, color: Colors.white),
                  ),
                )
              ],
            ),
            backgroundColor: kWhite,
            body: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RawAutocomplete(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text == '') {
                            filteredList.clear();
                            filteredList.addAll(medsArray);
                            return const Iterable<String>.empty();
                          } else {
                            List<String> matches = <String>[];
                            filteredList.clear();
                            virgin = false;
                            matches.addAll(medsArray);
                            matches.retainWhere((s) {
                              return s.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase());
                            });
                            print("Matches from search: $matches");
                            print("Text ${textEditingValue.text}");
                            filteredList.addAll(matches);
                            return matches;
                          }
                        },
                        onSelected: (String selection) {
                          print("Sospechoso numero 1 $selection");
                          medName = selection;
                          setState(() {
                            filteredList.clear();
                            filteredList.add(medName);
                          });
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          return Container(
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: kBlack),
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.search, color: kBlue),
                                  hintText: "Buscar Medicamento"),
                              controller: textEditingController,
                              focusNode: focusNode,
                              onChanged: (String value) {
                                setState(() {
                                  medName = value;
                                  print("Sospechoso numero 2 $value");
                                });
                              },
                            ),
                          );
                        },
                        optionsViewBuilder: (BuildContext context,
                            void Function(String) onSelected,
                            Iterable<String> options) {
                          return Material(
                              child: SizedBox(
                                  height: 200,
                                  child: SingleChildScrollView(
                                      child: Column(
                                    children: options.map((opt) {
                                      return InkWell(
                                          onTap: () {
                                            onSelected(opt);
                                          },
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              color: Colors.white,
                                              child: Container(
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text(opt),
                                              )));
                                    }).toList(),
                                  ))));
                        },
                      ),
                      LayoutBuilder(builder: (context, constraints) {
                        if (filteredList.isEmpty && !virgin) {
                          return const Text("No se encontro ningun medicamento",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20));
                        } else {
                          return SingleChildScrollView(
                            child: GridView.count(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              childAspectRatio: 10 / 2,
                              crossAxisCount: 1,
                              children:
                                  List.generate(filteredList.length, (index) {
                                return Card(
                                  color: kWhite,
                                  elevation: 5,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: const ImageIcon(
                                            AssetImage("assets/jeringa.png"),
                                            color: Color(0xFF030303),
                                          ),
                                          title: Text(
                                            filteredList[index],
                                            style: const TextStyle(
                                                fontSize: 15, color: kBlack),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return medInfoCard(
                                                      medName:
                                                          filteredList[index]);
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        }
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Permancer"),
      onPressed: () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Cerrar Sesion"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return logIn();
            },
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AMMVEE"),
      content: const Text("Quieres cerrar sesion?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
