import 'package:flutter/material.dart';

import '../../widgets/date_range.dart';

class CalenderKaryawan extends StatefulWidget {
  const CalenderKaryawan({super.key});

  @override
  State<CalenderKaryawan> createState() => _CalenderKaryawanState();
}

class _CalenderKaryawanState extends State<CalenderKaryawan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: _ProductList(),
    );
  }
}

class Item {
  String itemName;
  int itemQty;
  Item({required this.itemName, required this.itemQty});
}

class _ProductList extends StatefulWidget {
  const _ProductList({super.key});

  @override
  State<_ProductList> createState() => __ProductListState();
}

class __ProductListState extends State<_ProductList> {
  List<Item> itemData = [
    Item(itemName: "Seblak", itemQty: 8),
    Item(itemName: "Indomie", itemQty: 4),
    Item(itemName: "Soto", itemQty: 2)
  ];
  final additem = TextEditingController();
  final addqty = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                title: Text(
                    "${itemData[index].itemName} x${itemData[index].itemQty}"),
                leading: CircleAvatar(
                  backgroundColor: (itemData[index].itemQty != 0)
                      ? Colors.blueAccent
                      : Colors.grey,
                  radius: 25,
                  child: Text(
                    itemData[index].itemName[0],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                onTap: (itemData[index].itemQty != 0)
                    ? () {
                        setState(() {
                          itemData[index].itemQty = itemData[index].itemQty - 1;
                        });
                      }
                    : null,
                trailing: IconButton(
                  onPressed: () {
                    // setState(() {
                    //   itemData.removeAt(index);
                    // itemData.length--;
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text("Menghapus data"),
                        content:
                            const Text("Anda yakin ingin menghapus data ini!"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, "Cancel"),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: (() {
                              setState(() {
                                itemData.removeAt(index);
                                Navigator.pop(context, "ok");
                              });
                            }),
                            child: const Text("ok"),
                          ),
                        ],
                      ),
                    );
                    // });
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    scrollable: true,
                    content: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Nama Item',
                                icon: Icon(Icons.add_shopping_cart),
                              ),
                              controller: additem,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Jumlah Item',
                                icon: Icon(Icons.add_box_sharp),
                              ),
                              controller: addqty,
                            )
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        child: Text("Tambah"),
                        onPressed: (() {
                          setState(() {
                            itemData.add(Item(
                                itemName: additem.text,
                                itemQty: int.parse(addqty.text)));
                            additem.clear();
                            addqty.clear();
                            Navigator.pop(context, "Tambah");
                          });
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text("Data ditambahkan"),
                              content: const Text("Silahkan kembali"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, "ok"),
                                  child: const Text("ok"),
                                ),
                              ],
                            ),
                          );
                        }),
                      )
                    ]);
              });
        },
      ),
    );
  }
}
