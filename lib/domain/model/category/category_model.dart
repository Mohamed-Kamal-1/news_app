
import '../../../core/images/app_assest.dart';

class CategoryModel{
  final String? title;
  final String? image;
  final String? id;

  CategoryModel({required this.image,required this.id,this.title});


  //
static List<CategoryModel> categories = [
  CategoryModel(image: AppImage.general, id: 'general',title:"General"),
  CategoryModel(image: AppImage.business, id: 'business',title: "Business"),
  CategoryModel(image: AppImage.sport, id: 'sports',title: "Sports"),
  CategoryModel(image: AppImage.health, id: 'health',title: "Health"),
  CategoryModel(image: AppImage.entertainment, id: 'entertainment',title: "Entertainment"),
  CategoryModel(image: AppImage.tech, id: 'technology',title: "Tech"),
  CategoryModel(image: AppImage.science, id: 'science', title: "Science"),
];
}