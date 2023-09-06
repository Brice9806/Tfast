// ignore_for_file: must_be_immutable

import 'package:custom_single_select/custom_single_select.dart';
import 'package:flutter/material.dart';

class Vllslct extends StatefulWidget {
  Vllslct(
      {Key? key,
      required this.selectionVilleDepart,
      required this.selectionVilleArrive})
      : super(key: key);

  void Function(String depart) selectionVilleDepart;
  void Function(String arrive) selectionVilleArrive;

  @override
  State<Vllslct> createState() => _VllslctState();
}
//---------ghhjkllmmmmmm

class _VllslctState extends State<Vllslct> {
  List<String> villes = [
    "Dapaong",
    "Kandé",
    "Bafilo",
    "Niamtougou",
    "Mango",
    "Tchaoudjo",
    "Bassar",
    "Sokodé",
    "Blitta",
    "Tchamba",
    "Sotouboua",
    "Atakpamé",
    "Kpalimé",
    "Badou",
    "Amlamé",
    "Tsévié",
    "Vogan",
    "Aného",
    "Lomé",
    "Tabligbo"
  ];
  String? initialValue;
  String? searchInitialValuea;
  String? searchInitialValued;

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
                items: villes,
                cancelText: "Fermer",
                cancelBackgroundColor: Colors.green,
                itemBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
                titleBackgroundColor: Colors.orange,
                separatorColor: Colors.blueGrey,
                separatorHeight: 3,
                cancelTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                itemTextStyle: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                title: "TOGO",
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
                    hintText: "Départ",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                searchStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                searchDecoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Rechercher une ville",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                onSelect: (value) {
                  setState(() {
                    searchInitialValued = value;
                    widget.selectionVilleDepart(
                      searchInitialValued!,
                    );
                    //widget.depart = value;
                  });
                },
                valueSelected: searchInitialValued,
              )),
            ),
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
                items: villes,
                cancelText: "Fermer",
                cancelBackgroundColor: Colors.green,
                itemBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
                titleBackgroundColor: Colors.orange,
                separatorColor: Colors.blueGrey,
                separatorHeight: 3,
                cancelTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                itemTextStyle: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                title: "TOGO",
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
                    hintText: "Destination",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                searchStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                searchDecoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Rechercher une ville",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                onSelect: (value) {
                  setState(() {
                    searchInitialValuea = value;
                    widget.selectionVilleArrive(
                      searchInitialValuea!,
                    );
                    //widget.retour = value;
                  });
                },
                valueSelected: searchInitialValuea,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
