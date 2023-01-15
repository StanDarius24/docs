#java #springBoot #security

---

Spring Security is a framework that provides [authentication], [authorization], and [protection against common attacks]. With first class support for securing both [[Servlet]] and [[Reactive Applications]] applications, it is the de-facto standard for securing Spring-based applications.

---

### Authentication

Spring Security provides comprehensive support for [authentication](https://en.wikipedia.org/wiki/Authentication). Authentication is how we verify the identity of who is trying to access a particular resource. A common way to authenticate users is by requiring the user to enter a username and password. Once authentication is performed we know the identity and can perform authorization.

Spring Security provides built-in support for authenticating users. This section is dedicated to generic authentication support that applies in both Servlet and WebFlux environments. See the sections on authentication for [[Servlet]] and WebFlux for details on what is supported for each stack.

---

### Authorization

Spring Security provides comprehensive support for [authorization](https://en.wikipedia.org/wiki/Authorization). Authorization is determining who is allowed to access a particular resource. Spring Security provides [defense in depth](https://en.wikipedia.org/wiki/Defense_in_depth_(computing)) by allowing for request based authorization and method based authorization.

## Request Based Authorization

Spring Security provides authorization based upon the request for both [[Servlet]] and WebFlux environments.

---

# Protection Against Exploits

Spring Security provides protection against common exploits. Whenever possible, the protection is enabled by default. This section describes the various exploits that Spring Security protects against.

-   [CSRF](https://docs.spring.io/spring-security/reference/features/exploits/csrf.html)
-   [HTTP Headers](https://docs.spring.io/spring-security/reference/features/exploits/headers.html)
-   [HTTP Requests](https://docs.spring.io/spring-security/reference/features/exploits/http.html)

---