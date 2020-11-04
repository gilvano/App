import 'package:entrega_app/app/widgets/local_entrega/local_entrega_item.dart';
import 'package:entrega_app/models/local_entrega_model.dart';
import 'package:flutter/material.dart';

class LocaisList extends StatelessWidget {
  final List<LocalEntregaModel> locais;
  LocaisList(this.locais);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: locais.length,
      itemBuilder: (BuildContext ctx, int index) {
        final local = locais[index];
        return LocalEntregaItem(local: local);
      },
    );
  }
}
