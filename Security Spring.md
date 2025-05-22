1. Why do we need security?
2. Layers of security 
	- Cloud Environment
	- Virtual Machines
	- Operation System
	- Containers
	- Web/App Server
	- Web Apps/Services
3. Security Internal Flow
	- Servlets & Filters
		- DisableEncodeUrlFilter -> is a filter in Spring Security that prevents the encoding of URLs. by default spring security encodes certain characters in URLs to prevent potential security vulnerabilities. prevents Spring Security from automatically encoding URLs. This allows applications to maintain their original URL structure without modification.
		 HttpServletResponse (overwrites encodeRedirectURL and encodeURL)
		- WebAsyncManagerIntegrationFilter -> It integrates Spring Security with Spring's WebAsyncManager to handle asynchronous requests securely. In essence, this filter prepares the groundwork for maintaining security context in asynchronous operations, but doesn't actively modify the request or response. It ensures that when async operations occur later in the request lifecycle, the necessary security components are in place to handle them properly.
		- SecurityContextHolderFilter -> The primary importance of this filter is that it establishes the security context for each request, making authentication and authorization information available throughout the request processing lifecycle. It also ensures proper cleanup, preventing potential security vulnerabilities that could arise from lingering security contexts. (To load and set the `SecurityContext` for each HTTP request, and to clear it after the request is processed.)
		- HeaderWriterFilter -> The primary importance of this filter is that it provides a centralized and flexible way to add security headers to HTTP responses. These headers can include things like Content Security Policy (CSP), X-Frame-Options, X-XSS-Protection, and others, which are crucial for protecting against various web vulnerabilities. By default, it writes headers after processing, which allows for any potential modifications during the request processing to be reflected in the headers. However, it also offers the option to write headers early if needed for specific use cases.
		- CorsFilter -> is responsible for handling Cross-Origin Resource Sharing (CORS) requests, To implement CORS support, allowing controlled access to resources from a different domain than the one serving the web application. You probably tried to create a website when you were in university, but when trying to add a picture from a different website was broken basically this is a functionality implemented in the browser to only accept informations from one host (same origin policy)
		- CsrfFilter -> To prevent CSRF attacks by ensuring that requests to your application are coming from your own forms and not from malicious sites. Generates and manages CSRF tokens Validates CSRF tokens on incoming requests Rejects requests that don't have a valid CSRF token
		- LogoutFilter -> To process logout requests and perform necessary cleanup actions when a user logs out of the application.
		- UsernamePasswordAuthenticationFilter -> Intercepts login requests Extracts username and password from the request Attempts to authenticate the user Handles successful or failed authentication
		- DefaultLoginPageGeneratingFilter -> is particularly useful during development or for simple applications where a custom login page isn't necessary. It provides a quick, secure way to implement authentication without the need for additional view templates or controllers. However, for most production applications, it's typically replaced with a custom login page that matches the application's design and provides more advanced features or branding.
		- DefaultLogoutPageGeneratingFilter -> To automatically generate a simple logout page when the application doesn't provide its own custom logout page.
		- BasicAuthenticationFilter -> Basic Auth Intercepts incoming requests Checks for the presence of Basic Authentication credentials Authenticates users based on these credentials Sets the authenticated user in the SecurityContext
		- RequestCacheAwareFilter -> plays a crucial role in enhancing user experience in web applications using Spring Security. It ensures that users are seamlessly redirected to their originally requested page after going through the authentication process, rather than always landing on a default page post-login. This is particularly useful in scenarios where users might click on a deep link or bookmark to a protected page, get redirected to login, and then want to return to that specific page after successful authentication.
		- SecurityContextHolderAwareRequestFilter -> Wraps the original `HttpServletRequest` with a custom implementation Integrates Spring Security's authentication and authorization with standard Servlet security methods Allows Servlet API security methods to work seamlessly with Spring Security, is particularly valuable in scenarios where an application needs to support both Spring Security and standard Servlet security methods
		- AnonymousAuthenticationFilter -> is designed to handle unauthenticated users by creating an anonymous user identity, ensuring that every request in a Spring Security-protected application has an Authentication object. This consistent presence of Authentication allows for more straightforward and uniform security checks throughout the application. It's particularly useful in scenarios where parts of an application should be accessible to unauthenticated users, but you still want to apply security rules or differentiate between anonymous and authenticated access.
		- ExceptionTranslationFilter -> handles exceptions thrown during the security handling process, Intercepts security exceptions thrown by the filter chain Translates these exceptions into HTTP responses Initiates authentication or access denied processes as needed
		- AuthorizationFilter -> Evaluates access control rules for each request  Determines if the authenticated user (or anonymous user) has permission to access the requested resource Allows or denies access based on the evaluation result
	
