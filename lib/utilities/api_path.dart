class ApiPath{
  static String products()=>'products/';
  static String banners()=>'banners/';
  static String users(String uid)=>'users/$uid';
  static String addToCart(String uid,String addToCartId)=>'users/$uid/cart/$addToCartId';
  static String myProductsCart(String uid)=>'users/$uid/cart';
  static String deliveryMethods( )=>'deliveryMethods/';


}