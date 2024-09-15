class ItemModel {
  const ItemModel({
    required this.name,/// dfg
    required this.kcal,/// sfdg
    required this.price,/// sdg
    required this.imagePath,/// dgsd
    required this.itemSold,
    required this.description,///
    required this.itemDetail,///
    required this.ratingCount,
    required this.ratingMap,
    required this.category,///adf
    required this.quantity,///afd
  });

  final String name;
  final String kcal;
  final String price;
  final String imagePath;
  final int itemSold;
  final String description;
  final String itemDetail;
  final double ratingCount;
  final Map<double, double> ratingMap;
  final List<String> category;
  final int quantity;

  @override
  String toString() {
    return 'ItemModel(name: $name, kcal: $kcal, price: $price, category: $category, quantity: $quantity)';
  }
}

// 27 items
List<String> categories = ['breakfast', 'beverage', 'lunch', 'snacks', 'ice_cream'];
final List<ItemModel> allItems = <ItemModel>[
  ItemModel(
    name: "khichuri",
    kcal: "500",
    price: "55",
    imagePath: 'assets/test_image/khichuri.png',
    itemSold: 150,
    description:
        "A hearty dish featuring aromatic khichuri, a flavorful blend of lentils and rice, served with tender chicken curry. Enjoy the comforting textures and savory spices, perfect for a fulfilling meal, and experience the rich, traditional flavors that warm the soul.",
    itemDetail: "Khichuri, Chicken Curry, Salad",
    ratingCount: 12934,
    ratingMap: {5: 10500, 4: 1700, 3: 0, 2: 0, 1: 734},
    category: ['lunch'],
    quantity: 0,
  ),
  ItemModel(
    name: "sandwich",
    kcal: "150",
    price: "40",
    imagePath: 'assets/test_image/sandwich.png',
    itemSold: 10,
    description:
        "A delicious blend of fresh ingredients between toasted bread slices, featuring crisp lettuce, juicy tomatoes, creamy cheese, and your choice of meats or veggies. Customize with spreads and condiments for a satisfying, quick meal.",
    itemDetail: "Chicken, Egg, WhiteSauce, Bread",
    ratingCount: 13231,
    ratingMap: {5: 2231, 4: 2000, 3: 4000, 2: 4000, 1: 1000},
    category: ['snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "sub sandwich",
    kcal: "230",
    price: "80",
    imagePath: 'assets/test_image/sub_sandwich.png',
    itemSold: 990,
    description:
        "A savory combination of fresh ingredients on toasted bread, including crisp lettuce, juicy tomatoes, creamy cheese, and your choice of meats or vegetables. Customizable with a variety of spreads and condiments, perfect for a quick and satisfying meal.",
    itemDetail: "Vegetable, Chicken, Egg, WhiteSauce, Bread",
    ratingCount: 22857,
    ratingMap: {5: 17000, 4: 2000, 3: 3000, 2: 800, 1: 57},
    category: ['lunch', 'snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "chicken fry",
    kcal: "300",
    price: "70",
    imagePath: 'assets/test_image/chicken_fry.png',
    itemSold: 500,
    description:
        "Crispy and juicy chicken fry, seasoned to perfection. Enjoy the crunchy texture and savory flavor, ideal for a quick snack or a meal.",
    itemDetail: "Chicken, Spices, Oil",
    ratingCount: 8573,
    ratingMap: {5: 6500, 4: 1500, 3: 400, 2: 100, 1: 73},
    category: ['snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "shingara",
    kcal: "150",
    price: "15",
    imagePath: 'assets/test_image/shingara.png',
    itemSold: 3000,
    description:
        "A traditional snack featuring a crispy pastry filled with spiced potatoes and peas. Perfectly fried to golden brown, offering a delightful crunch and flavorful filling.",
    itemDetail: "Potatoes, Peas, Spices, Flour",
    ratingCount: 10234,
    ratingMap: {5: 8000, 4: 1500, 3: 500, 2: 100, 1: 134},
    category: ['snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "french fry",
    kcal: "300",
    price: "35",
    imagePath: 'assets/test_image/french_fry.png',
    itemSold: 750,
    description:
        "Crispy, golden french fries are a universal favorite, perfect as a side dish or a snack. Made from freshly cut potatoes, these fries are deep-fried to perfection, offering a satisfying crunch with every bite. Lightly salted to enhance their natural flavor, french fries are best enjoyed hot and fresh. Whether paired with a juicy burger, dipped in ketchup or mayonnaise, or simply savored on their own, they are always a delight. These fries are versatile, making them a great addition to any meal, or a quick bite to satisfy your cravings. Loved by all ages, french fries are a timeless classic.",
    itemDetail: "Potato, Salt, Oil",
    ratingCount: 12000,
    ratingMap: {5: 9000, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "fried rice",
    kcal: "400",
    price: "90",
    imagePath: 'assets/test_image/fried_rice.png',
    itemSold: 600,
    description:
        "Fried rice is a versatile and delicious dish featuring rice stir-fried with a variety of vegetables, eggs, and sometimes meat or seafood. Each spoonful offers a burst of flavors and textures, from the crunchy vegetables to the tender rice grains. Seasoned with soy sauce and other spices, fried rice is a perfect meal for any time of the day. Often garnished with fresh herbs or green onions, it can be enjoyed on its own or as a side dish. The simplicity and flavor of fried rice make it a popular choice for both casual and festive occasions.",
    itemDetail: "Rice, Vegetables, Egg, Soy Sauce",
    ratingCount: 13000,
    ratingMap: {5: 9500, 4: 2000, 3: 1000, 2: 300, 1: 200},
    category: ['lunch'],
    quantity: 0,
  ),
  ItemModel(
    name: "chicken teheri",
    kcal: "550",
    price: "120",
    imagePath: 'assets/test_image/chicken_teheri.png',
    itemSold: 450,
    description:
        "Chicken teheri is a flavorful rice dish featuring tender chicken pieces cooked with aromatic spices and basmati rice. Each serving offers a rich, savory taste that is both satisfying and comforting. The blend of spices, including turmeric, cumin, and coriander, infuses the rice and chicken with a deep, rich flavor. Often garnished with fried onions and fresh herbs, chicken teheri is perfect for lunch or dinner. Served with a side of salad or raita, this dish is a favorite among those who enjoy traditional, hearty meals.",
    itemDetail: "Chicken, Basmati Rice, Spices",
    ratingCount: 11500,
    ratingMap: {5: 8500, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['lunch'],
    quantity: 0,
  ),
  ItemModel(
    name: "porota",
    kcal: "350",
    price: "30",
    imagePath: 'assets/test_image/porota.png',
    itemSold: 500,
    description:
        "Porota, a traditional flatbread, is a staple in many South Asian cuisines. Made from whole wheat flour, each porota is rolled out and cooked on a hot griddle until golden brown and slightly crispy. The layers of the porota make it a delightful addition to any meal, whether served with curry, lentils, or yogurt. Its soft, flaky texture and rich, buttery flavor make it a favorite among bread lovers. Enjoy porota fresh off the griddle, paired with your favorite dishes, for a satisfying and wholesome meal experience.",
    itemDetail: "Whole Wheat Flour, Butter, Water",
    ratingCount: 10500,
    ratingMap: {5: 2000, 4: 2000, 3: 300, 2: 6100, 1: 100},
    category: ['breakfast'],
    quantity: 0,
  ),
  ItemModel(
    name: "dal shobji",
    kcal: "300",
    price: "50",
    imagePath: 'assets/test_image/dal_shobji.png',
    itemSold: 400,
    description:
        "Dal shobji is a nutritious and flavorful dish featuring lentils cooked with a variety of fresh vegetables. Each serving offers a hearty and wholesome taste, rich in protein and fiber. The combination of spices such as cumin, turmeric, and coriander enhances the natural flavors of the lentils and vegetables, making it a perfect meal for lunch or dinner. Often garnished with fresh herbs and a squeeze of lemon, dal shobji is both satisfying and healthy. Enjoy it with rice or bread for a complete and balanced meal.",
    itemDetail: "Lentils, Vegetables, Spices",
    ratingCount: 11000,
    ratingMap: {5: 1000, 4: 2000, 3: 7500, 2: 300, 1: 200},
    category: ['breakfast'],
    quantity: 0,
  ),
  ItemModel(
    name: "chocobar",
    kcal: "200",
    price: "30",
    imagePath: 'assets/test_image/chocobar.png',
    itemSold: 400,
    description:
        "Chocobar, a delightful chocolate-covered ice cream bar, is a favorite treat for those with a sweet tooth. Each bar features creamy vanilla ice cream encased in a rich, smooth chocolate coating. The combination of creamy and crunchy textures makes every bite a pleasure. Perfect for a hot day or as a dessert, chocobar is a satisfying and indulgent treat. Its convenient size and packaging make it easy to enjoy on the go. Whether as a reward for yourself or a treat for friends and family, chocobar is a timeless favorite.",
    itemDetail: "Vanilla Ice Cream, Chocolate Coating",
    ratingCount: 10500,
    ratingMap: {5: 8000, 4: 2000, 3: 300, 2: 100, 1: 100},
    category: ['ice_cream'],
    quantity: 0,
  ),
  ItemModel(
    name: "cone ice cream",
    kcal: "250",
    price: "35",
    imagePath: 'assets/test_image/cone_ice_cream.png',
    itemSold: 300,
    description:
        "Cone ice cream, a classic favorite, features creamy, delicious ice cream served in a crispy, waffle cone. Each bite offers a delightful combination of smooth and crunchy textures. Available in a variety of flavors such as vanilla, chocolate, and strawberry, cone ice cream is perfect for any occasion. Enjoy it on a hot day, as a dessert, or as a treat. The convenient cone makes it easy to enjoy on the go. With its timeless appeal, cone ice cream is a favorite among all ages.",
    itemDetail: "Ice Cream, Waffle Cone",
    ratingCount: 12000,
    ratingMap: {5: 9000, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['ice_cream'],
    quantity: 0,
  ),
  ItemModel(
    name: "coffee",
    kcal: "5",
    price: "20",
    imagePath: 'assets/test_image/coffee.png',
    itemSold: 1200,
    description:
        "A cup of coffee offers a rich and invigorating experience, perfect for starting your day or enjoying a mid-day break. Made from freshly ground coffee beans, each cup provides a robust and aromatic flavor. Whether enjoyed black, with cream, or with sugar, coffee can be customized to suit your preferences. Often accompanied by snacks such as pastries or cookies, coffee is a popular choice for social gatherings, work breaks, or quiet moments alone. The energizing properties of coffee make it a favorite among those who need a quick pick-me-up.",
    itemDetail: "Coffee Beans, Water, Optional Add-ins",
    ratingCount: 12500,
    ratingMap: {5: 9000, 4: 2000, 3: 1000, 2: 300, 1: 200},
    category: ['beverage'],
    quantity: 0,
  ),
  ItemModel(
    name: "mojo",
    kcal: "150",
    price: "25",
    imagePath: 'assets/test_image/mojo.png',
    itemSold: 700,
    description:
        "Mojo is a refreshing and delicious soft drink, perfect for quenching your thirst and adding a burst of flavor to your day. Each bottle offers a unique blend of fruity and tangy flavors that are sure to delight. Enjoy mojo chilled, whether you're relaxing at home, at a party, or on the go. The convenient packaging makes it easy to carry and enjoy anytime. Mojo is a popular choice for those looking for a refreshing alternative to traditional sodas. Its vibrant taste and refreshing qualities make it a favorite among all ages.",
    itemDetail: "Soft Drink",
    ratingCount: 12500,
    ratingMap: {5: 9000, 4: 2000, 3: 1000, 2: 300, 1: 200},
    category: ['beverage'],
    quantity: 0,
  ),
  ItemModel(
    name: "cleamon",
    kcal: "150",
    price: "25",
    imagePath: 'assets/test_image/cleamon.png',
    itemSold: 650,
    description:
        "Cleamon is a zesty and refreshing soft drink, perfect for quenching your thirst and adding a burst of citrus flavor to your day. Each bottle offers a unique blend of lemon and lime flavors that are sure to delight. Enjoy cleamon chilled, whether you're relaxing at home, at a party, or on the go. The convenient packaging makes it easy to carry and enjoy anytime. Cleamon is a popular choice for those looking for a refreshing alternative to traditional sodas. Its vibrant taste and refreshing qualities make it a favorite among all ages.",
    itemDetail: "Soft Drink",
    ratingCount: 11500,
    ratingMap: {5: 8500, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['beverage'],
    quantity: 0,
  ),
  ItemModel(
    name: "tea",
    kcal: "50",
    price: "10",
    imagePath: 'assets/test_image/tea.png',
    itemSold: 1000,
    description:
        "A cup of tea offers a moment of relaxation and refreshment, perfect for any time of the day. Made from high-quality tea leaves, each cup provides a rich, aromatic experience. Whether enjoyed black, with milk, or with a squeeze of lemon, tea is a versatile beverage that can be tailored to your taste. It's often accompanied by snacks such as biscuits or pastries, making it a popular choice for social gatherings or quiet moments alone. The soothing properties of tea make it a comforting and delightful drink.",
    itemDetail: "Tea Leaves, Water, Optional Add-ins",
    ratingCount: 11500,
    ratingMap: {5: 8500, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['beverage'],
    quantity: 0,
  ),
  ItemModel(
    name: "samosa",
    kcal: "250",
    price: "25",
    imagePath: 'assets/test_image/samosa.png',
    itemSold: 500,
    description:
        "Samosa, a beloved snack that combines a crispy, golden-brown pastry with a savory filling of spiced potatoes and peas. Each bite delivers a delightful crunch and a burst of flavors, making it a perfect companion for your tea or coffee breaks. Often served with tangy tamarind chutney and spicy mint sauce, samocha is not just a snack but a culinary experience. Enjoy it fresh and hot, as the warm spices and aromatic herbs tantalize your taste buds. Ideal for gatherings, parties, or a solo indulgence, samocha is a must-try for anyone who loves flavorful snacks. Its rich texture and vibrant taste will leave you craving more.",
    itemDetail: "Potato, Peas, Spices, Pastry",
    ratingCount: 10500,
    ratingMap: {5: 8000, 4: 2000, 3: 300, 2: 100, 1: 100},
    category: ['snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "alur chop",
    kcal: "220",
    price: "20",
    imagePath: 'assets/test_image/alur_chop.png',
    itemSold: 600,
    description:
        "Alur chop is a popular Bengali snack, consisting of spiced mashed potatoes coated in gram flour batter and deep-fried until golden and crispy. Each bite offers a delightful combination of creamy potato filling and crunchy exterior. It's a perfect teatime snack, often served with a side of tangy chutney or ketchup. The aromatic spices and herbs in the filling add layers of flavor, making it a favorite among street food lovers. Whether enjoyed hot and fresh from the fryer or reheated for a quick bite, alur chop is a satisfying treat that brings comfort and joy.",
    itemDetail: "Potato, Spices, Gram Flour",
    ratingCount: 11000,
    ratingMap: {5: 8000, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "patties",
    kcal: "260",
    price: "30",
    imagePath: 'assets/test_image/patties.png',
    itemSold: 400,
    description:
        "patties, also known as patties, are a delightful snack featuring a crispy, flaky pastry shell filled with a savory mixture of spiced potatoes, peas, and sometimes minced meat. Baked or fried to perfection, each patis offers a rich and satisfying flavor, making it a popular choice for snack lovers. Often enjoyed with a side of chutney or ketchup, patis are perfect for tea time, parties, or as a quick, savory treat. The contrast between the flaky crust and the flavorful filling makes every bite a pleasure, ensuring that patis remain a beloved snack for all ages.",
    itemDetail: "Pastry, Potato, Peas, Spices",
    ratingCount: 11500,
    ratingMap: {5: 8500, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "burger",
    kcal: "450",
    price: "100",
    imagePath: 'assets/test_image/burger.png',
    itemSold: 800,
    description:
        "A classic burger featuring a juicy beef or chicken patty, fresh lettuce, ripe tomatoes, creamy cheese, and a variety of condiments, all sandwiched between a soft, toasted bun. Each burger is a harmonious blend of textures and flavors, from the crispy lettuce to the succulent patty. Perfect for a hearty meal, burgers can be customized with additional toppings like pickles, onions, or bacon. Served with a side of fries or a cold drink, this burger is a timeless favorite that satisfies hunger and delights the taste buds.",
    itemDetail: "Beef/Chicken Patty, Lettuce, Tomato, Cheese, Bun",
    ratingCount: 14000,
    ratingMap: {5: 10000, 4: 2500, 3: 1000, 2: 300, 1: 200},
    category: ['snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "hot dog",
    kcal: "350",
    price: "70",
    imagePath: 'assets/test_image/hot_dog.png',
    itemSold: 700,
    description:
        "A classic hot dog featuring a juicy sausage nestled in a soft bun, topped with your choice of condiments such as ketchup, mustard, relish, and onions. Each bite offers a delightful combination of savory sausage and flavorful toppings. Perfect for a quick meal or a snack, hot dogs are a popular choice at barbecues, sports events, and casual gatherings. The versatility of hot dogs allows for endless customization, making them a favorite among all ages. Enjoy a hot dog with a side of fries or a cold drink for a satisfying and enjoyable meal.",
    itemDetail: "Sausage, Bun, Condiments",
    ratingCount: 12500,
    ratingMap: {5: 9000, 4: 2000, 3: 1000, 2: 300, 1: 200},
    category: ['snacks'],
    quantity: 0,
  ),
  ItemModel(
    name: "cup ice cream",
    kcal: "300",
    price: "40",
    imagePath: 'assets/test_image/cup_ice_cream.png',
    itemSold: 500,
    description:
        "Cup ice cream offers a convenient and delicious way to enjoy your favorite frozen treat. Each cup features rich, creamy ice cream in a variety of flavors, such as vanilla, chocolate, and strawberry. Perfect for any occasion, cup ice cream is a satisfying dessert or snack. The convenient packaging makes it easy to enjoy at home, at parties, or on the go. Each spoonful delivers a burst of flavor and a creamy texture that is sure to delight. Cup ice cream is a timeless favorite that is enjoyed by all ages.",
    itemDetail: "Ice Cream",
    ratingCount: 11000,
    ratingMap: {5: 8000, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['ice_cream'],
    quantity: 0,
  ),
  ItemModel(
    name: "water",
    kcal: "0",
    price: "10",
    imagePath: 'assets/test_image/water.png',
    itemSold: 2000,
    description:
        "A bottle of water is essential for staying hydrated and refreshed throughout the day. Whether at home, at work, or on the go, water is the perfect beverage to quench your thirst. Each bottle provides clean, refreshing water that is free from impurities. Staying hydrated is important for overall health and well-being, and water is a natural and calorie-free choice. Enjoy a bottle of water with your meals, during exercise, or whenever you need a refreshing drink. Water is the most basic yet vital beverage for everyone.",
    itemDetail: "Water",
    ratingCount: 15000,
    ratingMap: {5: 11000, 4: 3000, 3: 500, 2: 300, 1: 200},
    category: ['beverage'],
    quantity: 0,
  ),
  ItemModel(
    name: "rc cola",
    kcal: "150",
    price: "25",
    imagePath: 'assets/test_image/rc_cola.png',
    itemSold: 800,
    description:
        "RC Cola is a classic and refreshing soft drink, perfect for quenching your thirst and enjoying a burst of cola flavor. Each bottle offers the rich, bold taste of RC Cola, a favorite among soda lovers. Enjoy RC Cola chilled, whether you're relaxing at home, at a party, or on the go. The convenient packaging makes it easy to carry and enjoy anytime. RC Cola is a popular choice for those looking for a classic cola flavor. Its timeless taste and refreshing qualities make it a favorite among all ages.",
    itemDetail: "Soft Drink",
    ratingCount: 13000,
    ratingMap: {5: 9500, 4: 2000, 3: 1000, 2: 300, 1: 200},
    category: ['beverage'],
    quantity: 0,
  ),
  ItemModel(
    name: "starship chocolate",
    kcal: "200",
    price: "30",
    imagePath: 'assets/test_image/starship_chocolate.png',
    itemSold: 300,
    description:
        "Starship Chocolate Milk, a delightful 200 ml serving of pure indulgence that brings together the richness of chocolate and the wholesome goodness of milk. This product offers a perfect balance of flavors, creating a satisfying and enjoyable beverage experience.Experience the delectable taste of Starship Chocolate Milk. Each 200 ml serving is a harmonious blend of creamy milk and the irresistible allure of chocolate. Whether you're looking for a treat to satisfy your sweet cravings or a quick energy boost, Starship Chocolate Milk offers a convenient and delicious solution.",
    itemDetail: "Milk, Chocolate",
    ratingCount: 10500,
    ratingMap: {5: 8000, 4: 2000, 3: 300, 2: 100, 1: 100},
    category: ['beverage'],
    quantity: 0,
  ),
  ItemModel(
    name: "starship mango",
    kcal: "200",
    price: "30",
    imagePath: 'assets/test_image/starship_mango.png',
    itemSold: 350,
    description:
        "Indulge in the irresistible taste of Star Ship Mango Fruit Drink, a refreshing and flavorful beverage made from real mango pulp. Its vibrant yellow color and sweet, juicy flavor will tantalize your taste buds and transport you to a tropical paradise.Crafted with carefully selected mangoes, Star Ship Mango Fruit Drink captures the essence of this beloved fruit in every sip. Its smooth texture and balanced sweetness make it a perfect thirst quencher for any occasion.",
    itemDetail: "Milk, Mango",
    ratingCount: 11000,
    ratingMap: {5: 8000, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['beverage'],
    quantity: 0,
  ),
  ItemModel(
    name: "mishti doi",
    kcal: "150",
    price: "20",
    imagePath: 'assets/test_image/mishti_doi.png',
    itemSold: 400,
    description:
        "Mishti Doi is a traditional Bengali dessert made from sweetened, fermented yogurt. Each serving offers a creamy and rich texture, with a delightful sweetness that is both satisfying and comforting. Often enjoyed chilled, Mishti Doi is a perfect end to a meal or a refreshing treat on a hot day. The natural fermentation process gives it a unique flavor that is beloved by many. Whether enjoyed on its own or with a sprinkle of nuts, Mishti Doi is a timeless favorite that brings a taste of tradition to your table.",
    itemDetail: "Yogurt, Sugar",
    ratingCount: 11500,
    ratingMap: {5: 8500, 4: 2000, 3: 500, 2: 300, 1: 200},
    category: ['ice_cream'],
    quantity: 0,
  ),
];

// TODO: New Items ###################*****************************************************
final List<ItemModel> newItems = [];