---

x: Arhitecture

- Servlet containers (e.g., Tomcat, JBoss) convert HTTP requests into ServletRequest objects that Java code can process.
- Servlets handle the actual business logic invocation in frameworks like Spring Boot and Spring Security.
- Filters intercept requests and responses between the client and servlets, allowing for pre-processing and post-processing of data.
- Spring Security implements much of its functionality using filters to intercept and process requests.
- Filters are executed before servlets or the main business logic.
- Spring Security uses filters to enforce authentication and authorization for each incoming request.
- Modern frameworks like Spring Boot and Spring Security handle much of the complexity of working with servlets and filters, allowing developers to focus on business logic.

---

- The flow begins when a client (browser, mobile app, Postman) sends a request to access a protected API or MVC path.
- Spring Security filters intercept every incoming request. There are over 20 different filters, each with specific responsibilities (e.g., checking authentication, detecting CSRF attacks).
- If proper credentials are provided, the filters populate an Authentication object with the user's credentials and an initial "isAuthenticated" status of false.
- The Authentication object is a common contract understood by all components in the Spring Security framework.
- The filters then forward the request to the Authentication Manager.
- The Authentication Manager is responsible for completing the authentication process and reporting results back to the filters.
- The Authentication Manager doesn't perform the actual authentication itself. Instead, it delegates this task to one or more Authentication Providers.
- There are built-in Authentication Providers in Spring Security, and custom ones can be created as well.
- The Authentication Manager checks with all applicable Authentication Providers to determine if authentication is successful or not.
- If there's an error at any stage, the user may receive a 401 or 403 error, depending on the exception type.

- The AuthenticationManager delegates the actual authentication process to Authentication Providers.
- Multiple Authentication Providers can exist in a project, including custom ones.
- Authentication Providers use UserDetailsManager or UserDetailsService to load user details based on the username.

- Multiple Providers: An AuthenticationManager (typically the ProviderManager implementation in Spring Security) can be configured with multiple AuthenticationProviders.
- Iterative Attempt: When authenticating, the AuthenticationManager will iterate through its list of AuthenticationProviders.
- First Success: It will stop at the first AuthenticationProvider that can successfully authenticate the request.
- Fallthrough: If a provider doesn't throw an exception but can't authenticate, the AuthenticationManager moves to the next provider.
- Failure: If no provider can authenticate, an AuthenticationException is thrown.


- Password Encoder is used by Authentication Providers to compare the provided password with the stored password.
- Password Encoder can handle plain text passwords or use hashing algorithms.
- After successful authentication, the Authentication object's isAuthenticated boolean is set to true.
- Spring Security filters store the Authentication object in a Security Context, associated with a session ID.
- For subsequent requests from the same browser session, filters use the stored Authentication object instead of re-authenticating.
- Actual authentication only occurs on the first request; subsequent requests use the Security Context.
- If authentication is successful, the client receives the API response; if it fails, a 401 or 403 error is returned.
- The Security Context allows for efficient handling of authenticated sessions without repeated authentication processes.

---

1. Managing Users

