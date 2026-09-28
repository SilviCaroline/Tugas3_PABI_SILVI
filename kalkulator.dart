class Kalkulator {
  // Method asynchronous untuk penjumlahan
  Future<double> tambah(double a, double b) async {
    return a + b;
  }

  // Method asynchronous untuk pengurangan
  Future<double> kurang(double a, double b) async {
    return a - b;
  }

  // Method asynchronous untuk perkalian
  Future<double> kali(double a, double b) async {
    return a * b;
  }

  // Method asynchronous untuk pembagian
  Future<double> bagi(double a, double b) async {
    if (b == 0) {
      throw Exception('Pembagian dengan nol tidak diperbolehkan.');
    }

    return a / b;
  }
}