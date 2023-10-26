import 'dart:io';

void main() {
  while (true) {
    print('İşlem tipini seçiniz:');
    print('1- addition');
    print('2- Çıkarma');
    print('3- Çarpma');
    print('4- Bölme');
    print('5- Çıkış');

    String choice = stdin.readLineSync()!;

    if (choice == '5') {
      print('Programdan çıkılıyor.');
      break;
    }

    if (choice != '1' && choice != '2' && choice != '3' && choice != '4') {
      print('Geçersiz işlem seçimi. Lütfen tekrar deneyin.');
      continue;
    }

    print('İlk sayıyı giriniz:');
    double number1 = double.parse(stdin.readLineSync()!);

    print('İkinci sayıyı giriniz:');
    double number2 = double.parse(stdin.readLineSync()!);

    double number3 = 1.0;

    if (choice == '3') {
      print('Üçüncü sayıyı giriniz (opsiyonel):');
      String enteredNumber = stdin.readLineSync()!;
      if (enteredNumber.isNotEmpty) {
        number3 = double.parse(enteredNumber);
      }
    }

    double sonuc = 0.0;

    if (choice == '1') {
      sonuc = addition(number1, number2);
    } else if (choice == '2') {
      sonuc = subtraction(number1, number2);
    } else if (choice == '3') {
      sonuc = multiplication(number1, number2, number3);
    } else if (choice == '4') {
      if (number2 == 0) {
        print('Sıfıra bölemezsiniz. İşlem iptal edildi.');
        continue;
      }
      sonuc = division(number1, number2: number2);
    }

    print('Sonuç: $sonuc');
  }
}

double addition(double number1, double number2) {
  return number1 + number2;
}

double subtraction(double number1, double number2) {
  return number1 - number2;
}

double multiplication(double number1, double number2, [double number3 = 1.0]) {
  return number1 * number2 * number3;
}

double division(double number1, {required double number2}) {
  if (number2 == 0) {
    throw ArgumentError('Sıfıra bölme hatası.');
  }
  return number1 / number2;
}
