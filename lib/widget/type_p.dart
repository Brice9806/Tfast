import 'package:custom_single_select/custom_single_select.dart';
import 'package:flutter/material.dart';

class Type extends StatefulWidget {
  Type({Key? key, required this.choix}) : super(key: key);

  Function(dynamic choice) choix;

  @override
  State<Type> createState() => _TypeState();
}

class _TypeState extends State<Type> {
  List<String> agep = [
    "0 à 10 ans : Enfant",
    " 11 à 20 ans : Adolescent",
    " 21 à 30 ans : Jeune adulte",
    "31 à 40 ans : Adulte",
    "41 à 50 ans : Adulte d'âge moyen",
    "51 ans ou plus : Âge supérieur",
  ];
  String? initialValue;
  String? searchInitialValueA;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              // padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ]),
              child: Center(
                  child: CustomSingleSearchSelect<String>(
                isBarrierDismissible: true,
                items: agep,
                cancelText: "Fermer",
                cancelBackgroundColor: Colors.green,
                itemBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
                titleBackgroundColor: Colors.orange,
                separatorColor: Colors.blueGrey,
                separatorHeight: 1,
                cancelTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                itemTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 3, 3, 3),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                title: "",
                titleTextStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                selectedItemTextStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.arrow_drop_down, size: 25),
                    border: InputBorder.none,
                    hintText: "Sélectionner la tranche d'âge",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                // searchStyle: const TextStyle(
                //   fontSize: 20,
                //   color: Colors.black,
                // ),
                // searchDecoration: const InputDecoration(
                //     border: InputBorder.none,
                //     hintText: "Rechercher une ville",
                //     hintStyle: TextStyle(
                //       fontSize: 20,
                //       color: Colors.black,
                //     )),
                onSelect: widget.choix,
                valueSelected: searchInitialValueA,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
