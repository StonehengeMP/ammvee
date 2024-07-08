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
    "Acetilcisteína (mucolítico)",
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

  List<String> medsDose = [
    "PO: 7.5 ml/kg via SNG.\nPotros: 120 ml PO via SNG",
    "IV, IM, SC: 0.01-0.1 mg/kg\nOral: 0.1 - 0.2 mg/kg (efecto variable)",
    "100-120 mg por articulación.",
    "40 mg subconjuntival cada 1-3 semanas",
    "PO: 2.2 - 4.4 mg/kg  cada 12 hr. ",
    "IM, IV: 1.5 mg/kg cada 12 hr.\nPolvo oral: 0.1-0.3 mg/kg al día por 5 días o más",
    "20-60 ml acetil cisteína 20%",
    "0.2 ml solución tópica 5% cada 1-4 hr.\n5% acetilcisteína 2-6 gotas cada 2 hr. para úlceras o cada 6 hr. para síndrome de ojo seco",
    "PO: 20 mg/kg cada 8 hr.\nIV: 10 mg/kg cada 12 hr.\nTópica (pomada oftálmica) para queratitis aplicar cada 3-4 hr.",
    "20-40 mg/kg diluido en 1-3 L de SSF IV lento, administrar de 30-60 min.",
    "PO: 0.5-2 gr/kg cada 12-24 hr.\nPotros: 10-100 mg/kg/día PO o IV diluido en fluidos cada 24 hr. ",
    "400-500 mg/día",
    "PO: 2.2 mg/kg cada 24 hr.",
    "IM: 100-250 µg dosis única total para un potro de 50 kg. ",
    "PO: 20 mg/kg cada 24 hr. ",
    "1-2 µg/kg inhalado cada 12 hr. ",
    "PO: 44 mg/kg en las primeras 4 horas de vida.",
    "PO: 0.035 mg/kg cada 8-12 hr. ",
    "PO: 0.044 mg/kg cursos de 15 días o más para suprimir o regular el estro. ",
    "500 mg por articulación cada 24- 48 hr.\n250-750 mg/articulación.",
    "Adultos: 2-5 mg/kg\nPotros perfusión regional: 1-2 gr con 20-60 ml de Solución Salina Fisiológica cada 24-48 hr.",
    "20-40 mg/kg diluido en 1-3 L de SSF IV lento, administrar de 30-60 min.",
    "Adultos: 10-15 mg/kg cada 24 hr. IV lento o IM.\nPotros: 20-25 mg/kg cada 24hrs. IV lento o IM.",
    "5-10 mg/kg en 100 ml de SSF IV (lenta) administrar de 30-60 min.\nIV: 2-5 mg/kg, lenta cada 8-12 hr.\nPO: 5-10 mg/kg cada 12 hr.",
    "PO: 30-50 mg/kg cada 8-12 hr.\nPotros: 10-30 mg/kg IM/PO cada 12 hr.",
    "3 grs. en 60 ml de solución salina estéril cada 24 hr. Por 3 días.",
    "IV, IM: 20 mg/kg cada 6-8 hr.",
    "Dosis de prueba: IV 100 mg (totales).\nDosis inicial: 0.2 mg/kg aumentando a 0.5-1.0 mg/kg después de 2 días.\nPreparación: 0.1 mg/ml diluido en un litro de dextrosa al 5%.\n Administrar en 60 min cada 48 hr por 28 días.",
    "Adulto: IV o IM 5,000-50,000 UI (diluido si es IV)\nPotros: SC 2,500-3,500 UI.",
    "Solución al 10% (100 grs. En un L de solución salina) IV cada 12 hr. De 1-3 días.",
    "0.25-05 Mg/kg/min IV Infusión continua\n40-60 UI SC o IM\n0.4-0.6 U/kg IV\n.002-.007 units/kg/min",
    "IV: 0.1 mg/kg/día.",
    "PO: 10-100 mg/kg cada 8-24 hr.\nAntitrombótico: 4-12 mg/kg.\nTópico: máximo 50 g gel cada 24 hr.",
    "IV: 0.2mg- 0.28/kg.\nDosis inicial: 0.1-0.25 mg/kg IV.\nDosis siguientes: ¼- ½ de la dosis inicial IV.",
    "Tópico: 0.2 ml cada 2-48 hr. Para dilatación de pupila",
    "a)	IV ó IM: 0.015-0.02 mg/kg.\nb) 5-10 mg por articulación.\nc) IV, IM, SC: 0.02-0.10 mg/kg.\nd) IV: 5 mg.\ne)	1 mg/kg cada 2-6 hr.",
    "IM: 50 mg Dosis inicial, seguido de 1 mg/kg IM cada 7 días, después cada 14 días y luego cada 28 días.",
    "PO: 1-2mg/kg cada 24 hr.",
    "PO: 10 mg/kg cada 24 hr. por 5 días y luego cada 48 hr.",
    "IV: 2 mg/kg.",
    "IV: 0.5-2 mg/kg",
    "0.3-0.5 ml por cm3 cada 14 días de 3 a 5 aplicaciones.",
    "Tópico (pomada): Aplicar cada 8 hr.",
    "PO: 0.4 mg/kg cada 8 hr.",
    "PO: 3 gr/kg dosis única.",
    "a) PO: 0.4 mg/kg cada 8 hr. \nb) IV: 8 mg/500kg lento",
    "PO: 30-150 gr/día \nIV: mEq=25 – valor bicarbonato x 0.6 (potro) ó 0.3 (adulto) x peso vivo (kg) al 5% infusión IV 1 mEq/kg, lento. ",
    "Potros: 1 gr/kg cada 4 hr. \nPO Adultos: 1 gr/kg cada 6-12 hr. Vía SNG.",
    "Potros: 0.5-1 ml/kg PO cada 6-12 hr. \nAdultos: 1 ml/kg vía SNG cada 6 hr.",
    "IM: 1.1 mg/kg tratamiento en intervalos de cada 3 semanas.",
    "Adicionar 20ml a cada litro de fluidos.",
    "IV: 3-5 mg/kg en bolo.",
    "PO: 0.2-0.4 mg/kg una vez al día. \nIV: 0.2-0.4 mg/kg una vez al día.",
    "5 activaciones (90 µg por activación) nebulizador 250-500 µg/1-2mL",
    "PO: 25-30 mg/kg cada 12 hr.",
    "IV: 30 mg/kg ",
    "a)	IV, IM: 0.01-0.1 mg/kg \nb)	IV: 0.01-0.015 mg/kg/hr. en infusión continua después de un bolo de 0.02 mg/kg bolo IV. \vIV, IM, SC: 0.05-0.2 mg/kg (dosis más bajas se utilizan combinadas con agonistas α2 para sedación. \vPotros: 0.05 mg/kg IV, SC, IM.",
    "PO: 2-3 mg/500kg cada 12-24 hr.",
    "Dosis inicial de 10 mg/kg PO y mantenimiento 2.5 mg/kg PO cada 12 hr.",
    "Solución al 6.6%: 25 mg/kg IV en dextrosa al 5% lentamente cada 8 hr por 4 días.",
    "PO: 2-4 L/500kg cada 12 hr. \nPotros: 80-100 ml PO cada 8 hr.",
    "PO: 4-8 mg/kg cada 8 hr.",
    "PO: 1-3 gr/kg cada 8 hr.",
    "IV: 0.7 mg/kg cada 24 hr. \nPO: 1 mg/kg cada 24 hr."
        "PO: 25-30 mg/kg cada 6-8 hr.",
    "Potros: 18 mg/kg IV, IM cada 8 hr. \nAdultos: 20 mg/kg IV, IM cada 6 hr.",
    "IV, IM: 11-20 mg/kg cada 6-8 hr.",
    "Tópico: 0.2 ml cada 8 hr.",
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
                              childAspectRatio: 10 / 2.5,
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
