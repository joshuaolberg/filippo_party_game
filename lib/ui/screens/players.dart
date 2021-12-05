import 'package:filippo_party_game/db/database_helper.dart';
import 'package:filippo_party_game/models/player.dart';
import 'package:filippo_party_game/ui/templates/screen.dart';
import 'package:flutter/material.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  PlayersScreenState createState() {
    return PlayersScreenState();
  }
}

class PlayersScreenState extends State<PlayersScreen> {
  int? selectedId;
  final textController = TextEditingController(text: 'Spieler eingeben');

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: TextField(controller: textController)),
      body: Center(
        child: FutureBuilder<List<Player>>(
            future: DatabaseHelper.instance.getPlayers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? Center(child: Text('No Players in List.'))
                  : ListView(
                      children: snapshot.data!.map((player) {
                        return Center(
                          child: Card(
                            color: selectedId == player.id
                                ? Colors.grey
                                : Colors.black,
                            child: ListTile(
                                title: Text(player.name),
                                onLongPress: () {
                                  setState(() {
                                    DatabaseHelper.instance.remove(player.id!);
                                  });
                                },
                                onTap: () {
                                  setState(() {
                                    if (selectedId == null || player.id != selectedId) {
                                      textController.text = player.name;
                                      selectedId = player.id;
                                    } else {
                                      textController.text = '';
                                      selectedId = null;
                                    }
                                  });
                                }),
                          ),
                        );
                      }).toList(),
                    );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            // if condition ? do : else
            selectedId != null
                ? await DatabaseHelper.instance.update(
                    Player(id: selectedId, name: textController.text),
                  )
                : await DatabaseHelper.instance.add(
                    Player(name: textController.text),
                  );
            setState(() {
              textController.clear();
              selectedId = null;
            });
          }),
    ));
  }
}
