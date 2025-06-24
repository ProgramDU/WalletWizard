import 'package:flutter/material.dart';

class AddExpenseForm extends StatefulWidget {
  final String category;
  const AddExpenseForm({super.key, required this.category});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  double amount = 0;
  int quantity = 1;
  String notes = '';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Form(
        key: _formKey,
        child: Wrap(
          runSpacing: 16,
          children: [
            Center(
              child: Text("Agregar a ${widget.category}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Nombre del gasto"),
              validator: (value) => value!.isEmpty ? "Requerido" : null,
              onSaved: (value) => name = value!,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Monto (\$)"),
              validator: (value) => value!.isEmpty ? "Requerido" : null,
              onSaved: (value) => amount = double.parse(value!),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Cantidad"),
              initialValue: '1',
              onSaved: (value) => quantity = int.parse(value!),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Notas (opcional)"),
              onSaved: (value) => notes = value ?? '',
            ),
            Row(
              children: [
                const Text("Fecha: "),
                Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                const Spacer(),
                TextButton.icon(
                  icon: const Icon(Icons.calendar_today),
                  label: const Text("Cambiar"),
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                )
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Aquí puedes guardar el gasto en una base de datos o mostrarlo
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Gasto agregado: $name - \$${amount.toStringAsFixed(2)}')),
                  );
                }
              },
              child: const Text("Guardar"),
            )
          ],
        ),
      ),
    );
  }
}
