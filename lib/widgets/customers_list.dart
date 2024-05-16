import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/customers.dart';
import 'customer_item_list.dart';
import 'empty_list_label.dart';

class CustomersList extends StatelessWidget {
  const CustomersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Customers>(
      builder: (ctx, dataSnapshot, _) =>
      dataSnapshot.customers.isEmpty ?
      const EmptyListLabel('Al momento non sono presenti clienti !')
          :
          ListView.builder(
              itemCount: dataSnapshot.customers.length,
              itemBuilder: (_, i) => CustomerItemList(dataSnapshot.customers[i]!)

      ),
    );
  }
}
