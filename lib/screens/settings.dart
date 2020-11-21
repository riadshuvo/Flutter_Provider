import 'package:changenotifiar_provider/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Units"),
                DropdownButton(
                  value: settingsProvider.units,
                  onChanged: (String value) {
                    //TODO UPDATE UNIT
                    settingsProvider.setUnits(value);
                  },
                  items: <String>['Imperial', 'Metric','Squre']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wax Lien"),
                Container(
                  child: Wrap(
                    spacing: 10,
                    children: [
                      FilterChip(
                          label: Text('Swix'),
                          selected: (settingsProvider.waxLines.contains('Swix')) ? true : false,
                          onSelected: (bool value) {
                            //TODO
                            if(value == true){
                              settingsProvider.addWaxLine("Swix");
                            }else{
                              settingsProvider.removeWaxLine('Swix');
                            }
                          }),
                      FilterChip(
                          label: Text('Toko'),
                          selected: (settingsProvider.waxLines.contains('Toko')) ? true : false,
                          onSelected: (bool value) {
                            //TODO
                            if(value == true){
                              settingsProvider.addWaxLine("Toko");
                            }else{
                              settingsProvider.removeWaxLine('Toko');
                            }
                          })
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
