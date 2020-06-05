# flutter_woocommerce

Let's integrate woo api with flutter easily.

## Getting Started

Create instance 
```  
FlutterWoocommerce flutterWoocommerce = FlutterWoocommerce(
      url: <url>,
      consumerKey: <your_consumerKey>,
      consumerSecret: <your_consumerSecret>,
  );
```
## Basic CRUD Requests

### Create
Create data using POST request. Use 
**postReq(** *String* **endPoint**, *Map* **data** )
method. It will return `Json Object` if no error. Then assign it with corresponding Object. And will return **`WooError`** if there is error.   

Example of creating a customer using POST Request
  ```
  createCustomer() async {
    Customer newCustomer = Customer(
        firstName: "Ma Tin",
        lastName: "Shwe",
        userName: "matinshwe",
        email: "matinshwe@someone.com");
    newCustomer.password = "12345";
    var result =
        await flutterWoocommerce.postReq('customers', newCustomer.toMap());
    if (result is! WooError) {
      Customer createdCustomer = Customer.fromJSON(result);
      print(createdCustomer.userName + " is created successfully!");
    } else {
      WooError err = result;
      print(err.message);
    }
  }
```


### Read
Read data using GET request. Use **getReq(** *String* **endpoint** **)** method. It will return `Json Object` if no error. Assign it with corresponding Object. And will return **`WooError`** if there is error.   
>*But sometimes you may need to use POST to read data according to condition.*

Example of reading list of customers using GET Request
  ```
  fetchAllOrders() async {
    List<Order> orderList = [];
    var result = await flutterWoocommerce.getReq('orders');
    if (result is !WooError) {
      List<dynamic> resultList = result;
      resultList.forEach((order) {
        orderList.add(Order.fromJSON(order));
      });
    }else{
      WooError err = result;
      print(err.message);
    }
    print(orderList.length);
  }
```



### Update
Update data using PUT request. Use **putReq(** *String* **endPoint**, *Map* **data** ) method. It will return `Json Object` if no error. Assign it with corresponding Object. And will return **`WooError`** if there is error.   

Example of updating a product using PUT Request
  ```
  updateProduct() async{
    ProductItem productItem = ProductItem(regularPrice: "USD 500");
    var result =
        await flutterWoocommerce.putReq('products/57', productItem.toMap());
    if (result is! WooError) {
      ProductItem createdCustomer = ProductItem.fromJSON(result);
      print(createdCustomer.name + " is updated successfully!");
    } else {
      WooError err = result;
      print(err.message);
    }
  }
```

### Delete
Delete data using DELETE request. Use **deleteReq(** *String* **endPoint**) method. It will return `Json Object` if no error. Assign it with corresponding Object. And will return **`WooError`** if there is error.   

Example of deleting an order using DELETE Request
  ```
  deleteOrder() async {
    var result = await flutterWoocommerce.deleteReq('orders/27');
    if (result is! WooError) {
      Order order = Order.fromJSON(result);
      print(order.id.toString() + " is deleted successfully!");
    } else {
      WooError err = result;
      print(err.message);
    }
  }
```

## Authentication
Intented for customer and admin login. You must install [JWT_auth](https://wordpress.org/plugins/jwt-auth/) plugin first in your wordpress site.

Use **customerLogin(** *User* **user** **)** method to authenticate. It will return **`WooAuthedUser`** object if exist.

For Example:
```
  loginCutomer() async{
    var result = await flutterWoocommerce.customerLogin(User(username: 'username', password: "12345"));
    if(result is! WooError){
      WooAuthedUser wooAuthedUser = result;
      print(wooAuthedUser.displayName);
    }else{
      WooError err = result;
      print(err.message);
    }
  }
```

## Bonus Methods
There are some additional methods to save your time.
| Method                                              | Return               |
| :---------------------------------------:           |:-------------------: |
| `customerSignUp(`*`User`*` user)`                   | **`Customer`**       |
| `getCustomers()`                                    | **`List<Customer>`** |
| `updateCustomer(`*`Customer`*` customer)`           | **`Customer`**       |
| `getCustomerByEmail(`*`String`*` email)`            | **`Customer`**       |

## Objects
Ready to use Objects. Unchecked items are not completed yet.
- [x] Customer
- [] Order
- [x] Billing
- [x] Shipping
- [] LineItem 
- [] ProductItem
- [x] Img