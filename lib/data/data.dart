import 'package:flutter/cupertino.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Anda dapat berbagi info atau sharing mengenai pengalaman bermain golf");

  sliderModel.setImageAssetPath("assets/images/08_onboarding1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Anda dapat mengikuti tournament yang akan diadakan oleh HGC Golf Tracker");

  sliderModel.setImageAssetPath("assets/images/08_onboarding2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Silahkan input skor Anda, nilai yang Anda input akan secara otomatis tersimpan");
  sliderModel.setImageAssetPath("assets/images/08_onboarding3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel
      .setDesc("Ukur kemampuan Anda berdasarkan skor dari jumlah pukulan");
  sliderModel.setImageAssetPath("assets/images/08_onboarding4.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
