import 'package:flutter/material.dart';

class Page22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        backgroundColor: Colors.green, // Couleur grise pour l'AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Déconnexion de l'utilisateur
            ElevatedButton(
              onPressed: () {
                // Mettez ici votre logique de déconnexion
              },
              child: Text('Déconnexion'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Couleur grise pour le bouton
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Bouton pour afficher les termes de licence dans une pop-up
            ElevatedButton(
              onPressed: () {
                _showLicenseDialog(context);
              },
              child: Text('Termes de licence'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Couleur grise pour le bouton
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLicenseDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Votre Application',
      applicationVersion: '1.0.0',
      children: [
        Text(
          'Termes de licence...',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
