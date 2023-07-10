import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class PersonalInfoDialog extends StatefulWidget {
  @override
  _PersonalInfoDialogState createState() => _PersonalInfoDialogState();
}

class _PersonalInfoDialogState extends State<PersonalInfoDialog> {
  final _formKey = GlobalKey<FormState>();

  String _fullName = '';
  final _phoneController = MaskedTextController(mask: '+7 (000) 000-00-00');
  final _nameController = MaskedTextController(mask: 'AAAAAAAAAAAAAAAAAAAAAAAAA');
  String _phoneNumber = '';
  bool _phoneNumberValid = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Оформить заказ'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'ФИО',
                hintText: 'Kovalev Andrei Mihailovich'
              ),
              controller: _nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Введите ФИО';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _fullName = value!;
                });
              },
              onSaved: (value) {
                setState(() {
                  _fullName = value!;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Номер телефона',
                hintText: '+7 (123) 456-78-90',
              ),
              keyboardType: TextInputType.phone,
              controller: _phoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Введите номер телефона';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _phoneNumberValid = _phoneController.text.length == _phoneController.mask?.length;
                });
              },
              onSaved: (value) {
                setState(() {
                  _phoneNumber = value!;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: (_phoneNumberValid && _nameController.text.length > 3) ? () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              // Делаем что-то с данными
              print('ФИО: $_fullName, Номер телефона: $_phoneNumber');

              Navigator.pop(context);
            }
          } : null,
          child: Text('Сохранить'),
        ),
      ],
    );
  }
}