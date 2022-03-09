CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  dilivery_address VARCHAR,
  tel VARCHAR(10) UNIQUE,
  email VARCHAR NOT NULL UNIQUE,
  password VARCHAR,
  provider VARCHAR(25) NOT NULL,
  favorites INT [],
  image VARCHAR,
  payment_methods JSON [],
  refresh_tokens VARCHAR [],
  created_at TIMESTAMPTZ NOT NULL,
  modified_at TIMESTAMPTZ NOT NULL
);

CREATE TABLE restaurants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  tel VARCHAR(10) NOT NULL UNIQUE,
  description TEXT,
  location VARCHAR NOT NULL,
  image VARCHAR NOT NULL
);

CREATE TABLE dishes (
  id SERIAL PRIMARY KEY,
  restaurant_id INT REFERENCES restaurants(id),
  name VARCHAR(100),
  price FLOAT(2) [],
  toppings VARCHAR(20) [],
  image VARCHAR NOT NULL,
  description TEXT,
  purchases INT
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  dish_id INT NOT NULL REFERENCES dishes(id),
  rating INT NOT NULL,
  message TEXT NOT NULL
);

CREATE TABLE purchases (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  dish_id INT NOT NULL REFERENCES dishes(id),
  restaurant_id INT NOT NULL REFERENCES restaurants(id),
  number_ordered INT NOT NULL,
  price FLOAT(2) NOT NULL
);

INSERT INTO
  restaurants(
    name,
    tel,
    location,
    image
  )
VALUES
  (
    'Heavenly Kitchen Fast Food',
    '0249555935',
    'Success City',
    'https://i.pinimg.com/564x/01/88/dc/0188dc41881e0e410b5375cdead5f49a.jpg'
  ),
  (
    'Cheddar Fast Foods',
    '0249956539',
    'Ayensu Road',
    'https://cdn.pixabay.com/photo/2016/06/02/02/33/triangles-1430105_1280.png'
  ),
  (
    'Tasty Chef Fast Foods',
    '0249555936',
    'Adehyiɛ Hall',
    'https://cdn.pixabay.com/photo/2015/12/09/01/02/mandalas-1084082_1280.jpg'
  ),
  (
    'Daavi''s Kitchen',
    '0249956530',
    'Apɛwosika',
    'https://cdn.pixabay.com/photo/2018/08/21/23/29/forest-3622519_1280.jpg'
  ),
  (
    'Gↄbɛ Wura',
    '0249555937',
    'Amamoma',
    'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2020/09/Frame-47.png'
  ),
  (
    'Amelia Waakye',
    '0249956531',
    'Science Market',
    'https://cdn.pixabay.com/photo/2015/12/09/01/02/mandalas-1084082_1280.jpg'
  );

INSERT INTO
  dishes(
    restaurant_id,
    name,
    toppings,
    price,
    image,
    purchases
  )
VALUES
  (
    3,
    'Jollof Rice with Chicken',
    '{"Salad", "Salad Cream", "Tomato Sauce"}',
    '{11.00, 14.00, 16.00, 21.00}',
    'https://res.cloudinary.com/kennydop/image/upload/v1646235755/uchow/dishes/dummy/jollof_epfs5g.jpg',
    7
  );

INSERT INTO
  dishes(
    restaurant_id,
    name,
    toppings,
    price,
    image,
    description,
    purchases
  )
VALUES
  (
    2,
    'Fried Rice with Chicken',
    '{"Salad", "Salad Cream", "Tomato Sauce"}',
    '{9.00, 11.00, 16.00}',
    'https://res.cloudinary.com/kennydop/image/upload/v1646235755/uchow/dishes/dummy/fried_rice_lq7j9h.jpg',
    'Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.',
    8
  ),
  (
    6,
    'Waakye',
    '{"Salad", "Salad Cream", "Tomato Sauce"}',
    '{9.00, 11.00, 14.00}',
    'https://res.cloudinary.com/kennydop/image/upload/v1646235756/uchow/dishes/dummy/waakye_ggc1ov.jpg',
    'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.',
    16
  );

INSERT INTO
  dishes(
    restaurant_id,
    name,
    price,
    image,
    description,
    purchases
  )
VALUES
  (
    1,
    'Boiled Yam and Vegetable Stew',
    '{16.00, 21.00}',
    'https://res.cloudinary.com/kennydop/image/upload/v1646235756/uchow/dishes/dummy/yam_umh34g.jpg',
    'Video provides a powerful way to help you prove your point. When you click Online Video, you can paste in the embed code for the video you want to add. You can also type a keyword to search online for the video that best fits your document.',
    6
  ),
  (
    4,
    'Banku with Okro Stew',
    '{9.00, 11.00, 14.00, 21.00}',
    'https://res.cloudinary.com/kennydop/image/upload/v1646235754/uchow/dishes/dummy/banku_unieir.jpg',
    'Save time in Word with new buttons that show up where you need them. To change the way a picture fits in your document, click it and a button for layout options appears next to it. When you work on a table, click where you want to add a row or a column, and then click the plus sign.',
    8
  );

INSERT INTO
  dishes(
    restaurant_id,
    name,
    price,
    image,
    purchases
  )
VALUES
  (
    5,
    'Fried Ripe Plantain with Beans Stew',
    '{6.00, 9.00, 11.00, 16.00}',
    'https://res.cloudinary.com/kennydop/image/upload/v1646235754/uchow/dishes/dummy/beans_tdxkwt.jpg',
    24
  );