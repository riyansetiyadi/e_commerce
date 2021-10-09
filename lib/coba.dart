void main() {
  var _listKeranjang = [
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "Intel Core i9-11900K", harga: 9500000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "RAM DDR4 V-GeN TSUNAMI X 64GB 3000MHz CL16 (2X32GB) RGB-V", harga: 4873000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "V-GeN SSD M.2 NVme PCIe Gen4.0x4 2TB - TSUNAMI", harga: 7885000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "VGA Card ASUS GeForce RTX 3090 ROG Strix Gaming OC White 24GB GBDDR6", harga: 69785000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "Seagate Barracuda 8TB 256MB Cache SATA 6.0Gb/s 3. ST8000DM004", harga: 2985000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "MOTHERBOARD MSI Z590 PRO WIFI", harga: 3550000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "PCCOOLER GI-CX360 ARGB", harga: 1275000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "MSI MPG A850GF", harga: 2079000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "Casing ARMAGGEDDON Nimitz TR8000", harga: 837000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "Mi Curved Gaming Monitor 34", harga: 6999000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "MSi Vigor GK60", harga: 940000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "Razer Basilisk Ultimate with Charging Dock", harga: 2649000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "Razer Gigantus V2", harga: 599000, jumlah: 1),
      ModelKeranjang(id: 1, foto: "images/intel-core-i9-11900k.jpg", nama: "Arctis Pro Wireless Black Gaming Headset", harga: 5750000, jumlah: 1),
  ];

  print(_listKeranjang.map((keranjang) => keranjang.harga * keranjang.jumlah).reduce((a, b) => a + b));
}

class ModelKeranjang {
  final String foto, nama;
  final int id, harga, jumlah;
  
  ModelKeranjang({
    required this.id,
    required this.foto,
    required this.nama,
    required this.harga,
    required this.jumlah,
  });
}