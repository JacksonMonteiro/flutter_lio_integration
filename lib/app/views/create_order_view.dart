import 'package:flutter/material.dart';

class CreateOrderView extends StatefulWidget {
  static const routerName = "/create";
  const CreateOrderView({super.key});

  @override
  State<CreateOrderView> createState() => _CreateOrderViewState();
}

class _CreateOrderViewState extends State<CreateOrderView> {
  List products = [
    {"nome": "Arroz 101", "descrição": "Igual a ele não tem nenhum", "preço": 3.99},
    {"nome": "Rexona", "descrição": "Não te abanadona", "preço": 5.99},
    {"nome": "Heineken", "descrição": "A cerveja oficial da UEFA Champions League", "preço": 7.49},
  ];


  @override
  Widget build(BuildContext context) {
    final mQuery = MediaQuery.of(context);
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: mQuery.size.width,
                  height: mQuery.size.height * 0.2,
                  child: Image.asset(
                    "assets/images/banner.png",
                    fit: BoxFit.cover,),
                ),
                Positioned(
                  top: mQuery.size.height * 0.12,
                  child: SizedBox(
                    width: mQuery.size.width,
                    height: mQuery.size.height * 0.15,
                    child: Image.asset('assets/images/profile.png'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mQuery.size.height * 0.12,
            ),
            const Text("Mercado GFX", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.06),
              child: Column(
                children: [
                  const SizedBox(height: 8,),
                  const Text("Aqui você encontra todos os produtos com os melhores preços. A Solução para seu Conforto é Economia!",
                  style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 8,),
                  const Divider(
                    color: Colors.blue,
                    thickness: 1,
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: mQuery.size.width * 0.4,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.grey,
                                spreadRadius: 1
                              )
                            ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/images/arroz.png",
                                width: double.infinity),
                              const Text("Arroz 101", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              const SizedBox(height: 8,),
                              Text("Igual a ele não tem nenhum", style: TextStyle(fontSize: 14, color: Colors.grey[500]),),
                              const SizedBox(height: 8,),
                              const Text("R\$ 3.99", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
