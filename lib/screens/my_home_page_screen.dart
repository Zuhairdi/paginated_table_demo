import 'package:flutter/material.dart';
import 'package:paginated_datatable_demo/datas/data_table_source.dart';
import 'package:paginated_datatable_demo/models/model.dart';
import 'package:paginated_datatable_demo/services/from_json.dart';
import 'package:paginated_datatable_demo/widgets/PaginatedDataTable.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Model> _entries = [];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      DataServices.readJson('/data.json').then((value) {
        setState(() {
          _entries = value;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DataTable Sample'),
        ),
        body: SingleChildScrollView(
          child: CustomPaginatedDataTable(
            searchEnable: true,
            rowsPerPage: 10,
            showCheckboxColumn: true,
            columns: const <DataColumn>[
              DataColumn(label: Text('No.')),
              DataColumn(label: Text('Firstname')),
              DataColumn(label: Text('Lastname')),
              DataColumn(label: Text('Company')),
              DataColumn(label: Text('Mobile')),
              DataColumn(label: Text('House')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Birthday')),
            ],
            source: DataSource(
              entries: _entries,
              context: context,
            ),
            actions: const [],
            header: const SizedBox(),
            onSelectAll: (select) {
              setState(() {
                for (var element in _entries) {
                  element.selected = select!;
                }
              });
            },
            onPageChanged: (page) {},
            sortColumnIndex: null,
          ),
        ),
      ),
    );
  }
}
