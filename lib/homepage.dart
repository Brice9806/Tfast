import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mob/widget/type_p.dart';
import 'package:mob/widget/vllslct.dart';

import 'Page1.dart';
import 'Page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController dateControllerRetour = TextEditingController();
  String vArrive = "";
  String vDepart = "";
  String achoix = "";
  DateTime selectedDate = DateTime.now();
  String voy = "";
  //-----------------------
  var items = ["Flooz", "Tmoney"];
  String dropdownvalue = "Flooz";

// ...

  void dialog() {
    String heureDepart = "4h00";
    String nomP = "";
    String prenomP = "";
    String modeP = "Flooz";
    String numP = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Réservez le billet'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<String>(
                  value: heureDepart,
                  onChanged: (String? value) {
                    setState(() {
                      heureDepart = value!;
                    });
                  },
                  items: [
                    "4h00",
                    "8h00",
                    "13h00",
                    "17h30",
                    "21h30",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nom du passager',
                  ),
                  onChanged: (value) {
                    nomP = value;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Prénom du passager',
                  ),
                  onChanged: (value) {
                    prenomP = value;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: dropdownvalue,
                  onChanged: (String? newvalue) {
                    setState(() {
                      dropdownvalue = newvalue!;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Numéro de paiement',
                  ),
                  onChanged: (value) {
                    numP = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                if (heureDepart.isNotEmpty &&
                    nomP.isNotEmpty &&
                    prenomP.isNotEmpty &&
                    numP.isNotEmpty &&
                    numP.length > 7) {
                  // Toutes les conditions sont remplies, vous pouvez procéder à la validation ici
                  print('Validation réussie');
                } else {
                  // Affichez un message Toast pour indiquer que les champs sont incorrects
                  Fluttertoast.showToast(
                    msg:
                        'Veuillez remplir tous les champs correctement et assurez-vous que le numéro de paiement comporte plus de 7 chiffres.',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              },
              child: const Text('Valider'),
            ),
          ],
        );
      },
    );
  }

  //-----------------------

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime currentDate = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: currentDate,
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color.fromARGB(255, 152, 153, 153),
            colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(255, 138, 139, 139)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        controller.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fast-T"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/im1.png"),
            const Text(
              "G-Smile vous garantit le confort",
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Avec T-Fast, assurez vos trajets depuis votre maison",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            Text(
              achoix,
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              dateController.text,
              style: const TextStyle(color: Colors.black),
            ),
            Vllslct(
              selectionVilleArrive: (arrive) {
                setState(() {
                  vArrive = arrive;
                });
              },
              selectionVilleDepart: (depart) {
                setState(() {
                  vDepart = depart;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: "Aller",
                          groupValue: voy,
                          onChanged: (value) {
                            setState(() {
                              voy = value.toString();
                            });
                          },
                        ),
                        const Text("Aller "),
                      ],
                    ),
                    const SizedBox(
                      width: 130,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "Aller et Retour",
                          groupValue: voy,
                          onChanged: (value) {
                            setState(() {
                              voy = value.toString();
                            });
                          },
                        ),
                        const Text("Aller et Retour"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date départ',
                      hintText: 'Sélectionnez une date',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () => _selectDate(dateController),
                    readOnly: true,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextFormField(
                    controller: dateControllerRetour,
                    decoration: const InputDecoration(
                      labelText: 'Date retour',
                      hintText: 'Sélectionnez une date',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () {
                      if (voy == "Aller et Retour") {
                        _selectDate(dateControllerRetour);
                      }
                    },
                    readOnly: true,
                    enabled: voy == "Aller et Retour",
                  ),
                ),
              ],
            ),
            Type(choix: getTypeFromAge),
            ElevatedButton(
              onPressed: () {
                print(vArrive);
                print(vDepart);
                if (vArrive.isNotEmpty &&
                    vDepart.isNotEmpty &&
                    dateController.text.isNotEmpty &&
                    vArrive != vDepart) {
                  // Ajoutez ici le code à exécuter lorsque les conditions sont remplies
                  // Par exemple, vous pouvez appeler la fonction dialog() ici
                  dialog();
                } else {
                  // Si les conditions ne sont pas remplies, vous pouvez afficher un message d'erreur
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Erreur de réservation'),
                        content: const Text(
                            'Veuillez sélectionner une destination différente et une date de départ valide.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Réservez le billet'),
              // Si les conditions ne sont pas remplies, désactivez le bouton
              // en utilisant la propriété `enabled`
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page11()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page22()),
            );
          }
        },
      ),
    );
  }

  //--------------------

  //-------------------------ghhjkjkkk

  getTypeFromAge(age) {
    setState(() {
      if (age == "0 à 10 ans : Enfant") {
        achoix = "Enfant";
      } else if (age == "11 à 20 ans : Adolescent") {
        achoix = "Adolescent";
      } else if (age == "21 à 30 ans : Jeune adulte") {
        achoix = "Jeune adulte";
      } else if (age == "31 à 40 ans : Adulte") {
        achoix = "Adulte";
      } else if (age == "41 à 50 ans : Adulte d'âge moyen") {
        achoix = "Adulte d'âge moyen";
      } else {
        achoix = "Âge supérieur";
      }
    });
  }
}
