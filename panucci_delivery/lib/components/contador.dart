import 'package:flutter/material.dart';
import 'package:panucci_delivery/models/item.dart';
import 'package:panucci_delivery/store/carrinho_store.dart';
import 'package:panucci_delivery/store/item_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Contador extends StatelessWidget {
  Contador({Key? key, required this.item}) : super(key: key);
  final Item item;
  final ItemStore itemStore = ItemStore();
  @override
  Widget build(BuildContext context) {
    final carrinhoStore = Provider.of<CarrinhoStore>(context, listen: false);
    return Observer(
      // needs an anonymous function to builder
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (itemStore.valorContador > 0) {
                itemStore.removerItem();
                carrinhoStore.removeCarrinho(item);
              }
            },
            child: const Icon(
              Icons.remove_circle_outline,
              size: 20,
            ),
          ),
          Text(itemStore.valorContador.toString()),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              itemStore.adicionaItem();
              carrinhoStore.adicionaCarrinho(item);
            },
            child: const Icon(
              Icons.add_circle_outline,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
