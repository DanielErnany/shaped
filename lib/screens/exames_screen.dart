import 'package:flutter/material.dart';

class ExamesScreen extends StatelessWidget {
  ExamesScreen({Key? key}) : super(key: key);

  final List<Map> exames = [
    {
      "id": 1,
      "paciente": "João Pedro",
      "status": "Processando",
      "data": "08/08/2022"
    },
    {
      "id": 2,
      "paciente": "Marcelo Miguel",
      "status": "Finalizado",
      "data": "09/08/2022"
    },
    {
      "id": 3,
      "paciente": "Marcos Pontes",
      "status": "Processando",
      "data": "05/08/2022"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final dimensionsDevice = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exames'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(
          bottom: dimensionsDevice.height * 0.1,
        ),
        itemCount: exames.length,
        itemBuilder: (ctx, i) => ExamesWidget(exame: exames[i]),
      ),
    );
  }
}

class ExamesWidget extends StatelessWidget {
  Map exame;
  ExamesWidget({
    Key? key,
    required this.exame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimensionsDevice = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: dimensionsDevice.width * 0.01,
        vertical: dimensionsDevice.height * 0.005,
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimensionsDevice.width * 0.02,
            vertical: dimensionsDevice.height * 0.01,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Nome: ",
                  ),
                  Text(
                    exame['paciente'],
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Data: ",
                  ),
                  Text(
                    exame['data'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
