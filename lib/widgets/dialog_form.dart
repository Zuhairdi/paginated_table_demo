import 'package:flutter/material.dart';
import 'package:paginated_datatable_demo/models/model.dart';

class DialogForm {
  static show(BuildContext context, Model entry) => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: FormContent(model: entry),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            )
          ],
        ),
      );
}

class FormContent extends StatefulWidget {
  final Model? model;
  const FormContent({Key? key, this.model}) : super(key: key);

  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();

  Widget _form({
    required TextEditingController controller,
    required String title,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: title,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      );
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (widget.model != null) {
        setState(() {
          _controller1.text = widget.model!.firstname;
          _controller2.text = widget.model!.lastname;
          _controller3.text = widget.model!.company;
          _controller4.text = widget.model!.mobile;
          _controller5.text = widget.model!.house;
          _controller6.text = widget.model!.email;
          _controller7.text = widget.model!.birthday;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _form(controller: _controller1, title: 'Firstname'),
          _form(controller: _controller2, title: 'Lastname'),
          _form(controller: _controller3, title: 'Company'),
          _form(controller: _controller4, title: 'Mobile'),
          _form(controller: _controller5, title: 'House'),
          _form(controller: _controller6, title: 'Email'),
          _form(controller: _controller7, title: 'Birthday'),
        ],
      ),
    );
  }
}