- UserDetailsService(interface)/UserDetailsManager -> core interface which loads user-specific data (loadUserByUsername). this method will extract the user details from any storage system (can be a database or an in-momory storage system). In any cases the purpose of this method is to load the user datails from a storage system.
	Now this isterface is extended by another interface which is UserDetailsManager
	this interface has many other abstract methods. The first one is createUser which is going to create a new user, based upon the object that we're trying to provide as an input. One important mention is that for all this methods we need to provide an object of type UserDetails. So basically, whenever we try to create a new user or whenever we are trying to register a new account, this is the method which is going to be used by the Spring Security framework to create the UserDetails inside the storage system.
	Here, you may have a question which is, why there is a separation of UserDetailsService and UserDetailsManager? (ISP-> SOLID)
	So if they don't have a scenario of creating the user, deleting the user or updating the user, they can simply go with the UserDetailsService. So the implementation class of this interface, it is always going to read the user details.
	So basically this UserDetailsManager, it is going to support all the CRUD operations.
	InMemoryUserDetails -> sample and JdbcUserDetailsManager
	
- UserDetails & Authentication interface
"We know inside the UserDetailsManager our UserDetailsService, we are going to represent the user details with the help of user details interface and its implementation class is User, but when you try to think about the login flow initially, Spring security filters, they're going to extract the username and password into the Authentication object. The same Authentication object we are going to send as an input to the AuthenticationManager and this AuthenticationManager passed the same Authentication object to the Authentication Provider. So these Authentication Providers, when they're trying to load the user details from the storage system, they're going to extract the username from the Authentication object and pass the username to the loadUserByUsername() method available inside the UserDetailService interface.
So this call that is happening between Authentication Provider and UserDetailsManager implementation classes, here we're going to pass the username only and the written type from these methods, they're going to be user details, but by the time the Authentication Provider is going to return the Authentication object only and Authentication Manager eventually returns the same Authentication object with the Boolean indicating whether the authentication is successful or not, the same, eventually it'll get stored inside the security context.
So the magic of converting these UserDetails object into the Authentication object, it is going to happen inside Th implementation of AuthenticationProvider"

But the point that I want to highlight here is developers, they may have question or they may get easily confused, why do we have two different contracts or two different schemas or two different interfaces representing the same end user? One interface is Authentication, the other interface is UserDetails.
- So the UserDetails is an interface and its implementation class is User. Inside these interface or inside these User class we are going to have various methods representing the password, username, authorities, and other helper methods
- Now coming to the Authentication interface, Authentication interface, it is extending one more interface which is principle. So this principle is coming from the JDK Java Library. So inside this principle we are going to have only a single method which is getName() Now inside these Authentication interface we have many abstract methods, like getPrinciple(), getAuthorities(), I'm assuming you're able to map these, getPassword() method to these getCredentials()
- somehow these 2 contracts are similar but whats important or how we can see a difference is in authentication interface we have isAuthenticated() setAuthenticated() which is going to help us to identify whether the authentication is successful or not so all the helper methods in user class you need only once the authentication is completed and is no need to carry all this fields afterwords throught the framework. So user details is the written type in all the scenarios where when we are trying to load the user information from the storage systems. Inside the implementations of UserDetailsManager and UserDetailsService. And coming to the authentication, authentication is going to be the written type in all the scenarios where we try to determine if the authentication is successful or not Inside the authentication providers and inside the authentication manager.

---

