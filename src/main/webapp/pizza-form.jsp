<%--
  Created by IntelliJ IDEA.
  User: tenglishjr
  Date: 8/21/18
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order</title>
</head>
<body>

    <h2>Order Online</h2>

    <form action="/order" method="POST">

        <p>Name: </p>
        <input type="text" name="name" placeholder="Enter name">

        <p>Address: </p>
        <input type="text" name="address" placeholder="123 Main St, Austin, TX 78111">

        <p>Choose a size:</p>
        <select name="size">
            <option value="null">Select size...</option>
            <option value="12">Small (12")</option>
            <option value="14">Medium (14")</option>
            <option value="16">Large (16")</option>
        </select>

        <p>Choose a sauce:</p>
        <input type="radio" id="sauce-tom" name="sauce" value="robust-tomato" selected>
        <label for="sauce-tom">Robust Tomato</label>
        <input type="radio" id="sauce-mar" name="sauce" value="marinara">
        <label for="sauce-mar">Marinara</label>
        <input type="radio" id="sauce-alf" name="sauce" value="alfredo">
        <label for="sauce-alf">Alfredo</label>

        <p>Choose toppings:</p>
        <input id="cheese" type="checkbox" name="toppings[]" value="cheese" checked>
        <label for="cheese">Cheese</label>
        <input id="pepperoni" type="checkbox" name="toppings[]" value="pepperoni">
        <label for="pepperoni">Pepperoni</label>
        <input id="sausage" type="checkbox" name="toppings[]" value="sausage">
        <label for="sausage">Sausage</label>
        <input id="olives" type="checkbox" name="toppings[]" value="olives">
        <label for="olives">Black Olives</label>
        <input id="onions" type="checkbox" name="toppings[]" value="onions">
        <label for="onions">Onions</label>
        <input id="mushrooms" type="checkbox" name="toppings[]" value="mushrooms">
        <label for="mushrooms">Mushrooms</label>
        <input id="pineapple" type="checkbox" name="toppings[]" value="pineapple">
        <label for="pineapple">Pineapple</label>

        <button type="submit" value="submit">Review Order</button>

    </form>


</body>
</html>
