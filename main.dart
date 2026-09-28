import 'dart:io';
import 'kalkulator.dart';

void main() async {
  Kalkulator kalkulator = Kalkulator();

  bool ulangi = true;

  print('====================================');
  print('       APLIKASI KALKULATOR');
  print('====================================');

  while (ulangi) {
    double? bilanganPertama;
    double? bilanganKedua;

    // ==========================================
    // INPUT BILANGAN PERTAMA
    // ==========================================

    while (bilanganPertama == null) {
      try {
        stdout.write('\nMasukkan bilangan pertama: ');
        String? input = stdin.readLineSync();

        if (input == null || input.trim().isEmpty) {
          throw FormatException('Input tidak boleh kosong.');
        }

        bilanganPertama = double.parse(input);
      } on FormatException {
        print('Error: Input harus berupa bilangan yang valid.');
      } catch (e) {
        print('Terjadi kesalahan: $e');
      }
    }

    // ==========================================
    // INPUT BILANGAN KEDUA
    // ==========================================

    while (bilanganKedua == null) {
      try {
        stdout.write('Masukkan bilangan kedua: ');
        String? input = stdin.readLineSync();

        if (input == null || input.trim().isEmpty) {
          throw FormatException('Input tidak boleh kosong.');
        }

        bilanganKedua = double.parse(input);
      } on FormatException {
        print('Error: Input harus berupa bilangan yang valid.');
      } catch (e) {
        print('Terjadi kesalahan: $e');
      }
    }

    // ==========================================
    // MENU OPERASI
    // ==========================================

    print('\nPilih operasi matematika:');
    print('[1] Tambah');
    print('[2] Kurang');
    print('[3] Kali');
    print('[4] Bagi');

    String? pilihan;

    while (true) {
      try {
        stdout.write('Masukkan pilihan (1-4): ');
        pilihan = stdin.readLineSync();

        if (pilihan == null ||
            !['1', '2', '3', '4'].contains(pilihan)) {
          throw FormatException(
            'Pilihan harus berupa angka 1 sampai 4.',
          );
        }

        break;
      } on FormatException catch (e) {
        print('Error: ${e.message}');
      } catch (e) {
        print('Terjadi kesalahan: $e');
      }
    }

    // ==========================================
    // PROSES PERHITUNGAN ASYNCHRONOUS
    // ==========================================

    try {
      double hasil;

      switch (pilihan) {
        case '1':
          hasil = await kalkulator.tambah(
            bilanganPertama,
            bilanganKedua,
          );
          break;

        case '2':
          hasil = await kalkulator.kurang(
            bilanganPertama,
            bilanganKedua,
          );
          break;

        case '3':
          hasil = await kalkulator.kali(
            bilanganPertama,
            bilanganKedua,
          );
          break;

        case '4':
          hasil = await kalkulator.bagi(
            bilanganPertama,
            bilanganKedua,
          );
          break;

        default:
          throw Exception('Pilihan operasi tidak valid.');
      }

      print('\nHasil perhitungan: $hasil');
    } catch (e) {
      print('\nError: $e');
    }

    // ==========================================
    // PERULANGAN
    // ==========================================

    while (true) {
      try {
        stdout.write(
          '\nApakah ingin melakukan perhitungan lagi? (Y/T): ',
        );

        String jawaban =
            (stdin.readLineSync() ?? '').trim().toUpperCase();

        if (jawaban == 'Y') {
          break;
        } else if (jawaban == 'T') {
          ulangi = false;
          break;
        } else {
          throw FormatException(
            'Jawaban hanya boleh Y atau T.',
          );
        }
      } on FormatException catch (e) {
        print('Error: ${e.message}');
      } catch (e) {
        print('Terjadi kesalahan: $e');
      }
    }
  }

  print('\n====================================');
  print('   Terima kasih telah menggunakan');
  print('       Aplikasi Kalkulator');
  print('====================================');
}