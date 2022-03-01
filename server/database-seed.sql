-- CREATE TABLE restaurants (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(50),
--   diliveryTime VARCHAR(20),
--   numberOfDishes,
--   tel VARCHAR(10) NOT NULL,
--   location VARCHAR(100) NOT NULL,
--   avatar VARCHAR(255) NOT NULL,
-- );
-- CREATE TABLE dishes (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   restaurant_id INT REFERENCES restaurants(id),
--   name TEXT,
--   price FLOAT [],
--   toppings VARCHAR(20) [],
--   rating TEXT [],
--   image VARCHAR(255) NOT NULL,
--   description TEXT,
--   purchases INT,
--   FOREIGN KEY dishes_key (restaurant_id) REFERENCES restaurants(id)
-- );
-- INSERT INTO
--   restaurants(
--     name,
--     diliveryTime,
--     numberOfDishes,
--     tel,
--     location,
--     avatar
--   )
-- VALUES
--   (
--     "Heavenly Kitchen Fast Food",
--     "34 mins",
--     3,
--     "0249555935",
--     "Success City",
--     "https://i.pinimg.com/564x/01/88/dc/0188dc41881e0e410b5375cdead5f49a.jpg"
--   ),
--   (
--     "Cheddar Fast Foods",
--     "14mins",
--     2,
--     "0249956539",
--     "Ayensu Road",
--     "https://cdn.pixabay.com/photo/2016/06/02/02/33/triangles-1430105_1280.png"
--   ),
--   (
--     "Tasty Chef Fast Foods",
--     "1hr",
--     3,
--     "0249555935",
--     "Adehyiɛ Hall",
--     "https://cdn.pixabay.com/photo/2015/12/09/01/02/mandalas-1084082_1280.jpg"
--   ),
--   (
--     "Daavi's Kitchen",
--     "23mins",
--     3,
--     "0249956539",
--     "Apɛwosika",
--     "https://cdn.pixabay.com/photo/2018/08/21/23/29/forest-3622519_1280.jpg"
--   ),
--   (
--     "Gↄbɛ Wura",
--     "6mins",
--     1,
--     "0249555935",
--     "Amamoma",
--     "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2020/09/Frame-47.png"
--   ),
--   (
--     "Amelia Waakye",
--     "13mins",
--     1,
--     "0249956539",
--     "Science Market",
--     "https://cdn.pixabay.com/photo/2015/12/09/01/02/mandalas-1084082_1280.jpg"
--   ),
CREATE TABLE employees (
  id SERIAL,
  name text,
  title text,
  CONSTRAINT employees_pkey PRIMARY KEY (id)
);

INSERT INTO
  employees(name, title)
VALUES
  ('Meadow Crystalfreak ', 'Head of Operations'),
  ('Buddy-Ray Perceptor', 'DevRel'),
  ('Prince Flitterbell', 'Marketing Guru');