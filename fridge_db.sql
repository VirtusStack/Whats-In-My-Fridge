
-- Database: `fridge_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_id` int(11) NOT NULL,
  `ingredient_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredient_id`, `ingredient_name`) VALUES
(1, 'Salt'),
(2, 'Sugar'),
(3, 'Black Pepper'),
(4, 'Olive Oil'),
(5, 'Garlic'),
(6, 'Onion'),
(7, 'Tomato'),
(8, 'Potato'),
(9, 'Carrot'),
(10, 'Cucumber'),
(11, 'Butter'),
(12, 'Flour'),
(13, 'Eggs'),
(14, 'Milk'),
(15, 'Cheese'),
(16, 'Spinach'),
(17, 'Rice'),
(18, 'Bread'),
(19, 'Pasta'),
(20, 'Bell Pepper'),
(21, 'Ginger'),
(22, 'Green Peas'),
(23, 'Corn'),
(24, 'Mushroom'),
(25, 'Paneer'),
(26, 'Yogurt'),
(27, 'Lemon'),
(28, 'Chili Powder'),
(29, 'Coriander'),
(30, 'Capsicum'),
(31, 'Turmeric'),
(32, 'Cumin Seeds'),
(33, 'Mustard Seeds'),
(34, 'Garam Masala'),
(35, 'Curry Leaves'),
(36, 'Asafoetida'),
(37, 'Green Chili'),
(38, 'Bay Leaf'),
(39, 'Moong Dal'),
(40, 'Toor Dal'),
(41, 'Chana Dal'),
(42, 'Masoor Dal'),
(43, 'Rava (Sooji)'),
(44, 'Besan (Gram Flour)'),
(45, 'Beetroot');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `recipe_id` int(11) NOT NULL,
  `recipe_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `instructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipe_id`, `recipe_name`, `description`, `instructions`) VALUES
(1, 'Paneer Butter Masala', 'Paneer cubes in rich creamy tomato gravy.', '1. Heat butter, sauté onions and garlic.\n2. Add tomato puree, chili powder, salt and simmer.\n3. Add paneer cubes and cream, cook for 5-7 mins.\n4. Garnish with coriander and serve.'),
(2, 'Vegetable Fried Rice', 'Rice stir-fried with veggies and soy sauce.', '1. Cook rice and let it cool.\n2. Heat oil in a pan, sauté garlic and onion.\n3. Add chopped vegetables, stir-fry.\n4. Mix in rice and soy sauce, stir for 2-3 mins.'),
(3, 'Aloo Paratha', 'Potato-stuffed Indian flatbread.', '1. Boil and mash potatoes with spices.\n2. Knead dough from flour and water.\n3. Roll out dough, stuff with potato, roll again.\n4. Cook on tawa with ghee until golden.'),
(4, 'Pasta Primavera', 'Pasta with sautéed vegetables and olive oil.', '1. Boil pasta and drain.\n2. In a pan, sauté garlic and chopped veggies.\n3. Add cooked pasta, olive oil, salt, and pepper.\n4. Toss and serve hot.'),
(5, 'Cheese Omelette', 'Egg omelette with cheese and pepper.', '1. Beat eggs with salt and pepper.\n2. Heat butter in pan, pour egg mixture.\n3. Once set, sprinkle cheese and fold.\n4. Cook until cheese melts.'),
(6, 'Masala Khichdi', 'Rice and lentils cooked with vegetables and spices.', '1. Wash rice and dal, soak 15 mins.\n2. Sauté onions, tomatoes, and spices in a cooker.\n3. Add vegetables, rice, and dal.\n4. Pressure cook with water until done.'),
(7, 'Grilled Cheese Sandwich', 'Melted cheese between grilled bread.', '1. Place cheese between two bread slices.\n2. Spread butter on outer sides.\n3. Grill or toast until golden brown.\n4. Serve hot.'),
(8, 'Veggie Sandwich', 'Cucumber, tomato, onion layered in bread with chutney.', '1. Slice cucumber, tomato, and onion.\n2. Apply butter and chutney on bread.\n3. Layer veggies and close sandwich.\n4. Cut and serve.'),
(9, 'Palak Paneer', 'Spinach-based curry with paneer cubes.', '1. Boil spinach and blend to puree.\n2. Sauté garlic, onion, tomato.\n3. Add spinach puree, paneer cubes, spices.\n4. Simmer for 5-7 mins.'),
(10, 'Mixed Veg Curry', 'Curry of assorted vegetables and Indian spices.', '1. Chop and boil mixed vegetables.\n2. Sauté onions, tomatoes, garlic with spices.\n3. Add boiled veggies, water and simmer.\n4. Serve with rice or roti.'),
(11, 'Moong Dal Tadka', 'Yellow moong dal cooked and tempered with spices.', '1. Wash and boil moong dal with turmeric and salt.\n2. In ghee, temper cumin, mustard seeds, garlic, green chili, and hing.\n3. Pour tempering over dal and simmer.\n4. Garnish with coriander and serve hot.'),
(12, 'Chana Masala', 'Spicy chickpea curry with onion-tomato gravy.', '1. Soak and boil chana.\n2. Sauté onion, tomato, green chili, ginger, garlic.\n3. Add spices and boiled chana.\n4. Simmer and garnish with coriander.'),
(13, 'Vegetable Pulao', 'Rice cooked with vegetables and Indian whole spices.', '1. Heat oil, add bay leaf, cumin, and mustard seeds.\n2. Sauté vegetables and washed rice.\n3. Add water, salt, turmeric, and cook until done.\n4. Fluff and serve hot.'),
(14, 'Veg Upma', 'A savory South Indian breakfast made with semolina and mixed vegetables.', '1. Heat oil, add mustard seeds and curry leaves.\n2. Sauté onions, green chili, carrots, and peas.\n3. Add semolina and roast.\n4. Add hot water, cover, and cook.'),
(15, 'Poha', 'Flattened rice cooked with onions, peanuts, and Indian spices.', '1. Rinse poha and drain.\n2. Heat oil, add mustard seeds, curry leaves, onions, chili.\n3. Add turmeric, salt, and peanuts.\n4. Add poha and mix well.'),
(16, 'Besan Chilla', 'Gram flour pancake with vegetables and spices.', '1. Mix besan with water, onion, tomato, chili, salt, and turmeric.\n2. Pour batter on hot pan and cook both sides.'),
(17, 'Vegetable Sandwich', 'A fresh sandwich with vegetables and chutney.', '1. Spread butter and chutney on bread.\n2. Layer tomato, onion, cucumber, and beetroot.\n3. Sprinkle salt and pepper.\n4. Toast or grill as desired.');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity_needed` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipe_id`, `ingredient_id`, `quantity_needed`) VALUES
(1, 5, '2 cloves'),
(1, 6, '1'),
(1, 7, '2'),
(1, 11, '1 tbsp'),
(1, 25, '200g'),
(1, 29, '1 tbsp'),
(2, 6, '1'),
(2, 10, '1'),
(2, 17, '1 cup'),
(2, 21, '1/4 cup'),
(2, 22, '1/4 cup'),
(3, 1, 'to taste'),
(3, 8, '2'),
(3, 12, '1 cup'),
(3, 28, '1 tsp'),
(4, 4, '1 tbsp'),
(4, 9, '1'),
(4, 19, '1 cup'),
(4, 20, '1'),
(4, 24, '1/4 cup'),
(5, 1, 'to taste'),
(5, 11, '1 tbsp'),
(5, 13, '2'),
(5, 15, '50g'),
(6, 6, '1'),
(6, 14, '1/2 cup'),
(6, 17, '1 cup'),
(6, 27, '1 tsp'),
(7, 11, '1 tbsp'),
(7, 15, '2 slices'),
(7, 18, '2 slices'),
(8, 6, '1'),
(8, 7, '1'),
(8, 18, '2 slices'),
(8, 27, '1 tbsp'),
(9, 1, '1 spoon'),
(9, 5, '2 cloves'),
(9, 6, '1'),
(9, 7, '2'),
(9, 16, '200g'),
(9, 25, '100 gram'),
(9, 29, '1 tbsp'),
(10, 5, '2 cloves'),
(10, 6, '1'),
(10, 7, '2'),
(10, 8, '1 cup'),
(10, 29, '1 tbsp'),
(11, 1, 'to taste'),
(11, 5, '2 cloves'),
(11, 29, '1 tbsp'),
(11, 30, '1/2 tsp'),
(11, 31, '1/2 tsp'),
(11, 32, '1/2 tsp'),
(11, 36, '1'),
(11, 37, '1'),
(11, 39, '1 cup'),
(12, 5, '2 cloves'),
(12, 6, '1'),
(12, 7, '2'),
(12, 20, '1'),
(12, 29, '1 tbsp'),
(12, 30, '1/2 tsp'),
(12, 34, '1 tsp'),
(12, 36, '1'),
(13, 1, 'to taste'),
(13, 10, '1'),
(13, 17, '1 cup'),
(13, 20, '1'),
(13, 22, '1/4 cup'),
(13, 30, '1/2 tsp'),
(13, 31, '1/2 tsp'),
(13, 32, '1/2 tsp'),
(13, 38, '1'),
(14, 1, 'to taste'),
(14, 4, '1 tbsp'),
(14, 6, '1 small'),
(14, 9, '1/2 chopped'),
(14, 22, '1/4 cup'),
(14, 33, '1/2 tsp'),
(14, 35, 'few'),
(14, 43, '1 cup'),
(15, 1, 'to taste'),
(15, 4, '1 tbsp'),
(15, 6, '1'),
(15, 22, '1/4 cup'),
(15, 28, '1/4 tsp'),
(15, 31, '1/4 tsp'),
(15, 33, '1/2 tsp'),
(15, 35, 'few'),
(15, 37, '1 chopped'),
(16, 1, 'to taste'),
(16, 4, 'as needed'),
(16, 6, '1/2, chopped'),
(16, 7, '1/2, chopped'),
(16, 28, '1/4 tsp'),
(16, 31, '1/4 tsp'),
(16, 44, '1 cup'),
(17, 1, 'to taste'),
(17, 3, 'to taste'),
(17, 6, '1 sliced'),
(17, 7, '1 sliced'),
(17, 10, '1 sliced'),
(17, 11, '1 tbsp'),
(17, 18, '2 slices'),
(17, 27, '1 tbsp'),
(17, 45, '1/2 cup sliced');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`) ON DELETE CASCADE;
COMMIT;