2. Password Encoder 
- Spring Security uses password encoding for security, converting plain text passwords to hashed versions before storing in the database. By default, Spring Security uses BCrypt password encoder. The PasswordEncoder interface and its implementations are crucial for managing passwords securely in Spring Security. The createDelegatingPasswordEncoder() method allows for flexibility in password encoding, supporting multiple encoders based on prefixes. Storing plain text passwords in databases is a significant security risk and not recommended for production environments. Password encoding helps maintain integrity and confidentiality of user credentials. Without password encoding, applications would be vulnerable to breaches, potentially exposing user credentials to unauthorized access. Spring Security automatically handles the encoding process during user registration and the decoding process during authentication. The text emphasizes the importance of understanding and implementing proper password management practices, especially for less experienced developers. The lecture is part of a series discussing password management and the PasswordEncoder component in Spring Security.
- 3 approaches to protect your data
1. Encoding
	- Encoding is defined as converting data from one form to another without using cryptography.
	- Encoding is reversible and not recommended for password management because it's easily decoded.
	- Common encoding standards include ASCII, BASE64, and UNICODE.
	- Encoding is typically used when systems can't handle binary data, such as in email attachments.
	-> example
2. Encryption
	- Encryption is not the right option for password management, contrary to what many developers assume.
	- Encryption transforms data to ensure confidentiality using a secret key and an algorithm.
	- There are two types of encryption: symmetric and asymmetric.
	- Symmetric encryption uses the same key for encryption and decryption, making it vulnerable if the key is compromised.
	- Symmetric encryption is suitable for data at rest, like encrypting data in AWS S3 buckets.
	- Asymmetric encryption uses a public key for encryption and a private key for decryption.
	- Asymmetric encryption is ideal for data in transit, such as secure communication between applications.
	- Encryption, while providing confidentiality, doesn't guarantee integrity if secret keys are stolen.
	- The text emphasizes that encryption is not recommended for password management due to potential key theft.
-> example
3. Hasing
	- Hashing is the recommended method for password management, unlike encoding and encryption.
	- Hashing is a one-way process that converts data into a fixed-length hash value or digest using a mathematical function.
	- Once data is hashed, it's non-reversible - the original data cannot be determined from the hash value.
	- Hashing always produces the same output for the same input, regardless of how many times it's performed.
	- The output length of a hash is fixed, regardless of the input size (e.g., SHA-256 always produces a 256-bit output).
	- Hashing is used not only for password management but also for ensuring data integrity.
	- An example of hashing for integrity verification is shown using Java JDK download, where SHA-256 hashes are provided to verify the downloaded file's integrity.
	- Hashing is very quick, even for large files.
	- The lecture mentions that there are drawbacks to basic hashing that hackers can exploit, and these will be discussed in future lectures along with ways to overcome them.
---

Drawback:
- Hashing, while irreversible, has drawbacks that need to be addressed for secure password management.
- The registration process involves hashing the password before storing it in the database.
- During login, the entered password is hashed and compared with the stored hash.
- A major drawback of hashing is that it always produces the same hash for the same input, making it vulnerable to certain attacks.
- Two main attacks exploiting this weakness are: a) Brute force attack b) Rainbow tables or Dictionary attack
- Brute force attacks involve calculating hashes for common passwords and comparing them to stolen hash values.
- Rainbow tables and Dictionary attacks use pre-computed tables of hashes for quick password cracking.
- Another drawback is that hashing functions are very fast, allowing attackers to quickly generate many hashes.
- These vulnerabilities are especially dangerous for simple or commonly used passwords.
- The instructor plans to discuss methods to overcome these drawbacks in the next lecture.

---

- Two main solutions to overcome hashing drawbacks: using salts and making hash functions intentionally slower.
- Salts:
    - Random values added to passwords before hashing
    - Unique for each user, stored alongside the hash
    - Prevents rainbow table and dictionary attacks
- Salts don't protect against all types of brute force attacks, especially when an attacker has access to the database.
- Additional measures to prevent brute force attacks:
    - Account lockouts after multiple failed attempts
    - Enforcing strong password policies
- Slow hashing algorithms:
    - Examples: Bcrypt, Scrypt, Argon2
    - Intentionally slow down the hashing process (e.g., 1-3 seconds per hash)
    - Require significant CPU time and RAM
- Benefits of slow hashing:
    - Makes password guessing extremely time-consuming and resource-intensive for attackers
    - Minimal impact on legitimate users during login or registration
