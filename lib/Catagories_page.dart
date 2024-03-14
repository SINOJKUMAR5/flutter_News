import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Catagories_page extends StatefulWidget {
  Catagories_page({super.key});

  @override
  State<Catagories_page> createState() => _Catagories_pageState();
}

class _Catagories_pageState extends State<Catagories_page> {
  List catagories = [];

  void initState() {
    catagories = get_catagories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: catagories.length,
              itemBuilder: (Buildcontext, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(children: [
                    InkWell(
                      onTap: () async {
                        var text = catagories[index].Catagories_name;
                        print(text);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 10,
                                  blurRadius: 6,
                                  offset: Offset(4, 4)),
                              BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 10,
                                  blurRadius: 8,
                                  offset: Offset(-4, -4))
                            ]),
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            catagories[index].Catagories_image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Center(
                          child: Text(
                        catagories[index].Catagories_name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    )
                  ]),
                );
              }),
        ),
      ],
    );
  }
}

class Catagories_Moduals {
  late String Catagories_name;
  late String Catagories_image;
}

get_catagories() {
  List Catagories = [];

  Catagories_Moduals catagories_moduals = new Catagories_Moduals();

  catagories_moduals.Catagories_name = 'sports';
  catagories_moduals.Catagories_image =
      'https://as1.ftcdn.net/v2/jpg/02/87/04/00/1000_F_287040077_U2ckmhpzeyqDHiybj0dfCfX6NRCEKdoe.jpg';
  Catagories.add(catagories_moduals);

  catagories_moduals = new Catagories_Moduals();

  catagories_moduals.Catagories_name = 'Trading';
  catagories_moduals.Catagories_image =
      'https://as2.ftcdn.net/v2/jpg/05/71/15/59/1000_F_571155945_Aq3wgA5feiCK1I8T3ltpA03ecbx1yJ6K.jpg';
  Catagories.add(catagories_moduals);

  catagories_moduals = new Catagories_Moduals();

  catagories_moduals.Catagories_name = 'Movies';
  catagories_moduals.Catagories_image =
      'https://as2.ftcdn.net/v2/jpg/02/39/24/45/1000_F_239244529_DvA47OXFQic9krRTFm49g9RUDPRTSIJV.jpg';
  Catagories.add(catagories_moduals);

  catagories_moduals = new Catagories_Moduals();

  catagories_moduals.Catagories_name = 'weather';
  catagories_moduals.Catagories_image =
      'https://as1.ftcdn.net/v2/jpg/02/11/52/42/1000_F_211524227_Ett8aboQvVnROAFtqu3S1pW99Y3Th9vm.jpg';
  Catagories.add(catagories_moduals);

  catagories_moduals = new Catagories_Moduals();

  catagories_moduals.Catagories_name = 'Tech';
  catagories_moduals.Catagories_image =
      'https://t3.ftcdn.net/jpg/06/22/96/50/240_F_622965092_LFvjdKD8rsZGg8SLEznwHTr9al94lzth.jpg';
  Catagories.add(catagories_moduals);

  return Catagories;
}
