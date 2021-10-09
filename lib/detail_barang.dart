import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:e_commerce/models/model_keranjang.dart';
import 'package:intl/intl.dart';

final curFormat = NumberFormat.simpleCurrency(locale: "id_ID");

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int jumlahBarang = -1;
  ModelKeranjang? _keranjang;

  void _incrementCounter() {
    setState(() {
      jumlahBarang++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (jumlahBarang != 0) {
        jumlahBarang--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    if (args.containsKey('keranjang')) {
      var keranjang = args['keranjang'];
      if (keranjang is ModelKeranjang) {
        _keranjang = keranjang;
        if (jumlahBarang < 1) {
          jumlahBarang = _keranjang?.jumlah ?? -1;
        }
      }
    }
    return (
      Scaffold(
        appBar: AppBar(
          title: Text(
            "Detail Barang",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 350,
                height: 350,
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image(
                    image: AssetImage(_keranjang?.foto ?? 'images/error.jpg'),
                  )
                )
              ),
              Text(
                _keranjang?.nama ?? 'Error',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  overflow: TextOverflow.fade,
                ),
              ),
              SizedBox(height: 25,),
              Text(
                "${curFormat.format(_keranjang?.harga ?? 0)}",
                style: TextStyle(
                  fontSize: 18,
                )
              ),
              Text(
                "Deskripsi Barang",
                style: TextStyle(
                  fontSize: 18,
                  overflow: TextOverflow.fade,
                )
              ),
              SizedBox(height: 25,),
              Text(
                "Jumlah",
                style: TextStyle(
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.lightGreen,
                    child: IconButton(
                      onPressed: _decrementCounter,
                      icon: Icon(
                        Icons.remove,
                        size: 35,
                        color: Colors.black,
                      ),
                    )
                  ),
                  Text(
                    "$jumlahBarang",
                    style: TextStyle(
                      fontSize: 35,
                      overflow: TextOverflow.ellipsis,
                    )
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    color: Colors.lightGreen,
                    child: IconButton(
                      onPressed: _incrementCounter,
                      icon: Icon(
                        Icons.add,
                        size: 35,
                        color: Colors.black,
                        ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      {
                        'jumlahBarang' : jumlahBarang
                      }
                    );
                  },
                  child: const Text(
                    "Konfirmasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}