- Combining salts and slow hashing algorithms significantly improves password security.
- Organizations should implement both solutions:
    - Generate and store random salts for each user
    - Use slow hashing algorithms for password hashing
- These methods make it impractical for attackers to crack passwords, even if they gain access to the database.

---

- Spring Security provides password encoder implementations that generate random salts and use slow hashing algorithms like PBKDF2, Bcrypt, Scrypt, and Argon2.
- The PasswordEncoder interface is central to Spring Security's password handling.
- Main methods of PasswordEncoder:
    - encode(): Used during registration to hash passwords
    - matches(): Used during login to compare raw and stored passwords
    - upgradeEncoding(): Optional method for additional security
- BcryptPasswordEncoder is currently the preferred implementation in Spring Security.
- The encode() method generates a random salt (default 8 bytes) and applies the hashing algorithm.
- The matches() method extracts the salt from the stored hash, rehashes the input password, and compares the results.
- upgradeEncoding() is a default method that can be overridden to apply additional hashing for extra security.
- Spring Security provides various PasswordEncoder implementations, some suitable for production and others for less critical environments.
- The lecture demonstrates how to find and understand the PasswordEncoder interface in the Spring Security codebase.

---

3. Authentication Provider
	-> TestingAuthenticationToken
AuthenticationProvider interface
- authenticate() -> you need to define all the authentication logic, Provide manager-> invokes authenticate, Authentication object will contain all the relevant data (username/password..., and the authenticate boolean set to false). So when we define our own custom AuthenticationProvider, we need to make sure we are loading the user details from a storage system based upon the authentication details. And at last, you need to return an Authentication object indicating whether the authentication is successful or not. Lets check the default AuthenticationProvider => DaoAuthenticationProvider, inside authenticate() method if we try a bit to understand the logic there, just the most important steps, we are fetching the username from the object, then we are retrieving the user details from the storage system, and at last under the additional authentication checks, we are going to perform the passwords are matching or not with the help of PasswordEncoder, and if everything is successful then we need to return the same authentication object and we need to indicate that the user is authenticated. We need to keep these steps on mind when we will implement our custom AuthenticationProvider
- supports() -> when defining a custom AuthenticationProvider we need to tell the framework what type of authentication my custom authenticationProvider is going to support. -> example DaoAuthenticationProvider if the Provider manager receives an Authentication object which is of type UsernamePAsswordAuthenticationToken then my ProviderManager is going to invoke the DaoAuthenticationProvider.
	OidcToken -> 
ProviderManager 

---
recheck: 
- Authentication Providers in Spring Security:
    - The default provider is DaoAuthenticationProvider.
    - Custom Authentication Providers can be defined for complex scenarios.
- Authentication flow:
    - Requests are intercepted by filters.
    - Filters create an Authentication object.
    - AuthenticationManager (implemented by ProviderManager) handles the authentication process.
    - ProviderManager selects the appropriate Authentication Provider based on the Authentication object type.
- Benefits of custom Authentication Providers:
    - Allow for additional checks after user details are loaded.
    - Can create custom Authentication objects for success or failure.
- Integration with Spring Security:
    - Custom Authentication Providers work within the existing Spring Security framework.
    - ProviderManager handles the flow of authentication results back to filters and end-users.
- Importance of understanding Authentication Providers:
    - Prepares developers for complex real-world scenarios.
    - Allows for more flexible and customized security implementations.

---

- AuthenticationProvider Interface:
    - Contains two main methods: authenticate() and supports()
- authenticate() method:
    - Defines the actual authentication logic
    - Receives an Authentication object from ProviderManager
    - Loads user details, performs credential matching and additional validations
    - Returns an Authentication object indicating success or failure
- supports() method:
    - Tells the framework what type of authentication the provider supports
    - Used by ProviderManager to determine which provider to use for a given Authentication object
- DaoAuthenticationProvider:
    - Default provider that supports UsernamePasswordAuthenticationToken
    - Implements both authenticate() and supports() methods
