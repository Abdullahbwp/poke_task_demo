import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/poke_model.dart';


class PokeDetailView extends StatelessWidget {
  final Map map;
  const PokeDetailView({super.key, required this.map});

  @override
  Widget build(BuildContext context) {

    Ability ability = map['ability'];
    List<Types> types = map['types'];
    int height = map['height'];
    int width = map['width'];

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title:  Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
           ability.name??'',
            style:const  TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Height: $height"),
             Text("Width: $width"),
            const Text("Image"),
            Expanded(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl:  ability.url??'' ,
                placeholder: (context, url) =>
                const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
           const Text("Types"),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: types.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      leading: SizedBox(
                        height: 70,
                        width: 70,
                        child: CachedNetworkImage(
                          imageUrl: types[index].type!.url ?? '',
                          placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                      title: Text(types[index].type!.name ?? ''),
                    );
                  })
            )
          ],

      )),
    );
  }
}
