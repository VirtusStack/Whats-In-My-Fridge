<?php
// connect to database 
$conn = new mysqli("localhost", "root", "", "fridge_db");
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
}

$recipes=[];
$selected_ingredients=[];

if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST['ingredients']))  {
$selected_ingredients = array_map('intval', $_POST['ingredients']);
$count = count($selected_ingredients);

if ($count > 0) {
  $placeholders = implode(', ', array_fill(0, $count, '?'));

//find recipes containing all selected ingredients
$sql="
     SELECT r.recipe_id, r.recipe_name, r.description, r.instructions
     FROM recipes r
     JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
     WHERE ri.ingredient_id IN ($placeholders)
     GROUP BY r.recipe_id
     HAVING COUNT(DISTINCT ri.ingredient_id) = $count
     ";
     
     $stmt = $conn->prepare($sql);
     $types = str_repeat('i', $count);
     $stmt->bind_param($types, ...$selected_ingredients);
     $stmt->execute();
     $result = $stmt->get_result();
     
     while ($row = $result->fetch_assoc()) {
            $recipes[] = $row;
        }
    }
  }

// Fetch all ingredients
$all_ingredients = [];
$ings_result = $conn->query("SELECT ingredient_id, ingredient_name FROM ingredients ORDER BY ingredient_name");
while ($row = $ings_result->fetch_assoc()) {
    $all_ingredients[] = $row;
}
?>
<!DOCTYPE html>
<html lang="en">
<head> 
<meta charset="UTF-8">    
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>What's In My Fridge</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
background-color: #f8f9fa;
}
.center-box{
max-width: 700px;
margin: 80px auto;
padding: 30px;
background-color: white;
border-radius: 15px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.ingredients-wrapper{
display: flex;
flex-wrap: wrap;
gap:10px;
justify-content: flex-start;
margin-bottom: 20px;
}
input[type="checkbox"] {
            display: none;
}
.ingredient-label {
cursor: pointer;
padding: 8px 16px;
border: 2px solid #ced4da;
border-radius: 8px;
background-color: #fff;
font-weight: 500;
color: #333;
transition: all 0.3s ease;
user-select: none;
}
.ingredient-label:hover {
border-color: #0d6efd;
background-color: #e7f1ff;
color: #0d6efd; 
}
input[type="checkbox"]:checked + .ingredient-label {
 background-color: #0d6efd;
 color: #fff;
 border-color: #0d6efd;
}

</style>
</head>
<body>
<div class="container">
<div class="center-box text-center">
<h1 class="mb-4">What's In My Fridge</h1>
<form method="POST">
<div class="mb-2 text-start">
<label class="form-label">Select Ingredient:</label>
</div>
<div class="ingredients-wrapper">
<?php foreach ($all_ingredients as $ingredient):
   $checked=in_array($ingredient['ingredient_id'], $selected_ingredients) ? 'checked' : '';
?>
<input type="checkbox" name="ingredients[]" id="ing<?= $ingredient['ingredient_id'] ?>" value="<?= $ingredient['ingredient_id'] ?>" <?=$checked ?>>
<label for="ing<?= $ingredient['ingredient_id'] ?>" class="ingredient-label"><?= htmlspecialchars($ingredient['ingredient_name']) ?></label>

<?php endforeach; ?>
</div>
<div class="d-flex justify-content-between">
<button type="submit" class="btn btn-primary">Find Recipes</button>
<a href="<?= htmlspecialchars($_SERVER['PHP_SELF']) ?>" class="btn btn-secondary">Clear</a>
 </div>
</form>

<?php if ($_SERVER["REQUEST_METHOD"] == "POST"): ?>
<h2 class = "mt-4 text-start">Matching Recipes:</h2>
<?php if (!empty($recipes)): ?>
<?php foreach ($recipes as $recipe): ?>
<div class="card my-3 text-start">
<div class="card-body">
<h5 class="card-title"><?= htmlspecialchars($recipe['recipe_name']) ?></h5>
 <p class="card-text"><?= htmlspecialchars($recipe['description']) ?></p>
<?php if (!empty($recipe['instructions'])): ?>                              
 <p><strong>Instructions:</strong><br><?= nl2br(htmlspecialchars($recipe['instructions'])) ?></p>
 <?php endif; ?>
 <strong>Ingredients needed:</strong>
<ul>
<?php
$placeholders= implode(', ', array_fill(0, count($selected_ingredients), '?'));
$sql_qty="
   SELECT i.ingredient_name, ri.quantity_needed
   FROM recipe_ingredients ri
   JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
   WHERE ri.recipe_id = ? AND ri.ingredient_id IN ($placeholders)
  ";
$stmt_qty = $conn->prepare($sql_qty);
$types_qty = 'i' .str_repeat('i', count($selected_ingredients));
$params_qty = array_merge([$recipe['recipe_id']], $selected_ingredients);
$stmt_qty->bind_param($types_qty, ...$params_qty);
$stmt_qty->execute();
$qty_result = $stmt_qty->get_result();
while ($row_qty = $qty_result->fetch_assoc()) {
    echo "<li>" .htmlspecialchars($row_qty['ingredient_name']). ": " . htmlspecialchars($row_qty['quantity_needed']) . "</li>";
}
?>
</ul>
</div>
</div>
<?php endforeach; ?>
<?php else: ?>
<p class="mt-3 text-danger">No matching recipes found. </p>
<?php endif; ?>
<?php endif; ?>
</div>
</div>
</body>
</html>
