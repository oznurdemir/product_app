import 'package:flutter/material.dart';
import 'package:product_app/data/entity/products.dart';
import 'package:product_app/ui/views/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Products>> loadProducts() async{
    var productsList = <Products>[];
    var p1 = Products(id: 1, name: "Macbook Pro 14", image: "bilgisayar.png", price: 43000);
    var p2 = Products(id: 2, name: "Rayban Club Master", image: "gozluk.png", price: 5000);
    var p3 = Products(id: 3, name: "Sony ZX Series", image: "kulaklik.png", price: 7600);
    var p4 = Products(id: 4, name: "Gio Armani", image: "parfum.png", price: 1200);
    var p5 = Products(id: 5, name: "Casio X Series", image: "saat.png", price: 760);
    var p6 = Products(id: 6, name: "Dyson V8", image: "supurge.png", price: 45000);
    var p7 = Products(id: 7, name: "Iphone 13", image: "telefon.png", price: 55000);
    productsList.add(p1);
    productsList.add(p2);
    productsList.add(p3);
    productsList.add(p4);
    productsList.add(p5);
    productsList.add(p6);
    productsList.add(p7);
    return productsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"),),
      body: FutureBuilder<List<Products>>(
        future: loadProducts(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var productsList = snapshot.data;
            return ListView.builder(
              itemCount: productsList!.length, // bu sayfa için yedi dönecek.
                itemBuilder: (context, index){ // 0,1,2,3,4,5,6
                  var product = productsList[index];
                  return GestureDetector(
                    onTap: (){
                      //Tıklandıktan sonra olacaklar
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(product: product,)));
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox( width: 128, height: 128,
                                child: Image.asset("images/${product.image}"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name),
                                const SizedBox(height: 10), //Yatayda 10 birimlik boşluk bırakacak.
                                Text("${product.price} ₺", style: const TextStyle(fontSize: 20),),
                                const SizedBox(height: 10), //Yatayda 10 birimlik boşluk bırakacak.
                                ElevatedButton(onPressed: (){
                                  print("${product.name} sepete eklendi.");
                                }, child: const Text("Sepete Ekle")),
                              ],
                            ),
                          )
                        ]
                      ),
                    ),
                  );
                }
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
