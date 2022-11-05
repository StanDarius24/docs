#java #springBoot 

In this tutorial, we'll explore Spring Web annotations from the _org.springframework.web.bind.annotation_ package.

---

## 2. _@RequestMapping_

Simply put, [_@RequestMapping_](https://www.baeldung.com/spring-requestmapping) **marks request handler methods** inside _@Controller_ classes; it can be configured using:

-   _path,_ or its aliases, _name,_ and _value:_ which URL the method is mapped to
-   _method:_ compatible HTTP methods
-   _params:_ filters requests based on presence, absence, or value of HTTP parameters
-   _headers:_ filters requests based on presence, absence, or value of HTTP headers
-   _consumes:_ which media types the method can consume in the HTTP request body
-   _produces:_ which media types the method can produce in the HTTP response body

Here's a quick example of what that looks like:

```java
@Controller
class VehicleController {

    @RequestMapping(value = "/vehicles/home", method = RequestMethod.GET)
    String home() {
        return "home";
    }
}
```

We can provide **default settings for all handler methods in a _@Controller_ class** if we apply this annotation on the class level. The only **exception is the URL which Spring won't override** with method level settings but appends the two path parts.

For example, the following configuration has the same effect as the one above:

```java
@Controller
@RequestMapping(value = "/vehicles", method = RequestMethod.GET)
class VehicleController {

    @RequestMapping("/home")
    String home() {
        return "home";
    }
}
```

Moreover, _@GetMapping_, _@PostMapping_, _@PutMapping_, _@DeleteMapping_, and _@PatchMapping_ are different variants of _@RequestMapping_ with the HTTP method already set to GET, POST, PUT, DELETE, and PATCH respectively.

These are available since Spring 4.3 release.

---

### 3. _@RequestBody_
Let's move on to [_@RequestBody_](https://www.baeldung.com/spring-request-response-body) – which maps the **body of the HTTP request to an object**:
```java
@PostMapping("/save")
void saveVehicle(@RequestBody Vehicle vehicle) {
    // ...
}
```
The deserialization is automatic and depends on the content type of the request.

### 4. _@PathVariable_
Next, let's talk about _@PathVariable_.

This annotation indicates that a **method argument is bound to a URI template variable**. We can specify the URI template with the _@RequestMapping_ annotation and bind a method argument to one of the template parts with _@PathVariable_.

We can achieve this with the _name_ or its alias, the _value_ argument:
```java
@RequestMapping("/{id}")
Vehicle getVehicle(@PathVariable("id") long id) {
    // ...
}
```
If the name of the part in the template matches the name of the method argument, we don't have to specify it in the annotation:
```java
@RequestMapping("/{id}")
Vehicle getVehicle(@PathVariable long id) {
    // ...
}
```
Moreover, we can mark a path variable optional by setting the argument _required_ to false:
```java
@RequestMapping("/{id}")
Vehicle getVehicle(@PathVariable(required = false) long id) {
    // ...
}
```

---

### 5. _@RequestParam_
We use _@RequestParam_ for **accessing HTTP request parameters**:
```java
@RequestMapping
Vehicle getVehicleByParam(@RequestParam("id") long id) {
    // ...
}
```
It has the same configuration options as the _@PathVariable_ annotation.

In addition to those settings, with _@RequestParam_ we can specify an injected value when Spring finds no or empty value in the request. To achieve this, we have to set the _defaultValue_ argument.

Providing a default value implicitly sets _required_ to _false:_
```java
@RequestMapping("/buy")
Car buyCar(@RequestParam(defaultValue = "5") int seatCount) {
    // ...
}
```
Besides parameters, there are **other HTTP request parts we can access: cookies and headers**. We can access them with the annotations **_@CookieValue_ and _@RequestHeader_** respectively.

We can configure them the same way as _@RequestParam_.

---

## 6. Response Handling Annotations
In the next sections, we will see the most common annotations to manipulate HTTP responses in Spring MVC.

#### 6.1. _@ResponseBody_
If we mark a request handler method with _[@ResponseBody](https://www.baeldung.com/spring-request-response-body),_ **Spring treats the result of the method as the response itself**:
```java
@ResponseBody
@RequestMapping("/hello")
String hello() {
    return "Hello World!";
}
```
If we annotate a _@Controller_ class with this annotation, all request handler methods will use it.

---

#### 6.2. _@ExceptionHandler_
With this annotation, we can declare a **custom error handler method**. Spring calls this method when a request handler method throws any of the specified exceptions.

The caught exception can be passed to the method as an argument:
```java
@ExceptionHandler(IllegalArgumentException.class)
void onIllegalArgumentException(IllegalArgumentException exception) {
    // ...
}
```

---

#### 6.3. _@ResponseStatus_
We can specify the **desired HTTP status of the response** if we annotate a request handler method with this annotation. We can declare the status code with the _code_ argument, or its alias, the _value_ argument.

Also, we can provide a reason using the _reason_ argument.

We also can use it along with _@ExceptionHandler_:
```java
@ExceptionHandler(IllegalArgumentException.class)
@ResponseStatus(HttpStatus.BAD_REQUEST)
void onIllegalArgumentException(IllegalArgumentException exception) {
    // ...
}
```
For more information about HTTP response status, please visit [this article](https://www.baeldung.com/spring-mvc-controller-custom-http-status-code).

---

## 7. Other Web Annotations

Some annotations don't manage HTTP requests or responses directly. In the next sections, we'll introduce the most common ones.

### 7.1. _@Controller_

We can define a Spring MVC controller with _@Controller_.
More information in Beans Annotations ;)

### 7.2. _@RestController_
The _@RestController_ **combines _@Controller_ and _@ResponseBody_**.

Therefore, the following declarations are equivalent:
```java
@Controller
@ResponseBody
class VehicleRestController {
    // ...
}
```

```java
@RestController
class VehicleRestController {
    // ...
}
```

---

### 7.3. _@ModelAttribute_
With this annotation we can **access elements that are already in the model** of an MVC _@Controller,_ by providing the model key:
```java
@PostMapping("/assemble")
void assembleVehicle(@ModelAttribute("vehicle") Vehicle vehicleInModel) {
    // ...
}
```
Like with _@PathVariable_ and _@RequestParam_, we don't have to specify the model key if the argument has the same name:
```java
@PostMapping("/assemble")
void assembleVehicle(@ModelAttribute Vehicle vehicle) {
    // ...
}
```
Besides, _@ModelAttribute_ has another use: if we annotate a method with it, Spring will **automatically add the method's return value to the model**:
```java
@ModelAttribute("vehicle")
Vehicle getVehicle() {
    // ...
}
```
Like before, we don't have to specify the model key, Spring uses the method's name by default:
```java
@ModelAttribute
Vehicle vehicle() {
    // ...
}
```
Before Spring calls a request handler method, it invokes all _@ModelAttribute_ annotated methods in the class.
More information about _@ModelAttribute_ can be found in [this article](https://www.baeldung.com/spring-mvc-and-the-modelattribute-annotation).

---

### 7.4. _@CrossOrigin_
_@CrossOrigin_ **enables cross-domain communication** for the annotated request handler methods:

```java
@CrossOrigin
@RequestMapping("/hello")
String hello() {
    return "Hello World!";
}
```
If we mark a class with it, it applies to all request handler methods in it.

We can fine-tune CORS behavior with this annotation's arguments.