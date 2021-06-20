import 'package:flutter/material.dart';

import 'api/pdf_api.dart';
import 'api/pdf_invoice.dart';
import 'model/customer.dart';
import 'model/invoice.dart';
import 'model/supplier.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF PAGE"),
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: RaisedButton(
            child: Text("Press me"),
            onPressed: () async {
              final date = DateTime.now();
              final dueDate = date.add(Duration(days: 7));

              final invoice = Invoice(
                supplier: Supplier(
                  name: "Masda agus",
                  address: "Martubung",
                  paymentInfo: 'https://paypal.me/sarahfieldzz',
                ),
                customer: Customer(
                  name: 'Apple Inc.',
                  address: 'Apple Street, Cupertino, CA 95014',
                ),
                info: InvoiceInfo(
                  date: date,
                  dueDate: dueDate,
                  description: 'My description...',
                  number: '${DateTime.now().year}-9999',
                ),
                items: [
                  InvoiceItem(
                    description: 'Coffee',
                    date: DateTime.now(),
                    quantity: 3,
                    vat: 0.19,
                    unitPrice: 5.99,
                  ),
                  InvoiceItem(
                    description: 'Water',
                    date: DateTime.now(),
                    quantity: 8,
                    vat: 0.19,
                    unitPrice: 0.99,
                  ),
                  InvoiceItem(
                    description: 'Orange',
                    date: DateTime.now(),
                    quantity: 3,
                    vat: 0.19,
                    unitPrice: 2.99,
                  ),
                  InvoiceItem(
                    description: 'Apple',
                    date: DateTime.now(),
                    quantity: 8,
                    vat: 0.19,
                    unitPrice: 3.99,
                  ),
                  InvoiceItem(
                    description: 'Mango',
                    date: DateTime.now(),
                    quantity: 1,
                    vat: 0.19,
                    unitPrice: 1.59,
                  ),
                  InvoiceItem(
                    description: 'Blue Berries',
                    date: DateTime.now(),
                    quantity: 5,
                    vat: 0.19,
                    unitPrice: 0.99,
                  ),
                  InvoiceItem(
                    description: 'Lemon',
                    date: DateTime.now(),
                    quantity: 4,
                    vat: 0.19,
                    unitPrice: 1.29,
                  ),
                ],
              );
              final pdfFile = await PdfInvoiceApi.generate(invoice);

              PdfApi.openFile(pdfFile);
            }),
      ),
    );
  }
}
