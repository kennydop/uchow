import { googleLogin, emailSignUp } from "./auth";
import { getUserPurchases, recordPurchase } from "./purchases";
import { addReview, getAllReviews } from "./reviews";
import { addDish, getDish, getAllDishes, getPopularDishes } from "./dishes";
import { getAllRetaurants, addResturant, getRetaurant } from "./restaurants";
export {
  getAllRetaurants,
  getRetaurant,
  addResturant,
  getAllDishes,
  getDish,
  getPopularDishes,
  addDish,
  addReview,
  getAllReviews,
  getUserPurchases,
  recordPurchase,
  googleLogin,
  emailSignUp,
};
