import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/src/poke/bloc/poke_bloc.dart';
import 'package:task_demo/src/poke/bloc/poke_event.dart';
import 'package:task_demo/src/poke/bloc/poke_states.dart';
import 'package:task_demo/src/poke/model/poke_model.dart';
import '../../../service/navigation/locator.dart';
import '../../../service/navigation/navigation_service.dart';
import '../../../service/navigation/router_path.dart';

class PokeView extends StatefulWidget {
  const PokeView({super.key});

  @override
  State<PokeView> createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  late NavigationService _navigationService;

  @override
  void initState() {
    super.initState();
    _navigationService = locator<NavigationService>();

    context.read<PokeBloc>().add(FetchPokeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding:  EdgeInsets.only(left: 15),
          child: Text(
            "Abilities",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: BlocBuilder<PokeBloc, PokeState>(
          builder: (BuildContext context, state) {
            switch (state.status) {
              case PokeStatus.initial:
                return const SizedBox();
              case PokeStatus.loading:
                return const Center(child: CupertinoActivityIndicator());
              case PokeStatus.failure:
                return Center(child: Text(state.msg));
              case PokeStatus.success:
                {
                  List<Abilities> list = state.abilities;
                  List<Types> types = state.types;

                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          onTap: () {
                            try {


                              List<Types> type = types
                                  .where((element) =>
                                      element.slot == list[index].slot)
                                  .toList();

                              var map = {
                                "height": state.height,
                                "width": state.weight,
                                "ability": list[index].ability,
                                "types": type,
                              };

                              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> PokeDetailView(map: map,)));
                              _navigationService.navigateTo(pokeDetailPage,
                                  arguments: map);
                            } catch (e) {
                              if (kDebugMode) {
                                print(e.toString());
                              }
                            }
                          },
                          leading: SizedBox(
                            height: 70,
                            width: 70,
                            child: CachedNetworkImage(
                              imageUrl: list[index].ability!.url ?? '',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          title: Text(list[index].ability?.name ?? ''),
                        );
                      });
                }
            }
          },
        ),
      ),
    );
  }
}
