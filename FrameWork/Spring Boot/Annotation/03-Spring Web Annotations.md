
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