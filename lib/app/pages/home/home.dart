import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/app/bloc/bank/bank_bloc.dart';
import 'package:test/app/bloc/bank/bank_events.dart';
import 'package:test/app/bloc/bank/bank_state.dart';
import 'package:test/app/models/bank_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: const <Widget>[
          // BankTheme(),
          BankBody(),
          BankBar(),
        ],
      ),
    );
  }
}

class BankBar extends StatefulWidget {
  const BankBar({Key? key}) : super(key: key);

  @override
  State<BankBar> createState() => _BankBarState();
}

class _BankBarState extends State<BankBar> {
  final _bankController = TextEditingController();
  late BankBloc _bankBloc;

  @override
  void initState() {
    super.initState();
    _bankBloc = context.read<BankBloc>();
  }

  @override
  void dispose() {
    _bankController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.green,
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            child: const Center(
              child: Text(
                "Credifit - Fase 2",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
          Positioned(
            top: 80.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 1.0),
                    color: Colors.white),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        print("your menu action here");
                        // _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: _bankController,
                        autocorrect: false,
                        onChanged: (text) {
                          _bankBloc.add(
                            TextChanged(text: text),
                          );
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter a search bank',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.green,
                      ),
                      onPressed: _onClearTapped,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onClearTapped() {
    _bankController.text = '';
    _bankBloc.add(const TextChanged(text: ''));
  }
}

class BankBody extends StatelessWidget {
  const BankBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
      height: height,
      width: width,
      // color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BankBloc, BankState>(
              builder: (context, state) {
                if (state is BankStateLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is BankStateError) {
                  return Text(state.error);
                }
                if (state is BankStateSuccess) {
                  return state.items.isEmpty
                      ? const Text('No Results')
                      : Expanded(child: BankResults(items: state.items));
                }
                return const Text('Please enter a term to begin');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BankResults extends StatelessWidget {
  const BankResults({Key? key, this.items}) : super(key: key);

  final List<BankModel>? items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: items!.length,
        itemBuilder: (BuildContext context, int index) {
          return BankResultItem(item: items![index]);
        },
      ),
    );
  }
}

class BankResultItem extends StatelessWidget {
  const BankResultItem({Key? key, required this.item}) : super(key: key);

  final BankModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: ClipOval(
          // child: Text(item.fullName),
          child: item.owner.avatarUrl.isEmpty
              ? Image.asset('assets/images/avatar.png')
              : Image.network(item.owner.avatarUrl),
        ),
        title:
            item.fullName.isEmpty ? const Text("Empty") : Text(item.fullName),
        onTap: () {},
      ),
    );
  }
}