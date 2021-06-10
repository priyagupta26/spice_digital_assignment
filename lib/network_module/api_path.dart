
enum APIPath {
  fetch_product,
}

class APIPathHelper{
  static String getValue(APIPath path){
    switch(path){
      case APIPath.fetch_product:
        return "";
      default:
        return "";
    }
  }
}