- Various Authentication Token types:
    - UsernamePasswordAuthenticationToken: for standard login credentials
    - TestingAuthenticationToken: for unit testing scenarios
    - RememberMeAuthenticationToken
    - OidcLogoutAuthenticationToken: for OAuth2 authentication
    - JaasAuthenticationToken: for JAAS authentication
    - AnonymousAuthenticationToken: for unauthenticated access to public resources
- ProviderManager's role:
    - Implements AuthenticationManager interface
    - Iterates through all available AuthenticationProviders
    - Uses the supports() method to find the appropriate provider(s) for a given Authentication object
    - Invokes the authenticate() method of the supported provider(s)
    - Continues until authentication is successful or all providers have been tried
- Custom AuthenticationProvider implementation:
    - Allows for additional authentication checks beyond basic credential matching
    - Must implement both authenticate() and supports() methods
    - Can be integrated into the existing Spring Security framework
- TestingAuthenticationProvider:
    - Example of a specialized provider for unit testing
    - Does not perform actual authentication
    - Useful for bypassing authentication in test scenarios
- Multiple provider support:
    - An application can have multiple AuthenticationProviders
    - ProviderManager checks with all supporting providers until authentication succeeds or all have been tried

---

Authorization vs Authentication 
- Authority vs Role

---

Custom Filters
- Spring Security uses multiple filters to intercept and process incoming requests to a web application.
- These filters form a chain, with each filter having specific roles and responsibilities (e.g., extracting username/password, handling CSRF, CORS, authorization).
- The number and type of filters activated depend on the security configurations in the application.
- Custom filters can be created and injected into the Spring Security filter chain to meet specific business requirements.
- Common scenarios for custom filters include input validation, tracing, auditing, logging client details, and encryption/decryption.
- The FilterChainProxy class, specifically its inner class VirtualFilterChain, is responsible for invoking each security filter in the chain.
- In a typical Spring Boot application, there may be around 20 security filters executed for each request.
- After all security filters are executed, the request is forwarded to the dispatcher servlet and then to the appropriate controller.
- addFilterBefore(), addFilterAfter(), addFilterAt().
example -> 

---

CORS stands for Cross-Origin Resource Sharing. It's a security mechanism implemented by web browsers to control access to resources (like APIs or web services) from a different domain than the one serving the web page.

Here's a brief overview of CORS:

1. Purpose: It allows servers to specify which origins (domains) are allowed to make requests to them, enhancing security by preventing unauthorized access.
2. How it works: When a web application makes a request to a different domain, the browser sends a preflight request to check if the server allows the actual request.
3. Headers: CORS uses HTTP headers to manage permissions. Key headers include:
    - Access-Control-Allow-Origin
    - Access-Control-Allow-Methods
    - Access-Control-Allow-Headers
4. Same-Origin Policy: CORS is an evolution of the Same-Origin Policy, which restricts web pages from making requests to a different domain than the one serving the web page.
5. Use cases: It's crucial for modern web applications that often need to access resources from different domains, such as third-party APIs.

CSRF stands for Cross-Site Request Forgery. It's a type of web security vulnerability where an attacker tricks a user into performing unwanted actions on a website where they're already authenticated. Here's a concise overview:

1. How it works: The attacker creates a malicious site or link that, when accessed by a victim, sends a request to a target site where the user is already logged in.
2. Exploitation: It takes advantage of the fact that browsers automatically include cookies (including authentication tokens) with requests to sites.
3. Consequences: Can lead to unauthorized actions like changing account details, making purchases, or transferring funds.
4. Prevention methods:
    - CSRF tokens: Unique, unpredictable tokens included in forms
    - SameSite cookie attribute
    - Checking the Origin and Referer headers
    - Custom request headers
5. Difference from XSS: While XSS involves injecting malicious scripts, CSRF tricks the user into performing actions they didn't intend.
6. Common targets: Often aimed at state-changing requests, not data theft (as the attacker can't see the response).

---
