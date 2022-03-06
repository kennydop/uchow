import '../models/dish_model.dart';
import '../models/restaurant_model.dart';

List<RestaurantModel> restaurants = [
  RestaurantModel(
      uid: 1,
      name: "Heavenly Kitchen Fast Food",
      tel: "0240893456",
      location: "Success City",
      profilePicture: "assets/images/food0.png"),
  RestaurantModel(
      uid: 2,
      name: "Cheddar Fast Foods",
      tel: "0240387341",
      location: "Ayensu Road",
      profilePicture: ""),
  RestaurantModel(
      uid: 3,
      name: "Tasty Chef Fast Foods",
      tel: "0203456234",
      location: "Adehyiɛ Hall",
      profilePicture: ""),
  RestaurantModel(
      uid: 4,
      name: "Daavi's Kitchen",
      tel: "0550674353",
      location: "Apɛwosika",
      profilePicture: ""),
  RestaurantModel(
      uid: 5,
      name: "Gↄbɛ Wura",
      tel: "0506724336",
      location: "Amamoma",
      profilePicture: ""),
  RestaurantModel(
      uid: 6,
      name: "Amelia Waakye",
      tel: "0240893456",
      location: "Science Market",
      profilePicture: ""),
];

List<DishModel> dishes = [
  DishModel(
      uid: 1,
      restaurantID: 1,
      name: "Boiled Yam and Vegetable Stew",
      price: [16.00, 21.00],
      image: "assets/images/yam.jfif",
      description:
          "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.",
      purchases: 6),
  DishModel(
      uid: 2,
      restaurantID: 2,
      name: "Fried Rice with Chicken",
      toppings: ["Salad", "Salad Cream", "Tomato Sauce"],
      price: [9.00, 11.00, 16.00],
      image: "assets/images/fried_rice.jfif",
      description:
          "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.",
      purchases: 8),
  DishModel(
      uid: 3,
      restaurantID: 3,
      name: "Jollof Rice with Chicken",
      toppings: ["Salad", "Salad Cream", "Tomato Sauce"],
      price: [11.00, 14.00, 16.00, 21.00],
      image: "assets/images/jollof.jfif",
      purchases: 7),
  DishModel(
      uid: 4,
      restaurantID: 4,
      name: "Banku with Okro Stew",
      price: [9.00, 11.00, 14.00, 21.00],
      image: "assets/images/banku.jfif",
      description:
          "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.",
      purchases: 8),
  DishModel(
      uid: 5,
      restaurantID: 5,
      name: "Fried Ripe Plantain with Beans Stew",
      price: [6.00, 9.00, 11.00, 16.00],
      image: "assets/images/beans.jfif",
      purchases: 24),
  DishModel(
      uid: 6,
      restaurantID: 6,
      name: "Waakye",
      toppings: ["Salad", "Salad Cream", "Tomato Sauce"],
      price: [9.00, 11.00, 14.00],
      image: "assets/images/waakye.jfif",
      description:
          "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.",
      purchases: 16),
];

