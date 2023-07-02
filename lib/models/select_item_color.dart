import 'dart:ui';

import 'package:flutter/material.dart';

class ItemColor {
  late String? productName;
  late List<Color> colors= <Color>[];
  late List<String> images=<String>[];

  List<Color> itemColors(String productName){
    // == to compare two strings in dart
    this.productName=productName;
      if(productName=='HP Intel core i7' || productName=='اتش بي كور أي7'){
        colors=[Colors.grey.shade100,Colors.black];
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXKDLVMMktEFOQJOsZW8Pvadmm50prYuBpYQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShsxngqLOn30kiYG-k5MuH7zYMFYQOCRAV6w&usqp=CAU'
        ];
      }else if(productName=='iPad Pro Max' || productName=='أيباد برو ماكس'){
        colors=[Colors.grey.shade100,Colors.grey.shade800];
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVSBdUfsI7ye8uo7Ufa3e5fuZU9rsOocPBdQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0lLutozQpUJtb7OttrfyF1TFRqC_4qZhyKQ&usqp=CAU'
        ];
      }else if(productName=='Apple Watch SE' || productName=='ساعة أبل اس اي'){
        colors=[Colors.black,Colors.blue.shade800,Colors.white,Colors.red,
          Colors.pink.shade100,Colors.deepOrangeAccent,Colors.yellow];
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQktypcQ9_IaB12MOUbuaus--l9kZ5uCo0BuQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFlpZW3HDcUHnJKyWi7bx3Y2liRJOMfA66SA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPOPwxLSkq7GblEwUYZv7IAT0cPwQqTKjotw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3RjYaskkANn9rB2guVg-F22LrgEgKS1ShVA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvaxt-vj3QABuhprvYLK7QzTGVySCgDjmUVw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ7XeEn7vcrgaloZUB3pg_EXLDNnn6AZK3LQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5rJ1wrJv_QniB7Bi7uoqc18kNSVNp4PhP9g&usqp=CAU'
        ];
      }else if(productName=='Samsung S22 Ultra' || productName=='سامسونج اس22 الترا'){
        colors=[Color(0xFF85586F),Colors.black,Colors.white,Color(0xFF417D7A),Colors.red.shade900];
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIC1TlSI8D60e8WkRiFgZMy1TLABe2Ngmzhg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFCJ_TaTaS_nasba74qVaN_HHzf3GHpMDrQA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQghsUve94gwdKEQuD1McoxzoMFecQeYP1S5g&usqp=CAU'
        ];
      }else if(productName=='iPhone 13 Pro Max' || productName=='ايفون 13 برو ماكس'){
        colors=[Colors.grey.shade900,Color(0xFF8FBDD3),Color(0xFFF6E7D8),Color(0xFFF5F5F5)];
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHhzVe5WSFoBLCJGjyrm4YDtTb-X-TENhVrw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5ABbX5-WlK_GATBDhT083flGOB7cHCkkyEA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-eNAX8D76FqvreGDVHIZqcsBCza-sLFqXtw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9LXpJ6s2beBCXDMYaPtFGeR505ZzXY_oTaEEP8dxpRyu3IM6SVUMMGv70e7tTEFx7WTI&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm0kcz69w4XmUofIoJOr9mnXBw4B739xigBw&usqp=CAU',
        ];
      }else if(productName=='HP OMEN' || productName=='اتش بي اومن'){
        colors=[Colors.black,Colors.grey.shade100];
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0ursOXxY9xSVekpasc9iBNyGJZ_xT9zpqvQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ6XXmDe25Ag71E5krlRs6MvasinyEc5chjw&usqp=CAU'
        ];
      }else if(productName=='Tab S8 Ultra' || productName=='تابليت اس8 الترا'){
        colors=[Colors.black,Colors.grey.shade100,Color(0xFFFDEBED)];
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BEqVwUqUY0oJbGZsX5ZYGvD8JiixVK3Bzg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaNSO1j09sHYo2L-9Vq1cR__cDYO8qU78DN-03wOyyECJS6yqOPbjO9ns5Y0BMY-DOWxE&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_-NobWGycTfo1Vo40ZIKOFZFheLlbuDd1lj43ugg87Mex6Ut7pp2tqCp-ZnRLW2uIirU&usqp=CAU'
        ];
      }else if(productName=='Vivo X80 Pro' || productName=='فيفو اكس80 برو'){
        colors=[Colors.black,Color(0xFFFF7B54),Color(0xFFB9F3FC)];
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl9PEk7KYS34J507WFK9Dx8gj9ksSLiSUM1A&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxR3g5vPxBUJcAK6pmi5D83Wl6XWVX9zP7og&usqp=CAU'
        ];
      }else if(productName=='iPad Air' || productName=='أيباد اير'){
        colors=[Colors.grey.shade100,Colors.grey.shade800,Color(0xFFF5EBE0),Color(0xFF43919B),Color(0xFFA8A4CE)];
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNPc7-3J-7YyOKzc_0bx4yNk_zJ5xR7C_Y2Q&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3OqkW9SGGlzg1mm5klvTvjoRsl--wpYZlVah4VAG1ekO_Ew8SmdfUHoKDiHDrS9_jSjM&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReef_u0vAQMjoGbZHaawocbkKuOD6lGp17MUI-gvsIPqMj78O4mQxxpDpPgGeT0KEsQpc&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv2nByld3yICjPTMvvqdi1hQnOTZBgAZudir94a-roRtF4hAAnIIaPh71JlZR_PjE8rwY&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMf36B47kRy6RIYkOXVJ347OxTX4ENJpi1qDkDa-tArk4S24A-CFxmOGMRYek8ovurXbY&usqp=CAU'
        ];
      }else if(productName=='HP Envy 13' || productName=='اتش بي انفي 13'){
        colors=[Colors.black,Colors.grey.shade100];
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7J4pJCSZMclCcFRVcVGU25awNsvPYAM1pPg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROOf5_Nt8Y1ByxheDN6lQBDh1KkWdNRL8cbw&usqp=CAU'
        ];
      }else if(productName=='Google Pixel 6a' || productName=='جوجل بكسل6 اي'){
        colors=[Color(0xFFA5C9CA),Colors.grey.shade900,Colors.white];
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHscN-1ZQHwP__g20797Mng3jgF1l4uekJxw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRU4euowc2qitO6MM_1trHjz5zzqxcrA2rag&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaBE9iw1qGqTt1X-wsca9CzPGMCEEvmYUUxdg4eaA5sTk2fVvzPG7x7Q1KDpYFIhLr1yk&usqp=CAU'
        ];
      }else if(productName=='MacBook Pro' || productName=='ماك بوك برو'){
        colors=[Colors.grey.shade800,Colors.grey.shade200];
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxCpuW4SGkEsT0uo_w7i9V3XC1JpfM-nMwAQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO5FIb4sqIm1YSH3zlOVD7SpxNoIIyQkQeig&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2GZN7dR9pSWIVKaKNxYH83PkSeca8DPVLrw&usqp=CAU'
        ];
      }else if(productName=='AirPods Pro' || productName=='اير بود برو'){
        colors=[Colors.white];
      }else if(productName=='HP Chromebook' || productName=='اتش بي كروم بوك'){
        colors=[Color(0xFF90A17D),Colors.grey.shade100,Colors.grey.shade900,Color(0xFF0E5E6F)];
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgiM3gh5TvyQL5MoCNLBWHyE6HTpFZ5YXIXQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm5xv01UEvZ1O9GrGsaep_a-eSTi02uMl-n9mzz6jyX1SSSH5w2Y99jdDWCmUc3qrz7C4&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGQWQsldk2h--hrDYj5rmW7TFArPEYTNS7JA&usqp=CAU'
        ];
      }else if(productName=='iPad 10th gen' || productName=='أيباد الجيل العاشر'){
        colors=[Color(0xff6096B4),Color(0xFFFFEA20),Color(0xFFECECEC),Color(0xFFFF8080)];
      }else if(productName=='iPad 9th gen' || productName=='أيباد الجيل التاسع'){
        colors=[Colors.grey.shade100,Colors.grey.shade800];
      }else if(productName =='iPad mini' || productName=='أيباد ميني'){
        colors=[Color(0xFFFFE1E1),Color(0xFFA8A4CE),Color(0xFFF0EBE3),Color(0xFF4B5D67)];
      }else if(productName=='MacBook Air M1 chip' || productName=='ماك بوك اير m1'){
        colors=[Colors.grey.shade100,Colors.grey.shade800, Color(0xFFF0DBDB)];
      }else if(productName=='MacBook Air M2 chip' || productName=='ماك بوك اير m2'){
        colors=[Colors.black,Colors.grey.shade100,Colors.grey.shade800, Color(0xFFEDE6DB)];
      }else if(productName=='iMac' || productName=='أي ماك'){
        colors=[Color(0xFF153462),Color(0xFF1D5C63),Color(0xFFFFEA20),Color(0xFFFF8B13),Colors.red.shade500,Color(0xFF51557E)];
      }else if(productName=='Mac mini' || productName=='ماك ميني'){
        colors=[Colors.grey.shade400];
      }else if(productName=='iPhone 14 Pro' || productName=='ايفون 14 برو'){
        colors=[Color(0xff4C3A51),Colors.grey.shade100,Color(0xFFE4DCCF),Colors.grey.shade900];
      }else if(productName=='iPhone 14' || productName=='ايفون 14'){
        colors=[Colors.red.shade600,Colors.grey.shade800,Colors.grey.shade100,Color(0xFFD3CEDF),Color(0xFFE4DCCF)];
      }else if(productName=='iPhone SE' || productName=='ايفون اس اي'){
        colors=[Colors.red.shade800,Colors.grey.shade100,Colors.grey.shade900];
      }else if(productName=='Apple Watch Series 8' || productName=='ساعة أبل8'){
        colors=[Colors.red.shade700,Colors.black,Colors.grey.shade100,Color(0xffF2D7D9),Color(0xFFFF7700)];
      }else if(productName=='Apple Watch Ultra' || productName=='ساعة أبل الترا'){
        colors=[Color(0xFFF66B0E),Colors.grey.shade100,Color(0xFF434242)];
      }else if(productName=='Samsung s23 Ultra' || productName=='سامسونج اس23 الترا'){
        colors=[Color(0xFFFEFCF3),Color(0xFFF0DBDB),Color(0xFF698269),Colors.grey.shade800,Color(0xFF85586F)];
      }else if(productName=='Samsung Z Fold 4' || productName=='سامسونج زد فولد4'){
        colors=[Color(0xFFFFFBEB),Colors.grey.shade900,Color(0xFF4B5D67),Color(0xFF85586F)];
      }else if(productName=='Asus Zenfone 9' || productName=='أسوس زنفولد9'){
        colors=[Color(0xffF5EBE0),Color(0xFF5584AC),Colors.red.shade800];
      }else if(productName=='Tab A7' || productName=='تابليت اي7'){
        colors=[
          Colors.grey.shade800,Colors.grey.shade400
        ];
      }else if(productName=='Tab S7' || productName=='تابليت اس7'){
        colors=[Colors.grey.shade800,Colors.grey.shade400,Color(0xFFFFD4D4),Color(0xFF4B6587)];
      }else if(productName=='Tab A8' || productName=='تابليت اي8'){
        colors=[Colors.grey.shade800,Colors.grey.shade300,Color(0xFFFFE1E1)];
      }else if(productName=='HP Intel core i9' || productName=='اتش بي كور أي9'){
        colors=[Colors.grey.shade900,Colors.grey.shade300];
      }else if(productName=='KEF Q950 FLOORSTANDING SPEAKER' || productName=='كي اي اف كيو950 مكبرات الصوت الدائمة'){
        colors=[Colors.black,Colors.grey.shade100];
      }else if(productName=='Bowers & Wilkins PX7 S2' || productName=='بورز اند ويلكينز بي اكس7 اس2'){
        colors=[Color(0xffF7F6F2),Color(0xff4B6587),Colors.black,];
      }else if(productName=='USB LED Lights' || productName=='يو اس بي ليد لايت'){
        colors=[Color(0xff257AA6),Color(0xffB3FFAE),Color(0xffF9F9F9),Color(0xffFD841F),Color(0xffDC3535)];
      }
      return colors;
    }

    List<String> itemImages(String productName){
      this.productName=productName;
      if(productName=='HP Intel core i7' || productName=='اتش بي كور أي7'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXKDLVMMktEFOQJOsZW8Pvadmm50prYuBpYQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShsxngqLOn30kiYG-k5MuH7zYMFYQOCRAV6w&usqp=CAU'
        ];
      }else if(productName=='iPad Pro Max' || productName=='أيباد برو ماكس'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVSBdUfsI7ye8uo7Ufa3e5fuZU9rsOocPBdQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu_GLFcwDfHK5kuQgv1ERCx3V5za47ywW5CA&usqp=CAU'
        ];
      }else if(productName=='Apple Watch SE' || productName=='ساعة أبل اس اي'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQktypcQ9_IaB12MOUbuaus--l9kZ5uCo0BuQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFlpZW3HDcUHnJKyWi7bx3Y2liRJOMfA66SA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPOPwxLSkq7GblEwUYZv7IAT0cPwQqTKjotw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3RjYaskkANn9rB2guVg-F22LrgEgKS1ShVA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvaxt-vj3QABuhprvYLK7QzTGVySCgDjmUVw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ7XeEn7vcrgaloZUB3pg_EXLDNnn6AZK3LQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5rJ1wrJv_QniB7Bi7uoqc18kNSVNp4PhP9g&usqp=CAU'
        ];
      }else if(productName=='Samsung S22 Ultra' || productName=='سامسونج اس22 الترا'){
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIC1TlSI8D60e8WkRiFgZMy1TLABe2Ngmzhg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFCJ_TaTaS_nasba74qVaN_HHzf3GHpMDrQA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQghsUve94gwdKEQuD1McoxzoMFecQeYP1S5g&usqp=CAU'
        ];
      }else if(productName=='iPhone 13 Pro Max' || productName=='ايفون 13 برو ماكس'){
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHhzVe5WSFoBLCJGjyrm4YDtTb-X-TENhVrw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMZtvgEq03fAvLZmkafN0sCLJSyLY8TsRHK4WRI_bgIUEQcIZMzhR_ZbIss5lYsyP82qw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-eNAX8D76FqvreGDVHIZqcsBCza-sLFqXtw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRagtVk6YsarIQH1q3eselQeTje_cvXo_OQBRh7CnFzbfPZsA9_o8ovDc_filUdlb4CoLE&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiXpvgaOyX1QCRdn6kiBMQysiE0sjRN6sTuQ&usqp=CAU',
        ];
      }else if(productName=='HP OMEN' || productName=='اتش بي اومن'){
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0ursOXxY9xSVekpasc9iBNyGJZ_xT9zpqvQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ6XXmDe25Ag71E5krlRs6MvasinyEc5chjw&usqp=CAU'
        ];
      }else if(productName=='Tab S8 Ultra' || productName=='تابليت اس8 الترا'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BEqVwUqUY0oJbGZsX5ZYGvD8JiixVK3Bzg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaNSO1j09sHYo2L-9Vq1cR__cDYO8qU78DN-03wOyyECJS6yqOPbjO9ns5Y0BMY-DOWxE&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL4aFX5nZwTOaW1wF_9QIiBeDfq8ktwMbUKA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8Z5gvF5XSD9kDf7kXt0QToHdiYq8ApCEssA&usqp=CAU'
        ];
      }else if(productName=='Vivo X80 Pro' || productName=='فيفو اكس80 برو'){
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl9PEk7KYS34J507WFK9Dx8gj9ksSLiSUM1A&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxR3g5vPxBUJcAK6pmi5D83Wl6XWVX9zP7og&usqp=CAU'
        ];
      }else if(productName=='iPad Air' || productName=='أيباد اير'){
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNPc7-3J-7YyOKzc_0bx4yNk_zJ5xR7C_Y2Q&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3OqkW9SGGlzg1mm5klvTvjoRsl--wpYZlVah4VAG1ekO_Ew8SmdfUHoKDiHDrS9_jSjM&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReef_u0vAQMjoGbZHaawocbkKuOD6lGp17MUI-gvsIPqMj78O4mQxxpDpPgGeT0KEsQpc&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv2nByld3yICjPTMvvqdi1hQnOTZBgAZudir94a-roRtF4hAAnIIaPh71JlZR_PjE8rwY&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMf36B47kRy6RIYkOXVJ347OxTX4ENJpi1qDkDa-tArk4S24A-CFxmOGMRYek8ovurXbY&usqp=CAU'
        ];
      }else if(productName=='HP Envy 13' || productName=='اتش بي انفي 13'){
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7J4pJCSZMclCcFRVcVGU25awNsvPYAM1pPg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROOf5_Nt8Y1ByxheDN6lQBDh1KkWdNRL8cbw&usqp=CAU'
        ];
      }else if(productName=='Google Pixel 6a' || productName=='جوجل بكسل6 اي'){
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHscN-1ZQHwP__g20797Mng3jgF1l4uekJxw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAFfKlfyqXmaruScrv0mhQqwXO0TmohBdJxg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeeUCDkBGf90m8P-BTrxjCD2bao6DTOcoi4A&usqp=CAU'
        ];
      }else if(productName=='MacBook Pro' || productName=='ماك بوك برو'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2YZ70O_-FG8F7Qn1IYn3K2BM3ntCYOGA3fCdG340_jzPtk4zWwOVS2-wO_jTUt1f4qd4&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO5FIb4sqIm1YSH3zlOVD7SpxNoIIyQkQeig&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2GZN7dR9pSWIVKaKNxYH83PkSeca8DPVLrw&usqp=CAU'
        ];
      }else if(productName=='AirPods Pro' || productName=='اير بود برو'){
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC-l8oPwveZdbBnCqEvaQrFoc-fHNmFXbKKQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRro7b98FX6rJjvZXRvqFZDvxrQ1Eq4cDTS9w&usqp=CAU',
          'https://cdn.salla.sa/xLHtuAj3cxUPSJaygWy9JtnHsDasqMTluSSV1Xgt.jpeg'
        ];
      }else if(productName=='HP Chromebook' || productName=='اتش بي كروم بوك') {
        images = [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgiM3gh5TvyQL5MoCNLBWHyE6HTpFZ5YXIXQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm5xv01UEvZ1O9GrGsaep_a-eSTi02uMl-n9mzz6jyX1SSSH5w2Y99jdDWCmUc3qrz7C4&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGQWQsldk2h--hrDYj5rmW7TFArPEYTNS7JA&usqp=CAU'
        ];
      }else if(productName=='iPad 10th gen' || productName=='أيباد الجيل العاشر'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2Wi1FhNLHuB4-aseDoycIiNeCx0cdaA_BnA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYb3w0ShSWqv8wdSDBwVvq8t80-U1Ab8iGyAngdRVUhNYpSimS2J9b0LlZfDf-gS5B_Gw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvRVRYieJpUHF5ydu8-ReH1zpeun2rs5O_qA_nYCns8OXIEZmXTUEgVA_FzFma2dkdyDU&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuYmooncoYWBny1i25_kZqt6WuJGfATa-pxEpVCvGOT2KYGNlr0mouYv0-QjjvJty3yss&usqp=CAU'
        ];
      }else if(productName=='iPad 9th gen' || productName=='أيباد الجيل التاسع'){
        images=['https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_CJ2I7uGc520cFtmfTI1mz7tNy4J6Iet_HD7mNhHeobUif5TCT2kb7tQdW-k1YK4VK7Q&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdRxHoHjI5ARDkK7yUcKMAOx0ltjKSISGK4pGx0b7wDKpfgNRET7MLqOmi2CIeMQGzwzQ&usqp=CAU'
        ];
      }else if(productName =='iPad mini' || productName=='أيباد ميني'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOAD96WWLyruuOERN0pcqwUItR8UCTlXH1qse_HaMbAa5K7DbXj9Ct-kjc2at6f9A_JH8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ4EU4il9kYlWc9jJGq28FHgxx05cSXwnmWxLPpQJV6CMPoWu3eDwMd_hAnbcgZxTnURw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfzirXf7-BMVVkny-x67fn-WcQW9qflPniYmZ51U9c65Jb14ZlVVblqV_C-ewrCq7QTqw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSFbSnLnGNsJdfpNTiS39J0EZPttyFZ1rkyssSDMGJqfwo7frRN0N0iC0RV1SA64vOO9A&usqp=CAU'
        ];
      }else if(productName=='MacBook Air M1 chip' || productName=='ماك بوك اير m1'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRylPMNiAxhQfbllhsdZ3YXCII_-1URPIjD9BParLQn0ktFWQT8A27sSMM4OmAC49puzPA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIVLrAkkEG8NVwv60QFoTcOtAqRN1R8fqxBw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYXCAle2CMtAO4n4vNjdPxvRUAitpv51Srnw&usqp=CAU'
        ];
      }else if(productName=='MacBook Air M2 chip' || productName=='ماك بوك اير m2'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-41-cBszLPefGPB-m96txtEJrtG2XnCTkgw8SFqQBokf-de7XS7qWV7RhcLGaOPy63V8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGyiARwNzwDCTTUsWnEPfxqDglnMJJiRr63AMOdo0Dm1ywdLJeWr4Ja_ic9GuyaFEpSbg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-UDzhLx3UueuE_3b4v87bwfSjjyJirtcBiw&usqp=CAU'
        ];
      }else if(productName=='iMac' || productName=='أي ماك'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQt5rgJ_FGPfToKhynLQ3UgJTYBIos1XCabTA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-veLk_L7brauxxYPyV563q9k96AIntiS4viy9DtBxyk8SA1Jqb46SiMcpH6UuUMLu93o&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3lg2y1tjeqJNY9qTSPYi3SiKKx1M8lUuEL9bwSCKgsCENiyfw0hBI0pj1isTGj3QJ2nQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxsnU0-HgnJ2Kg8T8I4QiW7BgffpUlZx59HXmGtQZjvtoRfNkiW4eS_NZSMFjGLo97Gwc&usqp=CAU'
        ];
      }else if(productName=='Mac mini' || productName=='ماك ميني'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoxIGnvONJUdFQSrSHvMGWypWZeOAhxfp84UGjaMYstiYKQlR_FGcxgmszBxF9f28JYO0&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsjNzDwhcK4z1BcUCoiDelWcyAxLz8W0EO0w&usqp=CAU'
        ];
      }else if(productName=='iPhone 14 Pro' || productName=='ايفون 14 برو'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFjutimHxb82ng2lZnwsqaF_l-Zhoq75Gv-bh1Eb0-DwwoZbkSIHj_lKQ3nzPL1hbtIps&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLTrkO-DZMBFBr3WmiHvrudDIWvHbNKBUu3w&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbL6VhzTm2P4sKukhEIj87DyrxbWBBpBnBtA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9TG2WpWWFDE1c4l1UHthmsegujW8LfkKXHGPm6JIpALYpadHaTK-GYgPeQa65ARyz1T8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9xrjnVkM21wfN1UR3Da43OvcKK8RpPXbPvQ&usqp=CAU',
        ];
      }else if(productName=='iPhone 14' || productName=='ايفون 14'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT2DzAd6MdKzzfrgUzFKmWPlLYj-gsof87VzDfhgWTfdPfgLMNBdMIbNXnbgZDkC8uk14&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSORa3WFSELfxuXgt85uYXD7k0rbyBEh0NORg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZD15GIoG5gHK_oH7qJz98vUrtf8Bi-PtvezJlh2OCavpzz5qjcTd2F2DApLStDId5s4o&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFDiuL_6GsAk7aoYdQcaGzSZ2MaqecoehPkEkUdIqg-42hVr0Ku1XNL2k8yt-O01aFSJM&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfKqcx2qYRHNEw-1es9gD0ha3uzP70q9EL4a1GmTR_Zrl5v1Qtm4X7WjLA7JAI-H9lE_w&usqp=CAU'
        ];
      }else if(productName=='iPhone SE' || productName=='ايفون اس اي'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkjIxYz8ekyZeNmwT0oXddunmgqI_gMcP_qg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNPixiGBbMWcMbzloqbKpCIm6LuLpqNmi3iA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQce5XuXklStVH4CM1wOVw-3yhK-sx0Xf6z3Q&usqp=CAU',
        ];
      }else if(productName=='Apple Watch Series 8' || productName=='ساعة أبل8'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUuRJh4fI0lnCPzam5cUnkRK7NeYRbSScw7L7iT1_ecVJxDqqst_jbxUx3KTBVNXyZ928&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIky3urJxIGVJoPxnBVsocDp3aCfXYMR2Zj7BPFCIZyCr1p6sf1LbItf_B7ZU27a2xiIA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLPZoGXICZHEW2wCrozOJ3e03CZhbRRrGngCQr1ta1Utso7_cXMroOqvIc5T3FgyidQF0&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3IRGTg3SiUJSMoxSwyYeT-bhg-Laj1dmGe0MrmtnRXl8O4yaPJGBTND7VISbcaqCd7qI&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZU1-juT_imXOeTugI3WnflV0hLjUPtu4fCaGWSP39rIffox3vJ1o9w-1Fq4qZ4RoZTOo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO2rH3YzWm_JJR3YASlXYbQb3X1WmZhwChhQ&usqp=CAU'
        ];
      }else if(productName=='Apple Watch Ultra' || productName=='ساعة أبل الترا'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR94lyUqcPQROEZhUp66Ck2LU2iWopUh2fPcEHaekyEStCgwFRzP8MeCA0hcey6IsVbrH4&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhqSjbk1QRSOAY-6IuLbxlr1SEFxk1xhJQiZzZxTfg_sFgdT6tOtQ70v8upMCRIA-MwOw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlJ4B4Uf0VDBjNG73_loiITBAh8ADG2RzMiE0-rV1qEyohcyPD--t4rafIgPaHnyZ1GSg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnN87uLSJf2uodhwRM5gv4WK6koXZzb2mEVw&usqp=CAU',
        ];
      }else if(productName=='Samsung s23 Ultra' || productName=='سامسونج اس23 الترا'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRrQbb49L7V2OxbDkdtAohUGfsogsQoK6D1N9WrcTSuYrIHEpWq_7NitOE0OVM1YPLi2g&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6pQeM1NQorMSjB_18E-KMaYAf5ORmpcFrTw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcjSNdu6k0yCjwz75hhYKiflD7emDZouE38_neDuJTafIsf-JdyqLkOi-WlwB7Gpa-_nE&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi7ulIr2dbUqH78gA4kw8alXaO-rHgRzZOVPFm1cC3Z0Fn6PE-FAw-YRIftSHRBoExPNw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5NzhUToQokPQKJsmonry5YWLsZ8pC75WQEw&usqp=CAU',
        ];
      }else if(productName=='Samsung Z Fold 4' || productName=='سامسونج زد فولد4'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT065XFEyp3Djnb5llOprY9apajQO-jG7Lerg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfi5TgStk9xjQqpwSTh0AAF8Pipw7YvujnvQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfbylSe0JB9HVGrcSncDhpoakb3okLcT9Jtw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL6LaCcA9QGUCo1c8A6TMhBe6mCytn_ow_7w&usqp=CAU'
        ];
      }else if(productName=='Asus Zenfone 9' || productName=='أسوس زنفولد9'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcm2V-dvuNnD_6b1jippuVQwA2pwLIBgJUZg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1Ndwz0vUJJ4FFt9dsBq06pl8oEdrb1nv8yYOr6MZxEIlRNz1EiSil2WtY3_-RJ42G314&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHCecHoUtGA1i3HMhJMoL3U4HcRXHNjswJGWY5kyNoUdJ8qACTa7xWbYsDVlEJNihvaHA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmYETSleQld3IDTxcuokwraktooSMZv3Gkdsc33ZaA0v2KljmrcqxMqUHZ9fK9LnvsZbI&usqp=CAU'
        ];
      }else if(productName=='Tab A7' || productName=='تابليت اي7'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRi7Np2pzb5UERbJRq1ZGhQ6cRqiFC9i7s1leSPQP6Aog__GfSOcz9qk2GLbD_PiWufPko&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR18R35vLdrTJQrWJA3AazCGe-B_x1LZ-cAXQo-6RX2RBNfjEJa3rRY3tbi9KlVeGDOOCc&usqp=CAU',
        ];
      }else if(productName=='Tab S7' || productName=='تابليت اس7'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqA-HLW6XlA6wvuTc_3s28o4zUemANLYGMvBfWCz5m0k_sFShEvGsu73E2tr4S2nJtiSw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLdm6l-Fi3tQP-3Ez8sEpuGQLtEoNpyOGzOV56vQelN7ULICdg2FHU4bYM5YhJRcHhgpg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZosV99ZypOx0-NbDd7mOE5s5XVmGhQp1zucoq2PUFTk1aEfU_9iK5udQKq2vFFqHiD1M&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2JmyBwN37oSyB01ucJLjRa3KM9ZNJ0IqwyQCPMHLxbORDty7MdBcmn5Zr39TCSiARQj0&usqp=CAU'
        ];
      }else if(productName=='Tab A8' || productName=='تابليت اي8'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2eIk1ShsZJaqvc7Yz0_K6qFXcsd4ttZvQjg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdfMsURk2jfHBG3FR_IKaeHQzyU7x8QbDfw-zZASK18IQcjPT2DzGTFKs12y08rHpcCQg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkVnlHG1d0A7E4v6-YPoOMXa-nxCax2gGc7g&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRjlTZqA45N4w_L_mTsXWD7lVZlFfaufV0kw&usqp=CAU',
        ];
      }else if(productName=='HP Intel core i9' || productName=='اتش بي كور أي9'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCbtrxEfWATRAmt5lrl7ueV4UEi0PFqHPoefv5XEWxJwWW9QIv-_3jIjhz-dGm8mu6i2E&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRimnHmICVVx0bIPC-_KZ0O9HV2FSCLIKrz1cH19haW2RRMSk9zHbDMFZZCZXF0TkcYDAY&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqXOqw4k64qhJUxtdHjvrkcBm9d2gMDhgSiw&usqp=CAU'
        ];
      }else if(productName=='KEF Q950 FLOORSTANDING SPEAKER' || productName=='كي اي اف كيو950 مكبرات الصوت الدائمة'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3x1xDCod2lAFWZzI8Yhq2v5VjUQsPAHmzmg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaQcpXY4qHIsph4YvGf5xn5WGQH4DGeQ-RdQ&usqp=CAU',
        ];
      }else if(productName=='Bowers & Wilkins PX7 S2' || productName=='بورز اند ويلكينز بي اكس7 اس2'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkse24OhCNYw6mONBSjeCeyq_wBz8UqZwIWA&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF7EA1YW-fRraRFFrYbMBwcNJhezB4Owq7dQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvvKLHXfZUsKgOF6Sm5Tq7xw6gIY1HIef-Pw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS73nbaUg02AlOqxfRirdw1v3ELKVjrLmdZIQ&usqp=CAU'
        ];
      }else if(productName=='USB LED Lights' || productName=='يو اس بي ليد لايت'){
        images=[
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkOhaD72hNl3-9KNLd-Usu7S0EkSG1W3f_Xg&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfrR5gft_7h4GP-m_Jxahv9Q1s6C3b_g1l8w&usqp=CAU',
        ];
      }
      return images;
    }

}