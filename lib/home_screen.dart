import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:e_commerce/models/model_keranjang.dart';
import 'package:intl/intl.dart';

final curFormat = NumberFormat.simpleCurrency(locale: "id_ID");

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _listKeranjang = [
      ModelKeranjang(foto: "images/intel-core-i9-11900k.jpg", nama: "Intel Core i9-11900K", harga: 9500000, jumlah: 1),
      ModelKeranjang(foto: "images/RAM DDR4 V-GeN TSUNAMI X 64GB 3000MHz CL16 (2X32GB) RGB-V.jpg", nama: "RAM DDR4 V-GeN TSUNAMI X 64GB 3000MHz CL16 (2X32GB) RGB-V", harga: 4873000, jumlah: 1),
      ModelKeranjang(foto: "images/V-GeN SSD M.2 NVme PCIe Gen4.0x4 2TB - TSUNAMI.jpg", nama: "V-GeN SSD M.2 NVme PCIe Gen4.0x4 2TB - TSUNAMI", harga: 7885000, jumlah: 1),
      ModelKeranjang(foto: "images/VGA Card ASUS GeForce RTX 3090 ROG Strix Gaming OC White 24GB GBDDR6.jpg", nama: "VGA Card ASUS GeForce RTX 3090 ROG Strix Gaming OC White 24GB GBDDR6", harga: 69785000, jumlah: 1),
      ModelKeranjang(foto: "images/Seagate Barracuda 8TB.jpg", nama: "Seagate Barracuda 8TB", harga: 2985000, jumlah: 1),
      ModelKeranjang(foto: "images/MOTHERBOARD MSI Z590 PRO WIFI.jpg", nama: "MOTHERBOARD MSI Z590 PRO WIFI", harga: 3550000, jumlah: 1),
      ModelKeranjang(foto: "images/PCCOOLER GI-CX360 ARGB.jpg", nama: "PCCOOLER GI-CX360 ARGB", harga: 1275000, jumlah: 1),
      ModelKeranjang(foto: "images/MSI MPG A850GF.jpg", nama: "MSI MPG A850GF", harga: 2079000, jumlah: 1),
      ModelKeranjang(foto: "images/Casing ARMAGGEDDON Nimitz TR8000.jpg", nama: "Casing ARMAGGEDDON Nimitz TR8000", harga: 837000, jumlah: 1),
      ModelKeranjang(foto: "images/Mi Curved Gaming Monitor 34.jpg", nama: "Mi Curved Gaming Monitor 34", harga: 6999000, jumlah: 1),
      ModelKeranjang(foto: "images/MSi Vigor GK60.jpg", nama: "MSi Vigor GK60", harga: 940000, jumlah: 1),
      ModelKeranjang(foto: "images/Razer Basilisk Ultimate with Charging Dock.jpg", nama: "Razer Basilisk Ultimate with Charging Dock", harga: 2649000, jumlah: 1),
      ModelKeranjang(foto: "images/Razer Gigantus V2.jpg", nama: "Razer Gigantus V2", harga: 599000, jumlah: 1),
      ModelKeranjang(foto: "images/Arctis Pro Wireless Black Gaming Headset.jpg", nama: "Arctis Pro Wireless Black Gaming Headset", harga: 5750000, jumlah: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Keranjang Belanja",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(10),
            children: _listKeranjang.map((keranjang) {
            return Card(
                color: Colors.lightGreen.shade100,
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                            image: AssetImage(keranjang.foto),
                          )
                        )
                      ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: SizedBox(
                        height: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                          children: [
                            Text(
                                keranjang.nama,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                                "${curFormat.format(keranjang.harga)}",
                                style: TextStyle(
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                            Text(
                                "Jumlah ${keranjang.jumlah}",
                                style: TextStyle(
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ),
                            ElevatedButton(
                              onPressed: () async {
                                var result = await Navigator.of(context).pushNamed(
                                  '/detail',
                                  arguments: {
                                    'keranjang': keranjang,
                                    },
                                  );

                                  _handleNavResult(result, keranjang);
                              },
                              // autofocus: true,
                              child: const Text(
                                  "Lihat Detail",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                )
                            ),
                          ],
                        )
                      )
                    )
                  ],
                )
              );
            }).toList(),
          ),
        ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: _HomeScreenBottomBar(
          total: _listKeranjang.map((keranjang) => keranjang.harga * keranjang.jumlah).reduce((a, b) => a + b),
        ),
      ),
    );
  }

  void _handleNavResult(Object? result, ModelKeranjang keranjang) {
    if (result != null) {
      var resultMap = result as Map<String, Object>;
      if (resultMap.containsKey('jumlahBarang')) {
        var jumlahBarang = resultMap['jumlahBarang'];
        if (jumlahBarang is int) {
          int _jumlahBarang = jumlahBarang;
          var index = _listKeranjang.indexOf(keranjang);
          if (index >= 0) {
            setState(() {
              _listKeranjang[index] = ModelKeranjang(
                jumlah: _jumlahBarang, nama: keranjang.nama, foto: keranjang.foto, harga: keranjang.harga,
              );
            });
          }
        }
      }
    }
  }
}

class _HomeScreenBottomBar extends StatelessWidget {
  const _HomeScreenBottomBar({
    this.total = 0,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightGreen,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "TOTAL",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              )
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "${curFormat.format(total)}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ),
          ],
        ),
    );
  }

}