List reviews = [
  {
    "uid": "1",
    "dishID": 1,
    "name": "Oppong Nkrumah",
    "review":
        "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.",
    "stars": 4,
    "dateOrdered": "12/03/2020",
  },
  {
    "uid": "36",
    "dishID": 1,
    "name": "Thomas Lemah",
    "review":
        "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other.",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "2",
    "dishID": 1,
    "name": "Gray Mensah",
    "review":
        "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "3",
    "dishID": 1,
    "name": "Perry korangten",
    "review":
        "For example, you can add a matching cover page, header, and sidebar. Click Insert and then choose the elements you want from the different galleries.",
    "stars": 5.0,
    "dateOrdered": "",
  },
  {
    "uid": "4",
    "dishID": 1,
    "name": "Ansah Godfred",
    "review":
        "Themes and styles also help keep your document coordinated. When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme.",
    "stars": 3,
    "dateOrdered": "",
  },
  {
    "uid": "5",
    "dishID": 2,
    "name": "Rue Johnson",
    "review":
        "When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme.",
    "stars": 3,
    "dateOrdered": "",
  },
  {
    "uid": "6",
    "dishID": 2,
    "name": "Kendrick Larmar",
    "review":
        "and SmartArt graphics change to match your new theme. When you apply styles, your",
    "stars": 2,
    "dateOrdered": "",
  },
  {
    "uid": "7",
    "dishID": 2,
    "name": "Keith Merky",
    "review":
        "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "8",
    "dishID": 2,
    "name": "Thomas Shelby",
    "review":
        "you need them. To change the way a picture fits in your document, click it and a button for layout options appears",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "9",
    "dishID": 2,
    "name": "Eva Johnson",
    "review":
        "Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.",
    "stars": 2,
    "dateOrdered": "",
  },
  {
    "uid": "10",
    "dishID": 2,
    "name": "Ivar the Boneless",
    "review":
        "Save time in Word with new buttons that show up where you need them.",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "11",
    "dishID": 2,
    "name": "Zacheus Freeman",
    "review":
        "If you need to stop reading before you reach the end, Word remembers where you left off - even on another device",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "12",
    "dishID": 3,
    "name": "Korang Valentine",
    "review":
        "Reading is easier, too, in the new Reading view. You can collapse parts of the document and focus on the text you want. ",
    "stars": 2,
    "dateOrdered": "",
  },
  {
    "uid": "13",
    "dishID": 3,
    "name": "Patrice Lumumba",
    "review":
        "You can collapse parts of the document and focus on the text you want",
    "stars": 3,
    "dateOrdered": "",
  },
  {
    "uid": "14",
    "dishID": 3,
    "name": "Edjah Ndoum",
    "review":
        "Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "15",
    "dishID": 3,
    "name": "Christensen Dome",
    "review":
        "If you need to stop reading before you reach the end, Word remembers where you left off - even on another device",
    "stars": 3,
    "dateOrdered": "",
  },
  {
    "uid": "16",
    "dishID": 3,
    "name": "Akorsu Juliet Enyornam",
    "review":
        "you need them. To change the way a picture fits in your document, click it and a button for layout options appears",
    "stars": 3,
    "dateOrdered": "",
  },
  {
    "uid": "17",
    "dishID": 3,
    "name": "Big Hero 6",
    "review":
        "you need them. To change the way a picture fits in your document, click it and a button for layout options appears",
    "stars": 2,
    "dateOrdered": "",
  },
  {
    "uid": "18",
    "dishID": 4,
    "name": "Ashawo Season",
    "review":
        "Reading is easier, too, in the new Reading view. You can collapse parts of the document and focus on the text you want. ",
    "stars": 3,
    "dateOrdered": "",
  },
  {
    "uid": "19",
    "dishID": 4,
    "name": "Thomas Shelby",
    "review":
        "When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme.",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "20",
    "dishID": 4,
    "name": "Ansah Godfred",
    "review": "in the new Reading view",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "21",
    "dishID": 4,
    "name": "Rue Johnson",
    "review":
        "Design and choose a new Theme, the pictures, charts, and SmartArt",
    "stars": 3,
    "dateOrdered": "",
  },
  {
    "uid": "22",
    "dishID": 4,
    "name": "Edjah Ndoum",
    "review":
        "Insert and then choose the elements you want from the different galleries",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "23",
    "dishID": 4,
    "name": "Gray Mensah",
    "review":
        "Reading is easier, too, in the new Reading view. You can collapse parts of the document and focus on the text you want. ",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "24",
    "dishID": 4,
    "name": "Patrice Lumumba",
    "review":
        "you need them. To change the way a picture fits in your document, click it and a button for layout options appears",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "25",
    "dishID": 5,
    "name": "Edjah Ndoum",
    "review":
        "When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme.",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "26",
    "dishID": 5,
    "name": "Ansah Godfred",
    "review":
        "Insert and then choose the elements you want from the different galleries",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "27",
    "dishID": 5,
    "name": "Gray Mensah",
    "review":
        "Reading is easier, too, in the new Reading view. You can collapse parts of the document and focus on the text you want. ",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "28",
    "dishID": 5,
    "name": "Thomas Shelby",
    "review":
        "Design and choose a new Theme, the pictures, charts, and SmartArt",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "29",
    "dishID": 5,
    "name": "Rue Johnson",
    "review":
        "you need them. To change the way a picture fits in your document, click it and a button for layout options appears",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "30",
    "dishID": 5,
    "name": "Patrice Lumumba",
    "review": "in the new Reading view",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "31",
    "dishID": 6,
    "name": "Edjah Ndoum",
    "review":
        "Reading is easier, too, in the new Reading view. You can collapse parts of the document and focus on the text you want. ",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "32",
    "dishID": 6,
    "name": "Rue Johnson",
    "review":
        "you can paste in the embed code for the video you want to add. You can also type a keyword to search online",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "33",
    "dishID": 6,
    "name": "Ansah Godfred",
    "review": "in the new Reading view",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "34",
    "dishID": 6,
    "name": "Gray Mensah",
    "review":
        "When you click Design and choose a new Theme, the pictures, charts, and SmartArt graphics change to match your new theme. When you apply styles, your headings change to match the new theme.",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "35",
    "dishID": 6,
    "name": "Thomas Shelby",
    "review":
        "you need them. To change the way a picture fits in your document, click it and a button for layout options appears",
    "stars": 5,
    "dateOrdered": "",
  },
  {
    "uid": "37",
    "dishID": 1,
    "name": "ergeragvbeargberg",
    "review": "",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "38",
    "dishID": 2,
    "name": "Michael Shelby",
    "review": "",
    "stars": 4,
    "dateOrdered": "",
  },
  {
    "uid": "39",
    "dishID": 2,
    "name": "efuyfewygufew",
    "review": "",
    "stars": 3,
    "dateOrdered": "",
  },
  {
    "uid": "40",
    "dishID": 3,
    "name": "wfeuyfewuygfwgvhgvw",
    "review": "",
    "stars": 4,
    "dateOrdered": "",
  },
];
