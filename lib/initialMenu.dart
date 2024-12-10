import 'package:ammvee_release/acercaDeNosotros.dart';
import 'package:ammvee_release/addOns/isLoading.dart';
import 'package:ammvee_release/addOns/themeColors.dart';
import 'package:ammvee_release/contacto.dart';
import 'package:ammvee_release/guiasPracticas.dart';
import 'package:ammvee_release/logIn.dart';
import 'package:ammvee_release/medInfoCard.dart';
import 'package:ammvee_release/responsivasMedicas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class initialMenu extends StatefulWidget {
  initialMenu({Key? key, required this.pageContext}) : super(key: key);
  bool pageContext;

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
    "Ciclosporina A (oftálmico)",
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
    "Adultos: 2-5 mg/kg \nPotros perfusión regional: 1-2 gr con 20-60 ml de Solución Salina Fisiológica cada 24-48 hr.",
    "20-40 mg/kg diluido en 1-3 L de SSF IV lento, administrar de 30-60 min.",
    "Adultos: 10-15 mg/kg cada 24 hr. IV lento o IM. \nPotros: 20-25 mg/kg cada 24hrs. IV lento o IM.",
    "5-10 mg/kg en 100 ml de SSF IV (lenta) administrar de 30-60 min. \nIV: 2-5 mg/kg, lenta cada 8-12 hr.\nPO: 5-10 mg/kg cada 12 hr.",
    "PO: 30-50 mg/kg cada 8-12 hr. \nPotros: 10-30 mg/kg IM/PO cada 12 hr.",
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
    "IV: 0.7 mg/kg cada 24 hr. \nPO: 1 mg/kg cada 24 hr.",
    "PO: 25-30 mg/kg cada 6-8 hr.",
    "Potros: 18 mg/kg IV, IM cada 8 hr. \nAdultos: 20 mg/kg IV, IM cada 6 hr.",
    "IV, IM: 11-20 mg/kg cada 6-8 hr.",
    "Tópico: 0.2 ml cada 8 hr.",
    "1 gr en 60 ml de SSF para lavados IU. cada 24 hr. De 1-5 días.",
    "Potros: 11 mg/kg IV cada 8 hr. \nAdultos: 2.2 mg/kg IV cada 8 hr.",
    "Potros: 20-40 mg/kg IV cada 6-8 hr. \nAdultos: 15-25 mg/kg IV,IM cada 8-12 hr.",
    "PO: 10 mg/kg cada 6-8 hr.",
    "Potros: 20 mg/kg IV, IM. \nAdultos: 25-50 mg/kg IV cada 6-8-12 hr.",
    "Potros: 5-10 mg/kg IV, IM ó SC cada 6 hr. \nAdultos: 2.2 mg/kg IM, IV ó SC cada 12 hr.",
    "150 mg por articulación cada 24 hr.",
    "1 gr en 60 ml de SSF lavados IU cada 24 hr. De 3-5 días",
    "Potros: 13.2 mg/kg. \nAdulto: 6.6 mg/kg IM.",
    "IV, IM: 25-50 mg/kg cada 12 hr.",
    "0.2 ml cada 8 hr.",
    "a)	20-25 mg/kg PO ó 6.6 mg/kg IV cada 8 hr. \nb)	2.5 mg/kg PO cada 12 hr.",
    "Tópica: 0.2 ml cada 8 hr.",
    "PO: 60 mg/450kg  cada 12-24 hr.",
    "PO: 0.1-0.8 mg/kg cada 8 hr.",
    "1 mg por cm3 intratumoral.",
    "PO: 7.5 mg/kg cada 12 hr. \nAdicionarle rifampicina \nNo usar en adultos",
    "PO: 0.8-3 µg/kg cada 12 hr.",
    "IV: 2.2 mg/kg",
    "IM: 250 µg cada 24 hr.",
    "Tópico: 0.2 ml cada 8 hr.",
    "Potros: 50 mg/kg PO (día 1-2: cada 12 hr) (día 3-7: cada 8 hr) (día 7 o más: cada 6 hr). \nAdultos: PO 45-50 mg/kg cada 8 hr.",
    "Adultos: IV, IM 25 mg/kg cada 6-12 hr. \nPotros: 25 mg/kg IV cada 6 hr. ",
    "IV: 3-5 mg/kg lentamente ",
    "IV: 20-40 mEq/L",
    "PO: 1 mg/100kg cada 12-24 hr.",
    "80 mg/kg cada 24 hr.",
    "Preventivo: 2-4 mg/kg PO cada 24 hr. \nTerapéutico: 2.5 mg/kg IV en SSF.",
    "PO: 3 mg/kg cada 24 hr. de 45 a 50 días.",
    "IM: 1.5 mg/500kg \nImplante de 2.1 mg cada ciclo estral, 24 horas antes de la copula.",
    "IV, IM: 0.005-0.02 mg/kg potros y adultos.",
    "PO, IV, IM: 0.02-0.2 mg/kg cada 24 hr.",
    "Tópica: 0.2 ml cada 4-12 hr.",
    "IV: 8 gr/kg cada 24 hr lento por 3 días.",
    "500 ml en 5 litros de Ringer Lactato = solución 5%. \nPotros: 4-8 mg/kg/min IV.",
    "Potros: 5-15 mg IV, IM. \nAdultos: 15-30 mg IV.",
    "Sementales: 10-20 mg IV 5-7 minutos previos a la copula.",
    "Tópico: 0.2 ml cada 8 hr.",
    "PO: 3 mg/kg cada 24 hr.",
    "IV: 0.6 mg/kg cada 24-48 hr. \nPO: 0.5-1 mg/kg",
    "PO: 0.1-0.3 mg/kg cada 12 hr.",
    "IV: 25 mg/kg cada 24 hr.",
    "IV: 0.5-1 ml/kg cada 24 hr. Diluido en SSF. \nPotros: 0.5 ml/kg IV cada 24 hr. Diluido en SSF.",
    "IM: 1 mg/45.4kg dosis única.",
    "10-20 mg/kg en 4-8 L por SNG dosis única.",
    "IV, IM: 22 mg/kg",
    "PO: 10 gr/450kg cada 24 hr.",
    "1-5 µg/kg/min una gota por segundo en un caballo de 500kg. \nPotros: 2-10 µg/kg/min infusión continua IV.",
    "PO: 1.1 mg/kg cada 24 hr por 10-20 días. Por 10 días previos al parto, continuar por 5 días más si la cantidad de leche no es adecuada.",
    "200 mg en 500 ml de dextrosa al 5% administrar: 2-5 µg/kg/min (0.45ml/kg/hr.).",
    "Adultos: 0.5-1 mg/kg IV. \nNeonatos: 0.5-1 mg/kg IV, SC, IM. \nSublingual: 40-100 mg/kg ",
    "PO: 10 mg/kg cada 12 hr.",
    "0.5 g/kg en una solución al 10% vía SNG, colectar muestra sanguínea a las (0, 30, 60, 90, 120, 150, 180, 210, 240 minutos) posteriores a la administración",
    "0.03-0.2 mg/kg IV en 1 L de SSF en 30 min.",
    "PO: 0.5-1 mg/kg cada 24 hr.",
    "Adultos: 7.5 mg/kg PO cada 24 hr.",
    "IV: 0.01-0.02 mg/kg \nIV, IC: 0.1-0.2 mL/50kg \nAnafilaxis: 0.2-0.4 mL/50kg IM, SC.",
    "PO: 15-25 mg/kg cada 6-8 hr. \nPotros: 25 mg/kg PO cada 8hr.",
    "PO: 25 mg/kg cada 8 hr.",
    "SC: 50 UI/kg una vez por semana.",
    "IM: 0.55 mg/kg  profunda",
    "IM: 30 mg/kg  dosis única.",
    "IM: 8 mg/500kg dosis única.",
    "IM: 11 mg/kg cada 12 hr.",
    "IV: 20-50 mg/500 kg.",
    "PO: 23 mg/kg cada 24 hr.",
    "PO: 3 mg/kg cada 12 hr.",
    "PO: 10 mg/kg cada 24 hr. por 5 dias.",
    "PO, IV: 2.2-4.4 mg/kg cada 12 hr. \nPotros: 2.2mg/kg IV, PO cada 12-24 hr.",
    "20-80 µg/kg IV en 500 ml de SSF en 15 min (nefroesplénico). \n20 mg dosis total (para fimosis). \nPotros: 0.2-1 µg/kg/hr.",
    "PO: 1-2.5 mg/kg cada 8-12 hr.",
    "Potro: 2.8-16.5 mg/kg PO cada 8 hr. \nAdulto: 10 mg/kg PO cada 12 hr.",
    "PO: 2-12 mg/kg cada 12-24 hr. \nAdultos: 12-20 mg/kg IV diluido en 30 mL de SSF durante 30 min dosis inicial, seguido de 1-9 mg/kg para mantenimiento. \nPotros (convulsión): 5-20 mg/kg IV diluido en 30 mL de SSF durante 30 min",
    "PO: 0.2-0.6 mg/kg cada 24 hr.",
    "PO: 0.1 mg/kg cada 24 hr. ",
    "Dosis inicial: 14 mg/kg seguida por 5 mg /kg PO cada 12-24 hr.",
    "IM: 0.05-0.1 mg/kg cada 21-28 días ",
    "Adultos: 0.5-1.1 mg/kg IV, PO cada 12 hr. \nPotros: 0.5-1.1 mg/kg IV cada 12 hr.",
    "Machos: aplicar tópico cada 14 días 2-5 tratamientos \nHembras. Aplicar tópico diario de 1 a 4 meses",
    "Tópico: 0.2 mL cada 8-12 hr.",
    "1000-2500 µg/caballo cada 12-24 hr.",
    "IV: 4-10 gr (450 kg) diluidos en SSF cada 24 hr.",
    "4-10 gr diluidos en SSF cada 24 hr. (450 kg).",
    "IV: 0.5-2 mg/kg cada 12-24 hr.",
    "PO: 2.5-10 mg/kg cada 8 hr.",
    "Adultos: 6.6 mg/kg IV cada 24 hr. \nPotros menores de 14 días: 12 mg/kg IV cada 36 hr.",
    "Perfusión: 1/3 de la dosis calculada por peso cada 24 hr. Diluida en cloruro de sodio al 0.9%.",
    "Tópico: 0.2 ml tópicos cada 12-24 hr.",
    "2 gr en 60 ml de solución salina. \nAl 8.4% de bicarbonato de sodio cada 24 hr. por 3-5 días.",
    "a)	IV, IM: 40-100 µg 4-12 hr. \nb) SC (criptoorquídeos): 500 mg/kg cada 12 hr. por 10 días.",
    "IM, SC: 2,500-4,000UI.",
    "IM, SC: 2,500-4,000 UI.",
    "PO: 5-10 mg/kg cada 24 hr. de 7 a 28 días.",
    "IV: 20-120 mg/kg (inducción). \nIV: 20-50 mg/kg combinado con α2 agonista.",
    "SC, IV: 40-80 UI/kg cada 8 hr.",
    "Potros: 100 UI/kg SC cada 24 hr. \nEnoxheparina: 40-80 UI/kg SC cada 24 hr. \n1,000 UI =10 mg.",
    "IV: 10 ml/kg se puede repetir en 24-36 hr.",
    "IV: 40 mg una vez por semana.",
    "IA: 20 mg.",
    "PO: 0.5-1.5 mg/kg cada 12 hr.",
    "PO: 3-6 gr/45kg diluido en agua.",
    "PO: 0.5-1.5 mg/kg cada 8 hr.",
    "PO: 25 mg/kg cada 8-12 hr. Por 6 días.",
    "IM: 4 mg/kg cada 72 hr por 4 tratamientos.",
    "IV: 10 mg/kg diluido en SSF en 20 min cada 8 hr.",
    "PO: 2 mg/kg.",
    "IM o SC: 0.4 UI/kg cada 24 hr.",
    "SC ó IV: 0.1-0.2 UI/kg.",
    "Humano: PO 50 UI cada 24 hr. Por 5 días. \nRecombinante: PO 90 UI cada 24 hr. Por 5 días.",
    "IV: 3,000,000 unidades en 1 L de SSF cada 24 hr. Por 3 días.",
    "50 ml en el espacio subaracnoideo (remplazar por misma cantidad de líquido cefalorraquídeo).",
    "PO: 10-20 mg/kg cada 12-24 hr.",
    "PO: 0.6 mg/kg cada 12 hr.",
    "PO: 6 mg/kg cada 24 hr. \nTópico: 1% en 30% DMSO.",
    "Tópica: 0.2 ml cada 8-12 hr.",
    "PO: 200 µg/kg",
    "IV: 0.4-0.8 mg/kg/hr. Infusión",
    "Inducción: IV 2.2 mg/kg. \nMantenimiento: 5-20 µg/kg/min. \nPotros: IV 2 mg/kg.",
    "PO: 10 mg/kg cada 24 hr.",
    "IV: 2.2 mg/kg cada 24 hr.",
    "PO: 6,000-9,000 Unidades/50kg cada 3-8 hr.",
    "PO o vía rectal: 150-200 ml 6-12 hr.",
    "PO: 2-3 mg/kg cada 24 hr. De 3 a 5 días.",
    "a)	PO: 0.5-3 mg/45kg 24 hr. \nb)	PO: 2-4 veces dosis para hipotiroidismo 12-24 hr.",
    "a)	IV: 0.5-1 mg/kg cada 5 min. \nb) 1.3 mg/kg en bolo, dosis única. Infusión continua 0.03-0.05 mg/kg/min.",
    "6 mL/400kg.",
    "PO: 0.1-0.2 mg/kg cada 6 hr.",
    "PO: 5 mg/kg cada 24 hr.",
    "1 gr/kg vía sonda con 4-8 L agua cada 12-24 hr.",
    "IM, SC o IV lento: 1 mg/kg.",
    "IV 500 mg-1gr/kg lento, cada 12 hr. diluido en una solución 20% administrar en 30 min.",
    "PO: 25-50 mg para 75 kg cada 12 hr. \nPotros: 0.25-1 gr/kg IV en 30 min cada 12 hr.",
    "Potros: 0.6 mg/kg PO cada 12 hr.",
    "IM o IV: 0.5 mg/kg cada 4 hr.",
    "PO: 30-50 mg/kg cada 8-12 hr.",
    "PO: 30-60 gr cada 24 hr.",
    "IV: 5-25 mg/kg lento cada 12 hr. \nPO: 25-50 mg/kg cada 12 hr.",
    "IV o IM: 0.1-0.2 mg/kg cada 6-12 hr. \nIV: 0.04 mg/kg/hr infusion continua.",
    "IV: 9.33 gr en 21 mL de SSF para 250 kg.",
    "PO: Adultos 10-15 mg/kg cada 6-8 hr. \nRectal: 50 mg/kg cada 12 hr. \nPotros: 10-15 mg/kg PO cada 8-12 hr.",
    "Tópico: 0.2 ml cada 4-12 hr.",
    "Shampoo de uso diario.",
    "IM o IV: 0.06-0.1 mg/kg.",
    "PO: 1.5-5 µg/kg cada 12 hr.",
    "Tópico: 2 gotas cada 8 hr.",
    "IV o IM: 0.1 mg/kg cada 4-12 hr.",
    "0.1 mg/kg.",
    "PO: 0.4 mg/kg.",
    "IV o IM: 0.3 mg/kg.",
    "a) Potros: IV 4 mg. \nb) IV: 12-20 mg en bolo",
    "PO: 10 mg/kg cada 12-24 hr.",
    "Tópica: 0.2 ml cada 4-12 hr.",
    "Nebulización: 17.5mg cada 12-24 hr.",
    "SC: 0.011-0.033 mg/kg cada 4 hr.",
    "PO: 25 mg/kg cada 24 hr. Por 5 días \nPO: 50 mg/kg cada 24 hr. Por 23 días \nPara Rotavirus: 25 mg/kg PO cada 24 hr. Por 7 días ",
    "Tópico: 15 mg cada 24 hr.",
    "IV: 0.2-2 µg/kg/min.",
    "Tópica: 0.2 ml cada 2-12 hr.",
    "PO: 4 mg/kg cada 24 hr. \nIV: 1.5 mg/kg cada 24 hr.",
    "IV o IM: 20 mg/kg cada 6-8 hr.",
    "A)	IV: 2.5-3 gr en 1 L. De SSF cada 24 hr. \nIV: 6.6 mg/kg lento cada 12-24 hr.",
    "IM: 40-60 UI \na)	IV: 0.11-0.22 UI/kg. \nb)	IM: 20-30 UI cada 60-90 min. c)	\nIM: 10-20 UI 4-8 hr. Después de la monta.",
    "PO: 6.6 mg/kg",
    "IV: 1.5 mg/kg cada 24 hr.",
    "PO: 3 mg/kg cada 6 hr.",
    "IV: 22,000-50,000 UI/kg cada 6 hr.",
    "IM: 20,000-40,000 UI/kg cada 12 hr. \nPotros: IM 22,000 UI.",
    "PO: 40,000-100,000 UI/kg cada 8-12 hr. ",
    "IV: 2-10 mg/kg. ",
    "PO: 7.5 mg/kg cada 8-12 hr.",
    "PO: 0.002-0.006 mg/kg cada 24 hr.",
    "Tópico: 2% cada 6 hr.",
    "PO: 1 mg/kg cada 24 hr.",
    "PO: 0.2 mg/kg cada 24 hr.",
    "a)	IV: 20 ml/kg \nb)	IV: 2-4 ml/kg \nc) IV: 10 ml/kg",
    "IV: 6,000 UI/kg cada 8-12 hr.",
    "PO: 5-10 mg/kg cada 24 hr. Por 28 días.",
    "PO: 1-1.5 mg/kg",
    "PO: 1 mg/kg cada 24 hr.",
    "Tópico: 0.2ml cada 4-12 hr.",
    "IV o IM: 1-5 mg/kg cada 12-24 hr. \nPotros: IV 2 mg/kg cada 24 hr.",
    "IV: 1 mg/kg/min (20 mg/kg en 250ml SSF) administrar en 20-30 min",
    "IM: 150 mg + 10 mg cada 24 hr.",
    "IV: 0.03 mg/kg \nPO: 0.38-0.78 mg/kg cada 8 hr.",
    "Inducción: IV 2.4 mg/kg a efecto. \nMantenimiento: 0.3 mg/kg/min \nPotros: IV 2 mg/kg",
    "PO: 1 g/kg vía sonda cada 12-24 hr.",
    "PO: 120-140 mg cada 12-24 hr. para (500-700kg).",
    "PO: 6.6 mg/kg cada 6-8 hr. \nIV: 1.4-2 mg/kg cada 6-8 hr.",
    "PO: 2.5 mg/kg cada 24 hr.",
    "PO: 2.5 mg/450kg cada 24 hr. Por 7-10 días.",
    "Potros: PO 5 mg/kg cada 12 hr.",
    "IV: 5 mg/kg cada 4 hr. (durante brote). \nPO: 30/mg/kg cada 12 hr. por 7-10 días.",
    "Analgesia/Sedación: 40-120 µg/kg IV \nPre-anestesico: IV 0.075 mg/kg.",
    "SC: 2 ml (cuello) cada 24 hr. Por 3-6 días.",
    "Nebulización: 0.4 µg/kg (dos inhalaciones).",
    "IM: 0.06 mg/kg (día 3-8-10).",
    "PO: 0.5-2.5 mg/kg cada 24 hr.",
    "10,000 UI por L de SSF.",
    "IV: 2-5 ml/kg en bolo por 10-15 min.",
    "IV: 1 mg/kg diluido en SSF.",
    "Adultos: PO 20 mg/kg cada 8 hr. \nPotros: PO 20 mg/kg cada 6 hr.",
    "Tópico: 0.2 ml cada 1-4 hr.",
    "Tópico: 0.2 ml cada 4-12 hr. O mezclar 1 ml crema en 8 ml de lagrima artificial.",
    "PO: 24 mg/kg cada 12 hr.",
    "Potros: PO 20-30 mg/kg cada 12 hr.",
    "Potros: IV 20 mg/kg diluido lentamente cada 12-24 hr. \nAdultos: 25-50 mg/500kg IV diluido en 1 L. De suero, administrar 30 min.",
    "PO: 5-15 mg/kg cada 24 hr.",
    "PO: 22 mg/kg via sonda cada 2 hr por 4-5 tratamientos.",
    "Potros: PO 15-30 gr/100kg o enema cada 12 hr.",
    "PO: 15 mg/kg cada 12-24 hr.",
    "PO: 0.06 mg/kg cada 8-12 hr. \nPotros: PO 10-15 mg cada 8-12 hr. \nAdultos: PO 30 mg cada 8-12 hr.",
    "SC: 0.1-0.2 mg/kg cada 48 hr. Por 14 días.",
    "Subconjuntival: 1,000 UI cada 24 hr.",
    "IV: 6.6 mg/kg cada 12-24 hr.",
    "IM, SC o IV: 1 mg/kg cada 24 hr.",
    "Intrauterino: 3-6 gr diluido en 60 ml de agua esteril.",
    "IV: 50 mg/kg cada 8 hr.",
    "IV: 50-60 mg/kg cada 6-8 hr.",
    "Tópico: 1-5 gotas 5% cada 12 hr.",
    "PO: 0.01 mg/kg cada 24 hr.",
    "Tópico: 0.2 ml cada 12 hr.",
    "IV: 2-4 mg/kg ",
    "PO: 5-10 mg/kg cada 12 hr.",
    "IM: 0.02 mg/kg.",
    "Intraarticular: 6 mg.",
    "Subconjuntivales: 6 mg cada 1-3 semanas",
    "PO: 1 mg/kg cada 24 hr.",
    "IM o IV: 1 mg/kg cada 6-8 hr.",
    "PO: 10 mg/kg cada 12 hr.",
    "PO: 27 mg/kg cada 8 hr por dos días, bajar a 18 mg/kg cada 12 hr por 7-14 días.",
    "IV: 7.5 mg/kg cada 8 hr. diliudo en 1 L de SSF pasar en 30-45min. \nPotros: PO 4 mg/kg dosis inicial, seguido de 2 mg/kg cada 6 hr.",
    "IV: 0.4-0.6 UI/kg.",
    "PO: 250 ml cada 24 hr. (500kg).",
    "IV: 0.004 mg/kg de una vez al día, a dos veces por semana (2 mg totales 500 kg).",
    "IM: 1 ml/50kg o en fluidos.",
    "IV: 10-30 mg/kg en SSF cada 24 hr. \nPO: 10-20 gr cada 24 hr.",
    "PO: 20 UI/kg cada 24 hr.",
    "Potros: IV 0.06 mg/kg lento o IM profundo.",
    "SC: 300-500 mg cada 24 hr. (Adulto).",
    "PO: 4 mg/kg cada 12 hr.",
    "Sedación: IV 0.2-1 mg/kg \nPreanestésico: IV 1 mg/kg.",
    "Tópico: 0.2 ml cada 24 hr.",
    "2 a 4 litros de agua con yodo al 10% cada 24 hr. Por 1-7 días.",
    "PO: 2 mg/kg cada 24 hr.",
    "IV: 20 mg/kg cada 24 hr.",
    "IV: 0.075-0.12 mg/kg \nPotros: IV 0.1 mg/kg"
  ];

  List<String> medsIndications = [
    "Actúa como laxante al lubricar la materia fecal y la mucosa intestinal. También reduce la reabsorción de agua en el tracto gastrointestinal, aumentando así el volumen fecal y disminuyendo el tiempo de tránsito intestinal. \nSe ha administrado aceite mineral después de ingerir toxinas solubles en lípidos (p. ej., queroseno, metaldehído) para retardar la absorción de estas toxinas a través de sus propiedades laxantes y de solubilidad.",
    "Sedante, vasodilatador, premedicación. \nTratamiento rabdomiólisis. \nResucitación hipotensora en hemorragias. \nHipotensor en laminitis/ daño renal. \nSedante sugerido en botulismo. \nPuede causar parafimosis en sementales.",
    "Corticoesteroide para tratamiento de osteoartritis.",
    "Tratamiento de uveítis anterior aséptica.",
    "Tratamiento para la parálisis periódica hiperpotasémica (HYPP), función diurética de potasio y bicarbonato. \nTratamiento de glaucoma al reducir la presión intraocular al reducir la producción del humor acuoso.",
    "Mucolítico utilizado para el control y tratamiento de condiciones respiratorias asociadas con exceso de moco.",
    "Tratamiento mucolítico para empiema de bolsas guturales, 15 min y después drenar.",
    "Tratamiento de úlceras cornales. \nAnticolagenasa - Antiproteinasa Potente/específica. \nPropiedades lubricantes y mucolíticas específicas.",
    "Antiviral indicado en el tratamiento de queratitis viral, mieloencefalopatía por EHV-1 y fibrosis pulmonar multinodular por EHV-5.",
    "Antifibrinolitíco bloqueando al plasminógeno en caballos con hemorragias agudas, auxiliar en hemorragia pulmonar inducida por ejercicio.",
    "Antioxidante, promueve la integridad vascular, acidifica la orina, tratamiento para estrés provocado por ejercicio extenuante.",
    "Suplemento en tratamiento de mieloencefalitis protozoaria equina.",
    "Tratamiento para dolores musculo esqueléticos agudos y crónicos.",
    "Estimulación de la actividad adrenal en potros prematuros/dismaduro. \nDiagnóstico de desórdenes del eje hipotálamo- hipofisiario-adrenal.",
    "Tratamiento de disfunciones hepáticas.",
    "Agonista β2 de corta acción. Broncodilatador, tratamiento EPOC. \nExacerbación aguda de EPOC recurrente y terapia AE. \n*Uso excesivo puede resultar en efectos sistémico como tremores, ansiedad y arritmias cardiacas. \nA veces ocurre broncoconstricción. \nNota: en la ausencia del uso de corticosteroides puede enmascarar la progresión de la enfermedad.",
    "Previenen el daño por hipoxia e isquemia en neonatos (limitando la formación de radicales libres) puesto que poseen un alto riesgo de asfixia inmediatamente después al parto.",
    "Indicado para yeguas que rechazan al potro post-parto.",
    "Manejo y manipulación del ciclo estral. Induce la actividad cíclica ovárica en yeguas con cierta actividad folicular al inicio de la temporada. Indicada para mantener la gestación en ausencia del cuerpo lúteo y en exposición a endotoxinas. \nSuprime el estro y el comportamiento estral en yeguas que ciclan normalmente. \nAyuda a modifica la conducta disminuyendo el libido y agresión en sementales. \n*No usar en yeguas gestantes o con infecciones uterinas.",
    "Potros: Artritis séptica, fisítis, osteomielitis.\nAdultos: Artritis séptica, osteomielitis heridas penetrantes a una articulación.",
    "Potros: Artritis séptica, osteomielitis. Adultos: Artritis séptica, osteomielitis heridas penetrantes a una articulación.",
    "Antifibrinolitíco bloqueando al plasminógeno en caballos con hemorragias agudas, auxiliar en hemorragia pulmonar inducida por ejercicio.",
    "Antibiótico aminoglucósido en infecciones Gram + (excepto productores de penicilinasa), Gram - (especialmente si son resistentes a la gentamicina).\n*Nefrotóxico.",
    "Broncodilatador, estimulante respiratorio, diurético.\n*Excitabilidad, taquicardia, sudoración y tremores musculares.",
    "Antibiótico de grupo β-lactámicos. \n*Severas reacciones locales. \n*No utilizar formulas larga acción.",
    "Lavados intrauterinos contra infecciones por Gram +.",
    "Antibiótico β-lactámico en infecciones por Gram + y la mayoría de los Gram - (actúa muy poco en E.coli). \n*No está indicada para Mycobacterium, Pseudomonas, Rickettsia y Mycoplasma. \n*Presentación de larga acción está contraindicada (reacción local severa/anafilaxis).",
    "Antifúngica, pitiosis, endometritis fúngica, micosis sistémicas o profundas. \n*Puede causar nefrotoxicidad en su uso prolongado (dar en días alternados). \n*Presenta fotosensibilidad. \n*Dosis de prueba para ver su reacción y tiene que ir diluido. \n*Correr química sanguínea antes y durante del tratamiento.",
    "Tratamiento contra tétanos.",
    "Precursor del óxido nítrico en tratamiento para la laminitis.",
    "Tratamiento de hipotensión refractaria en caso de choque séptico, choque hipovolémico agudo y para diabetes insípida.",
    "Estimulante del apetito, tratamiento para el síndrome de fatiga crónica.",
    "Antipirético, analgésico, antiinflamatorio, antitrombótico, tratamiento en flebitis, enfermedades trombo embólicas. \nPosee una vida media muy corta por lo cual su uso como antiinflamatorio sistémico es limitado y se requieren dosis muy altas para lograr un efecto.",
    "Relajante muscular utilizado para obtener un mejor abordaje quirúrgico, agente paralizante, puede usarse en cirugía del ojo para mantener el globo ocular en el centro. *Nota: Relaja todos los músculos, solo utilizar en caso de que exista equipo especial para ventilación.",
    "Parasimpaticolítico, tratamiento de uveítis anterior. \n*Las gotas oftálmicas pueden causar efectos sistémicos en la motilidad gástrica.",
    "a) Broncodilatador, parasimpaticolítico. \nb) Reducir distención articular y de vainas. \nc) Tratamiento de bradicardias. \nd)	Diagnóstico de OAR. \ne)	Intoxicación con organofosforados. \n*Taquicardia sinusal, latidos cardiacos ectópicos. \n*Cambios en la visión: midriasis, fotofobia, cicloplejia, glaucoma. \n*Distención abdominal, íleo. \nRetención urinaria.",
    "Enfermedades cutáneas, pénfigo foliáceo.",
    "Inmunosupresor, se puede usar en lugar de los corticosteroides.",
    "Antibiótico macrólido contra bacterias Gram +, tratamiento de Rhodococcus equi y Salmonella en potros. \nPuede ocasionar raramente diarrea e hipertermia en potros y colitis en yeguas.",
    "Medio de contraste en la orina para detectar goteos.",
    "Bloquea el óxido nítrico, toxicidad por cianuro.",
    "Tratamientos de sarcoides perioculares.",
    "Antibiótico polipeptídico que inhibe la pared celular contra bacterias Gram +.",
    "Relajante muscular, tratamiento para esparaván de arpeo.",
    "Antidiarreico, también usado como medio de contraste.",
    "a)	Parasimpaticolítico y antihistamínico, tratamiento de priapismo agudo. \nb)	Tratamiento para intoxicación con flufenazina.",
    "Tratamiento de acidosis metabólica en normovolemia o hiperpotasemia.",
    "Tratamiento para diarreas y problemas gastrointestinales provocados por Salmonella y Clostridium. \nEn potros no administrar antes del calostro.",
    "Protector intestinal, antidiarreico, antiinflamatorio local.",
    "Anabólico esteroideo para caballos débiles.",
    "Tratamientos de hipocalcemia, cardio protector durante hiperpotasemias, estimulante de la motilidad gastrointestinal.",
    "Desfibrilación química para tratamiento (anti) fibrilación ventricular.\nTaquicardia ventricular.",
    "Control y tratamiento del tracto respiratorio y en condiciones de hipersensibilidad con exceso de moco como sinusitis y bronquitis.",
    "Parasimpatolítico, actúa como broncodilatador de las vías respiratorias.",
    "Agente anticonvulsivo.",
    "Relajación del recto, facilita la palpación.",
    "Opioide agonista-antagonista. \na)	Analgésico, sedante, antitusígeno. \nb)	Se puede usar para dolor visceral en infusión continua. \n*Puede causar ataxia de moderada a severa. No utilizar en yeguas gestantes, caballos con enfermedad hepática o en caso de una bradicardia o arritmia preexistente.",
    "Tratamiento para suprimir prolactina.",
    "Estimulante respiratorio en casos de hipoventilación en neonatos (potros dummy).",
    "Tratamiento en envenenamiento de metales pesados (plomo).",
    "Antidiarreico.",
    "Anticonvulsivo, con efectos bloqueadores de canales de sodio utilizada para tratamiento y diagnóstico de “head shakers”.",
    "Absorbente intestinal administrado por SNG diluido en agua.",
    "Antiinflamatorio No Esteroideo selectivo (Cox-2).",
    "Antibiótico, cefalosporina de primera generación activo contra bacterias Gram +, menos activas contra las bacterias Gram - que las cefalosporinas de segunda o tercera generación.",
    "Antibiótico, cefalosporina de primera generación.",
    "Antibiótico, Cefalosporina de primera generación para tratamiento de infecciones de Gram +.",
    "Tratamiento de queratitis bacteriana Gram +.",
    "Tratamiento de infecciones causadas por Gram +.",
    "Antibiótico, cefalosporina de cuarta generación de amplio espectro.\nPuede causar diarrea.",
    "Antibiótico cefalosporina de tercera generación, amplio espectro para el tratamiento de meningitis.",
    "Antibiótico cefalosporina de tercera generación.",
    "Antibiótico cefalosporina de tercera generación.",
    "Antibiótico, cefalosporina de tercera generación de amplio espectro. Posee buen efecto en enfermedades respiratorias, especialmente por Streptococcus equi/zooepidermicus y Pasteurella resistentes a la penicilina.",
    "Para el tratamiento de potros y adultos con artritis y tenosinovitis séptica.",
    "Tratamiento de infecciones uterinas con Gram + y Gram-.",
    "Antibiótico, cefalosporina de tercera generación amplio espectro de liberación prolongada. Puede causar diarrea en potros.\n*No por vía endovenosa.",
    "Antibiótico, cefalosporina de tercera generación amplio espectro.",
    "Tratamiento de uveítis recurrente equina.",
    "Utilizado para tratar o prevenir ulceras gástricas y duodenales en adultos y potros. \na) Antagonista H2 tratamiento de ulceras. \nb)	Tratamiento de melanomas por su efecto inmunomodulador.",
    "Antibiótico fluoroquinolona, utilizado en infecciones bacterianas del ojo. Puede destruir el cartílago en los potros y causar anemia aplásica.",
    "Antagonista de la serotonina, antihistamínico, Tratamiento para adenoma de la pituitaria, estimulante del apetito, también se usa para “head shakers”.",
    "Procinético cecal, actúa como un agente colinérgico indirecto para estimular la liberación de acetilcolina incrementando el flujo de Ca+, mejorando una coordinación gastroduodenal.",
    "Para el tratamiento de sarcoides, carcinomas de células escamosas y algunos melanomas.\nPreparación: 10 mg de polvo en 1 ml de agua y 2 ml de aceite de sésamo.",
    "Antibiótico macrolido para infecciones de Rhodococcus equi, Corynebacterium, Mycoplasma, Listeria, Chlamydia. Posee un desarrollo rápido de resistencia, por lo cual debe ser utilizado con rifampicina.",
    "Agonista β2 especifico con efectos simpaticomiméticos. Broncodilatador, inhibe las contracciones uterinas.",
    "α-adrenérgico que induce la eyaculación, inhibe conductas compulsivas.",
    "Aumenta el tono uterino y produce abortos 3-5 días (gestaciones mayores a 80 días).",
    "Antibiótico (bacteriostático) de amplio espectro para queratitis bacteriana.",
    "Antibiótico (bacteriostático). La frecuencia de la dosis varía con la edad del potro debido a la maduración hepática.",
    "Antibiótico (bacteriostático). Riesgo de anemia aplásica, utilizar guantes.",
    "Tratamiento para la contractibilidad cardiaca.",
    "Suplemento en fluidos para caballos anoréxicos, tratamiento de hipopotasemia.",
    "Inhibe la cirrosis hepática, amiloidosis, fibrosis hepática crónica, enfermedad renal fibrótica.",
    "Tratamiento de mastocitosis pulmonar.",
    "Relajante musculoesquelético. Preventivo y tratamiento para rabdomiólisis y miopatías post anestésicas. Usar 60 minutos antes de cirugía.",
    "Antibiótico, tratamiento de neumonías causadas por Pneumocitosis carini.",
    "Infertilidad de origen hipotalámico. Induce la ovulación dentro de las primeras 48 hr, se requiere de un folículo de 30 mm aproximadamente.",
    "Sedante y analgésico. ",
    "Glucocorticoide, antiinflamatorio, se utiliza para la prueba de síndrome de Cushing en caballos. Usar dosis más altas en choque y condiciones de hipersensibilidad y la dosis más baja en condiciones inflamatorias.",
    "Uveítis anterior, reducción del tejido cicatrización en la córnea.\n*No aplicar con úlcera corneal.",
    "Coloide.",
    "Tratamiento de hipoglicemia, hiperpotasemia.",
    "Sedante Control anticonvulsivo Inductor de anestesia, estimulante del apetito.",
    "Reduce la ansiedad.",
    "Antiinflamatorio No Esteroideo.",
    "Antihelmintìco, antifilarico.",
    "Antihistamínico de primera generación, anticolinérgico, antimuscarínico para el tratamiento de anafilaxis, antídoto para reacciones a la flufenazina. \n*Puede generar una sedación ligera.",
    "Glucósido cardiotónico, antiartrítico, tratamiento para falla congestiva cardiaca.",
    "Tratamiento para leptospirosis.",
    "Antiinflamatorio. Antioxidante gastrointestinal (Elimina radicales libres).",
    "Induce la lisis del cuerpo lúteo. \n*Sudoración y síndrome abdominal agudo.",
    "Agente laxante surfactante para tratamiento en cólicos por impactación.",
    "Analgésico, antipirético, antiespasmódico.",
    "Antidiarreico no especifico muy útil en casos crónicos.",
    "Catecolamina ionotrópica positiva para el tratamiento de hipotensión y falla cardiaca. \nParticularmente durante la anestesia general (agonista β1).",
    "Bloqueante selectivo de receptores dopaminérgicos para el tratamiento de agalactia. Intoxicación por festuca rubra.",
    "Aumenta el gasto cardiaco y la perfusión renal. Usado como diurético (vasodilatador de arteriolas renales).",
    "Estimulante respiratorio y del sistema nervioso central en neonatos.",
    "Antibiótico de amplio espectro.",
    "Realizar estudios de absorción en tubos heparinizados. *Dietado 12 hr. Antes de la prueba.",
    "Aumenta la presión arterial y puede aumentar la frecuencia cardiaca.",
    "Tratamiento de insuficiencia cardiaca congestiva. Regurgitación mitral u otras condiciones asociadas con agrandamiento cardiaco.\nMuy poca biodisponibilidad por vía oral.",
    "Antibiótico bactericida, fluoroquinolona para infecciones Gram -, no posee actividad contra anaerobios. Es utilizado en pleuroneumonía causada por microorganismos aerobios, primera opción para salmonelosis. Contraindicado en caballos menores de 3 años pues causa desordenes en el cartílago.",
    "Estimulante del sistema nervioso simpático, para anafilaxis, paro cardiaco (fibrilación ventricular). Efectos adrenérgicos α y β. Medicamento de primera línea para reanimación cardiaca.",
    "Antibiótico en infecciones por Rhodococcus equi, neumonías.\n*Puede causar hipertermia y diarrea.",
    "Antibiótico en infecciones por Rhodococcus equi. \n*No utilizar en caballos adultos. \n*No utilizar cuando hay daño hepático. \n*En potros puede causar hipertermia.",
    "Tratamiento de anemia renal, puede causar anemia aplásica.",
    "Esteroide anabólico.",
    "Aumenta la receptividad de la yegua al semental y relaja el cérvix.",
    "Relajación del cérvix.",
    "Antibiótico usado contra leptospirosis.",
    "Antihemorrágico para hemorragias crónicas, atrofia vulvar.",
    "Antiinflmatorio No Esteroideo para dolores musculo esqueléticos.",
    "Antagonista H2 para la prevención y tratamiento de las ulceras gástricas.",
    "Larvicida, antihelmíntico, fibrinolítico.",
    "Antiinflamatorio y analgésico musculo esquelético.\n*El uso prolongado puede causar úlceras en el tracto gastro intestinal.",
    "Esplenocontracción como tratamiento en entrampamiento nefroesplénico.\nVasopresor.",
    "Aumenta el tono uretral.",
    "Anticonvulsivo, tratamiento para miositis.",
    "Barbitúrico para control de convulsiones, sedante y anestésico.",
    "Agente hipotensor.",
    "Antiinflamatorio selectivo Cox-2.",
    "Antifúngico.\n*Hepatotóxico.",
    "Tranquilizante de larga duración.\nSe revierte con difenhidramina.",
    "Antiinflamatorio, analgésico visceral. Anti-endotóxico.",
    "Tratamiento de carcinoma de células escamosas en pene, prepucio y vulva.",
    "Antiinflamatorio No Esteroideo para uveitis anterior.",
    "Corticoesteroide inhalado para RAO.",
    "Tratamiento de hipofosfatemia",
    "Tratamiento de hipofosfatemia.",
    "Diurético, tratamiento en casos de edema pulmonar, hemorragia inducida por el ejercicio.",
    "Disminuye la neuroexcitabilidad, en el tratamiento para convulsiones y dolor neurológico.",
    "Antibiótico aminoglucósido contra infecciones causadas por Gram -. \n*Nefrotóxico y ototóxico. \n*No combinar con diuréticos.",
    "Tratamiento de artritis séptica, fisitis, osteomielitis, potros sépticos.",
    "Para queratitis causadas por Gram -.",
    "Lavados intrauterinos para infecciones E. Coli, Pseudomonas Sp., Klebsiella Sp.",
    "a) Estimula el desarrollo folicular. \nb) Descender testículos en casos de criptorquidismo en añales.",
    "Inducir la ovulación después del estro.",
    "Inducción de la ovulación.",
    "Antifúngico para el tratamiento de las dermatofitosis.",
    "Anestésico inductor y de mantenimiento, relajante muscular.",
    "Anticoagulante, antitrombótico, preventivo a la formación de adherencias, activador de lipasa para enfermedad de hígado graso.",
    "Antiinflamatorio, preventivo a trombo embolismo en sepsis",
    "Colide sintético expansor del volumen vascular, mantener la presión oncótica.",
    "Tratamiento para la sinovitis no infecciosa causada por osteoartritis.",
    "Tratamiento para osteoartritis.",
    "Antihipertensivo, vasodilator periférico.",
    "Sedante.",
    "Antihistamínico, antialérgico.",
    "Antiinflamatorio no esteroideo.",
    "Tratamiento contra babesia.",
    "Antibiótico de amplio espectro.",
    "Tratamiento de narcolepsia, automutilación, uroespermia, aumenta el tono de la uretra.",
    "Tratamiento de larga duración contra hiperglicemia, hiperlipemia.\n*Cuidado con hipoglicemia.",
    "Tratamiento de hiperglicemia, hiperlipemia. \n*Cuidado con hipoglicemia (revisar a las 2 hr). \nN = duración de acción lenta. \nR = si se requiere un control inmediato de glucosa.",
    "Tratamiento de enfermedades alérgicas de las vías respiratorias e inflamación local.",
    "Inmunomodulador utilizado en el tratamiento de virus del oeste del Nilo.",
    "Agente diagnóstico radiopaco para realizar mielografías.",
    "Antibiótico usado contra tuberculosis.",
    "Vasodilatador utilizado en el tratamiento de laminitis, enfermedad navicular, placentitis.",
    "Antifúngico sistémico. Tópico efectivo contra aspergilosis. Nota: absorción oral baja y variable.",
    "Tratamiento de queratitis fúngica, abscesos en estroma.",
    "Antihelmíntico.",
    "Analgésico antagonista de los receptores NMDA.",
    "Anestésico disociativo. \nCorta acción 10-15 min.",
    "Antifúngico.",
    "Antiinflamatorio no esteroideo utilizado para la inflamación y dolor en problemas musculoesqueléticos.",
    "Para potros intolerantes a la lactosa o que se recuperan de una enteritis difusa.",
    "Reduce los niveles de amoniaco en sangre en caso de enfermedad hepática.",
    "Inmunomodulador.",
    "a)	Tratamiento de hipotiroidismo. \nb)	Síndrome metabólico equino. \nAumenta la sensibilidad a la insulina, puede haber pérdida de peso.",
    "a)	Antiarrítmico en taquicardia ventricular aguda. \nb)	Procinético. \nPuede presentar incoordinación.",
    "Epidural.",
    "Antidiarréico.",
    "Inhibidor de la síntesis de quitina, se usa en el tratamiento de queratitis y endometritis fúngicas.",
    "Aumenta el agua intraluminal, en impactaciones de colon.",
    "Antihistamínico.",
    "Diurético osmótico para el tratamiento de edema cerebral, antioxidante.",
    "Antihistamínico usado para vértigo.",
    "AINE, selectivo Cox-2.",
    "Opioide, antagonista de receptores MU.",
    "Aumenta la sensibilidad de los receptores en tejidos periféricos a la insulina.",
    "Acidificador de la orina.",
    "Relajante muscular.",
    "Procinético, estimula el vaciamiento gástrico. *Puede tener reacciones agresivas.",
    "Realizar mielografias (uso intratecal).",
    "Tratamiento de infecciones anaeróbicas.",
    "Tratamiento de queratitis fúngica.",
    "Dermatofitosis.",
    "Sedante, Anticonvulsivo neonatal.",
    "Prostaglandina E para el tratamiento de colitis dorsal derecha (toxicidad AINES), protector de mucosa. \nNota: la dosis más alta ha sido asociada con sudoración, cólico y diarrea. \n*No usar en gestantes.",
    "Tratamiento de carcinoma de células escamosas en la córnea.",
    "Analgésico narcótico para manejo del dolor.",
    "Analgesia en la espina caudal.",
    "Antihelmíntico.",
    "Parasimpatolitico, relajante del recto.",
    "a) Tratamiento de encefalopatía neonatal. \nb) hemorragia posparto.",
    "Antiinflamatorio no esteroideo, de afecciones musculoesqueléticas.",
    "Tratamiento de queratitis fúngica.",
    "Tratamiento de mastocitosis pulmonar.",
    "Procinético de colon mayor.",
    "Antiprotozooario, antiviral (rotavirus).",
    "Tratamiento de laminitis aguda, vasodilatador local, tromboflebitis.",
    "Tratamiento para hipotensión.",
    "Fluoroquinolona para infecciones corneales de Gram (-), queratitis.",
    "Inhibidor de la bomba de protones como preventivo y tratamiento para ulceras gástricas.",
    "Antibiótico betalactámico (penicilina) usado en osteomielitis.",
    "Antibiótico (bacteriostático) de amplio espectro \nA) Relajante del tendón en potros.",
    "Inducir parto \na) Tratamiento de impactación esofágica \nb) Abortivo, retención de placenta, metritis \nc) Eliminación de fluidos post monta",
    "Antihelmíntico",
    "Inhibidor de la bomba de protones.",
    "Tratamiento de toxicosis, metales pesados.",
    "Antibacteriano contra Gram (+)",
    "Antibacteriano contra Gram (+)",
    "Antibacteriano contra Gram (+)",
    "Antiepiléptico.",
    "Vasodilatador, tratamiento de laminitis, placentitis, terapia Anti-FNT.",
    "Tratamiento de adenoma pituitario, síndrome de Cushing.",
    "Agente miotico para tratamiento de glaucoma.",
    "Tratamiento de mielo-encefalitis protozoaria equina.",
    "Antiinflamatorio inhibidor de Cox-1 selectivo de Cox-2 para el tratamiento de carcinoma de células escamosas.",
    "a)	Animales no calostrados \nb) Endotoxemia \nc)	Hipoproteinemia",
    "Anti-endotóxico.",
    "Tratamiento de mieloencefalítis protozoaria equina.",
    "Antihelmíntico, anti-céstodos.",
    "Corticoesteroide usado en alergias.",
    "Uveitis anterior aséptica (NO aplicar si presenta úlcera corneal).",
    "Tratamiento de traumas neurales, espinales, shock, anafilaxis.",
    "Antiarrítmico usado en taquicardia ventricular, supra ventricular.",
    "Suprime el estro, utilizado para sincronizar, mantener la gestación. ",
    "Antiarrítmico, agente bloqueador betaadrenérgico, tratamiento de taquiarritmias atriales, ventriculares.",
    "Anestésico endovenoso para potros.",
    "Tratamiento de impactaciones de arena.",
    "Inhibidor de la enzima convertidora de angiotensina, tratamiento de falla cardiaca congestiva.",
    "Antagonista de receptores H2 para la prevención y tratamiento de las ulceras gástricas. ",
    "Tranquilizante de larga duración.",
    "Tratamiento para agalactia.",
    "Antibiótico para infecciones crónicas Gram(+), tiene buena penetración (hueso, abscesos), usarlo con otros antibióticos (sinergia).",
    "Antiviral contra influenza.",
    "Alfa 2 agonista sedante y analgésico.",
    "Tratamiento de dolores musculares.",
    "Broncodilatador de larga duración con broncoespasmo severo.",
    "Enfermedad del musculo blanco en potros.",
    "Tratamiento de la hipertensión pulmonar.",
    "Heparinizado y limpieza (flush) de catéter y extensión.",
    "Expansor de plasma, tratamiento de shock hipovolémico. ",
    "Choque anafiláctico. Antioxidante, antiinflamatorio para trauma craneoencefálico y espinal.",
    "Compuesto que se une a las úlceras del tracto gastrointestinal.",
    "Antiproteinasas en tratamiento de úlceras corneales.",
    "Queratitis fúngica. ",
    "Antibiótico de amplio espectro.",
    "Antibiótico bactericida de amplio espectro.",
    "Tratamiento de taquicardia ventricular, shock, antagonista NMDA, soporto en tratamiento de tétanos.",
    "Antibiótico para infecciones intestinales. ",
    "Tratamiento de fibrilación atrial en caballos jóvenes en entrenamiento. \nPuede presentar sudoración y cólico.\n*Si la frecuencia cardiaca sube a más de 100 latidos por minuto suspender.",
    "Reducir los niveles de potasio en casos de uroperitoneo.",
    "Antibiótico macrólido para tratamiento contra Rhodococcus equi.",
    "Broncodilatador, se utiliza para la prueba de anhidrosis. ",
    "Promotor de líbido en sementales.",
    "Antiproteinasa en úlceras.",
    "Antibiótico.",
    "Tratamiento de enfermedades del sistema nervioso central (poliencefalomalacia).",
    "Lavados intrauterinos para infecciones Gram (+ y -).",
    "Antibiótico eficaz contra Pseudomonas sp.",
    "Antibiótico contra infecciones Gram (+ y -) \nEficaz contra Pseudomonas sp.",
    "Para el tratamiento de glaucoma.",
    "Suplemento para la tiroides, se usa en conjunto de testosterona para tratamientos contra fisitis.",
    "Tratamiento de queratitis bacterianas Gram (-).",
    "Antagonista de un alfa 2 (xilacina, detomidina, romefidina).",
    "Opioide analgésico para dolores crónicos \nLaminitis.",
    "Glucocorticoide sintético. \n*No sobrepasar de 18 mg totales.",
    "Tratamiento de osteoartritis.\n*No más de 18 mg ya que puede causar laminitis.",
    "Uveítis anterior aséptica.\n*No aplicar si presenta úlcera corneal.",
    "Inhibe la síntesis de cortisol en las glándulas adrenales.",
    "Antihistamínico para el tratamiento de urticaria y reacciones anafilácticas.",
    "Se une a las sales biliares. Tratamiento para enfermedad hepática (colestasis).",
    "Antiviral para herpes virus equino, como profilaxis o terapéutico.",
    "Antibiótico contra Gram (+), Staphylococcus, C. Difficile.",
    "Aumenta la presión arterial, además es la hormona antidiurética.",
    "Preventivo de la formación de enterolitos.",
    "Tratamiento de linfomas, trombocitopenia purpura.",
    "Pacientes con anorexia.",
    "Promueve la integridad vascular, acidifica la orina, antioxidante usado en ejercicio extenuante.",
    "Tratamiento de enfermedades neurológicas, deficiencias.",
    "Tratamiento de la enfermedad de músculo blanco.",
    "Antídoto contra toxicosis por Warfarina, profiláctico en casos de hemorragia inducida por antibióticos (protrombinapenia).",
    "Antifúngico, útil en infecciones por Aspergillus.",
    "Sedante, analgésico y pre-anestésico.",
    "Queratitis fúngica.",
    "Lavados intrauterinos en infecciones fúngicas (enjuagar bien el yodo).",
    "Antifúngico sistémico, agente mucolitico.",
    "Antifúngico sistémico.",
    "Antagonista de Xilacina."
  ];

  bool virgin = true;
  List<String> filteredList = [];
  late String medName;
  late String exitMode;

  @override
  void initState() {
    super.initState();
    if (widget.pageContext == true) {
      exitMode = "Regresar a Iniciar Sesión";
      medsIndications.clear();
      medsDose.clear();
      medsArray.clear();
    } else {
      exitMode = "Cerrar Sesión";
    }
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
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
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
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Nomenclatura"),
                            content: const Text("VÍAS DE ADMINISTRACIÓN\n"
                                "\t\tIV: Intra Venoso\n"
                                "\t\tIM: Intra Muscular\n"
                                "\t\tSC: Subcutáneo\n"
                                "\t\tIA: Intra Articular\n"
                                "\t\tIC: Intra Cardiaca\n"
                                "UNIDADES DE MEDIDA\n"
                                "\t\tUI: Unidades Internacionales\n"
                                "\t\tmg: Miligramos\n"
                                "\t\tL: Litros\n"
                                "\t\tmL: Mililitros\n"
                                "\t\tµg: Microgramos\n"
                                "\t\tgr: Gramos\n"
                                "\t\tkg: Kilogramos\n"
                                "\t\tcm: Centímetros\n"
                                "\t\tmEq: Miliequivalentes\n"
                                "UNIDADES DE TIEMPO\n"
                                "\t\thr: Hora\n"
                                "\t\tmin: Minutos\n"
                                "OTROS\n"
                                "\t\tSSF: Solución salina fisiológica\n"
                                "\t\tSNG: Sonda Nasogástrica"),
                            actions: <Widget>[
                              TextButton(
                                  child: Text("Cerrar"),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.red,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.info_outline, color: Colors.black))
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: kBlack,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AMMVEE App",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Acerca de Nosotros'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return acercaDeNosotros(pageContext: widget.pageContext);
                          },
                        ),
                      );
                    }
                  ),
                  ListTile(
                    title: Text('Contacto'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Contacto(pageContext: widget.pageContext);
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Guías prácticas'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return guiasPracticas(pageContext: widget.pageContext);
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Responsivas Médicas'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return responsivasMedicas(pageContext: widget.pageContext);
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(exitMode),
                    onTap: () {
                      showAlertDialog(context);
                    },
                  ),
                ],
              ),
            ),
            backgroundColor: kWhite,
            body: SafeArea(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (widget.pageContext == true) {
                    return const Center(
                      child: Text(
                        "Crea una cuenta para ver más información",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                    );
                  } else {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawAutocomplete(
                              optionsBuilder:
                                  (TextEditingValue textEditingValue) {
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
                                  filteredList.addAll(matches);
                                  return matches;
                                }
                              },
                              onSelected: (String selection) {
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
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 30),
                                                    color: Colors.white,
                                                    child: Container(
                                                      width: double.infinity,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Text(opt),
                                                    )));
                                          }).toList(),
                                        ))));
                              },
                            ),
                            LayoutBuilder(builder: (context, constraints) {
                              if (filteredList.isEmpty && !virgin) {
                                return const Text(
                                    "No se encontro ningun medicamento",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20));
                              } else {
                                return SingleChildScrollView(
                                  child: GridView.count(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    childAspectRatio: 10 / 2.5,
                                    crossAxisCount: 1,
                                    children: List.generate(filteredList.length,
                                        (index) {
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
                                                  AssetImage(
                                                      "assets/jeringa.png"),
                                                  color: Color(0xFF030303),
                                                ),
                                                title: Text(
                                                  filteredList[index],
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: kBlack),
                                                ),
                                                onTap: () {
                                                  var positionOfMedicine =
                                                      medsArray.indexOf(
                                                          filteredList[index]);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return medInfoCard(
                                                            medName:
                                                                filteredList[
                                                                    index],
                                                            medDose: medsDose[
                                                                positionOfMedicine],
                                                            medIndication:
                                                                medsIndications[
                                                                    positionOfMedicine]);
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
                    );
                  }
                },
              ),
            ),
          ),
        );

  showAlertDialog(BuildContext context) {
    // set up the buttons
    if (widget.pageContext == true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return logIn();
          },
        ),
      );
    } else {
      Widget cancelButton = TextButton(
        child: const Text("Permancer"),
        onPressed: () {
          Navigator.of(context).pop(); // dismiss dialog
        },
      );
      Widget continueButton = TextButton(
        child: const Text("Cerrar Sesion"),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
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
}
