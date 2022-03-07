export interface User {
  id: number;
  name: String;
  dilivery_address: String;
  tel: String;
  email: String;
  password: String;
  provider: String;
  favorites: number[];
  image: String;
  payment_methods: String;
  created_at: Date;
  modified_at: Date;
}
