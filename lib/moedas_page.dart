import 'package:flutter/material.dart';
import 'package:flutter_crypto/repositories/moeda_repository.dart';
import 'package:intl/intl.dart';

import 'models/moeda.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final moedaRepository = MoedaRepository.tabela;

  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  List<Moeda> selecionadas = [];

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: const Text('Cripto Moedas'),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
        ),
        title: Text('${selecionadas.length} selecionadas'),
        backgroundColor: Colors.blueGrey[50],
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda) {
            return ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              leading: (selecionadas.contains(moedaRepository[moeda]))
                  ? const CircleAvatar(
                      child: Icon(Icons.check),
                    )
                  : SizedBox(
                      width: 40,
                      child: Image.asset(moedaRepository[moeda].icone),
                    ),
              title: Text(
                moedaRepository[moeda].nome,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              trailing: Text(real.format(moedaRepository[moeda].preco)),
              selectedTileColor: Colors.indigo[50],
              selected: selecionadas.contains(moedaRepository[moeda]),
              onLongPress: () {
                setState(() {
                  (selecionadas.contains(moedaRepository[moeda]))
                      ? selecionadas.remove(moedaRepository[moeda])
                      : selecionadas.add(moedaRepository[moeda]);
                });
              },
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: moedaRepository.length),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty ? FloatingActionButton.extended(
        onPressed: () {},
        label: const Text(
          "Favoritar",
          style: TextStyle(letterSpacing: 0, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.star),
      ) : null,
    );
  }
}
