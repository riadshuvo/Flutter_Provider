import 'package:changenotifiar_provider/providers/settings_provider.dart';
import 'package:changenotifiar_provider/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Wax App'),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Settings()));
              })
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:20 ,),

            Text("Unit: ${settingsProvider.units}"),

            SizedBox(height:20 ,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    settingsProvider.waxLines.length,
                    (index) =>
                        Text("Wax Lines: ${settingsProvider.waxLines[index]}")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
