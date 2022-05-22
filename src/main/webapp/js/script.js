function add_to_cart(bid, bname, price) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		//no cart yet

		let books = [];
		let book = { bookId: bid, bookName: bname, bookQuantity: 1, bookPrice: price };
		books.push(book);
		localStorage.setItem("cart", JSON.stringify(books));
		console.log("Book is added for the first time");

	} else {
		//cart is already present
		let bcart = JSON.parse(cart);
		let oldBook = bcart.find((item) => item.bookId == bid)

		if (oldBook) {
			//we have to increase the quantity

			oldBook.bookQuantity = oldBook.bookQuantity + 1
			bcart.map((item) => {
				if (item.bookId == oldBook.bookId) {

					item.bookQuantity = oldBook.bookQuantity;

				}

			})

			localStorage.setItem("cart", JSON.stringify(bcart));
			console.log(" Book quantity is increased");

		} else {
			//we have add the book

			let book = { bookId: bid, bookName: bname, bookQuantity: 1, bookPrice: price };
			bcart.push(book)
			localStorage.setItem("cart", JSON.stringify(bcart));
			console.log(" Book is added");

		}

	}

	updateCart();
}
//uodate cart:
function updateCart() {

	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		console.log("cart is empty");

		$(".cart-items").html("( 0 ) ");
		$(".cart-body").html("<h3>Cart does not have any items </h3>");
		$(".checkout-btn").attr('disabled',true);

	} else {
		//there is something in cart to show
		console.log(cart);
		$(".cart-items").html(`( ${cart.length})`);
		let table = `    
		
		<table class='table'>
		<thead class='thead-light'>
		<tr>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Total Price</th>
		<th>Action</th>
		</tr>
		
		</thead>
		`;
		let totalPrice = 0;
		cart.map((item) => {

			table += `
		    <tr>
		      <td>${item.bookName} </td>
		        <td>${item.bookPrice} </td>
		          <td>${item.bookQuantity} </td>
		            <td>${item.bookQuantity * item.bookPrice} </td>
		               <td><button onclick='deleteItemFromCart(${item.bookId})' class='btn btn-danger btn-sm'>Remove</button></td>
		    </tr>
		`
			totalPrice += item.bookPrice * item.bookQuantity;
		})




		table = table + `
		
		<tr><td colspan='5' class='text-right font-weight-bold m-5'> Total Price : ${totalPrice}</td></tr>
		
		</table>`

		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);



	}


}

//delete item
function deleteItemFromCart(bid) {
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newcart = cart.filter((item) => item.bookId != bid);
	localStorage.setItem('cart', JSON.stringify(newcart));
	updateCart();
}




$(document).ready(function() {
	updateCart();

})

function goToCheckout() {
	window.location="checkout.jsp";

}