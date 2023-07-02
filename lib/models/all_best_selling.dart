import 'package:iconnect/widgets/best_selling.dart';

class AllBestSelling {
  static List<BestSelling> suggestions = <BestSelling>[];
 static List<BestSelling> allBestSelling = <BestSelling>[
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXKDLVMMktEFOQJOsZW8Pvadmm50prYuBpYQ&usqp=CAU',
     productTitle: 'HP Intel core i7',
     productDescription: 'The i7 processor is incredibly fast and perfect for multitasking..',
     productPrice: 750,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVSBdUfsI7ye8uo7Ufa3e5fuZU9rsOocPBdQ&usqp=CAU',
     productTitle: 'iPad Pro Max',
     productDescription: 'Ultra Wide camera with a 12MP sensor,True Tone and ProMotion..',
     productPrice: 820,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQktypcQ9_IaB12MOUbuaus--l9kZ5uCo0BuQ&usqp=CAU',
     productTitle: 'Apple Watch SE',
     productDescription: 'Innovative safety features, Convenient ways to stay connected..',
     productPrice: 249,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIC1TlSI8D60e8WkRiFgZMy1TLABe2Ngmzhg&usqp=CAU',
     productTitle: 'Samsung S22 Ultra',
     productDescription: 'Updated camera, new colors and 1TB max storage..',
     productPrice: 950,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHhzVe5WSFoBLCJGjyrm4YDtTb-X-TENhVrw&usqp=CAU',
     productTitle: 'iPhone 13 Pro Max',
     productDescription: 'Updated camera, new colors and 1TB max storage..',
     productPrice: 590,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0ursOXxY9xSVekpasc9iBNyGJZ_xT9zpqvQ&usqp=CAU',
     productTitle: 'HP OMEN',
     productDescription: 'Highest levels of technology and performance..',
     productPrice: 1550,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BEqVwUqUY0oJbGZsX5ZYGvD8JiixVK3Bzg&usqp=CAU',
     productTitle: 'Tab S8 Ultra',
     productDescription: 'CPU Speed 2.99GHz and128 GB memory Storage Capacity..',
     productPrice: 1099,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl9PEk7KYS34J507WFK9Dx8gj9ksSLiSUM1A&usqp=CAU',
     productTitle: 'Vivo X80 Pro',
     productDescription: 'Resolution, 1440 x 3200 pixels, stunning display and excellent battery life..',
     productPrice: 799,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNPc7-3J-7YyOKzc_0bx4yNk_zJ5xR7C_Y2Q&usqp=CAU',
     productTitle: 'iPad Air',
     productDescription: 'The 10.9-inch Liquid Retina display features advanced technologies..',
     productPrice: 599,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7J4pJCSZMclCcFRVcVGU25awNsvPYAM1pPg&usqp=CAU',
     productTitle: 'HP Envy 13',
     productDescription: 'Have all the power and features you need to bring your imagination to life',
     productPrice: 939,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHscN-1ZQHwP__g20797Mng3jgF1l4uekJxw&usqp=CAU',
     productTitle: 'Google Pixel 6a',
     productDescription: 'It\'s the more affordable, super fast and secure Google phone..',
     productPrice: 297,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxCpuW4SGkEsT0uo_w7i9V3XC1JpfM-nMwAQ&usqp=CAU',
     productTitle: 'MacBook Pro',
     productDescription: 'Easy to learn and designed to let you work and create in entirely new ways..',
     productPrice: 2499,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC-l8oPwveZdbBnCqEvaQrFoc-fHNmFXbKKQ&usqp=CAU',
     productTitle: 'AirPods Pro',
     productDescription: 'Adaptive Transparency reduces external noise, up to 6 hours of listening..',
     productPrice: 249,
   ),
   BestSelling(
     imageProduct: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgiM3gh5TvyQL5MoCNLBWHyE6HTpFZ5YXIXQ&usqp=CAU',
     productTitle: 'HP Chromebook',
     productDescription: 'HP Chromebook x360, all day power and performance..',
     productPrice: 659,
   ),
 ];

 static List<BestSelling> searchBestSelling(String title){
   if(title !=null) {
     suggestions = allBestSelling.where((element) {
       final bestSellingProductTitle = element.productTitle.toLowerCase();
       final input = title.toLowerCase();

       return bestSellingProductTitle.contains(input);
     }).toList();
     return suggestions;

   }else{
     return allBestSelling;
   }
 }
}