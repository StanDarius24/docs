#java #springBoot #security

Spring Security provides comprehensive support for authentication. Authentication is how we verify the identity of who is trying to access a particular resource. A common way to authenticate users is by requiring the user to enter a username and password. Once authentication is performed we know the identity and can perform authorization.

Spring Security provides built-in support for authenticating users. This section is dedicated to generic authentication support that applies in both Servlet and WebFlux environments. See the sections on authentication for [[Servlet]] and WebFlux for details on what is supported for each stack.

---

## Password Storage

Spring Security’s `PasswordEncoder` interface is used to perform a one-way transformation of a password to let the password be stored securely. Given `PasswordEncoder` is a one-way transformation, it is not useful when the password transformation needs to be two-way (such as storing credentials used to authenticate to a database). Typically, `PasswordEncoder` is used for storing a password that needs to be compared to a user-provided password at the time of authentication.

---

### Password Storage History

Throughout the years, the standard mechanism for storing passwords has evolved. In the beginning, passwords were stored in plaintext. The passwords were assumed to be safe because the data store the passwords were saved in required credentials to access it. However, malicious users were able to find ways to get large “data dumps” of usernames and passwords by using attacks such as SQL Injection. As more and more user credentials became public, security experts realized that we needed to do more to protect users' passwords.

Developers were then encouraged to store passwords after running them through a one way hash, such as SHA-256. When a user tried to authenticate, the hashed password would be compared to the hash of the password that they typed. This meant that the system only needed to store the one-way hash of the password. If a breach occurred, only the one-way hashes of the passwords were exposed. Since the hashes were one-way and it was computationally difficult to guess the passwords given the hash, it would not be worth the effort to figure out each password in the system. To defeat this new system, malicious users decided to create lookup tables known as [Rainbow Tables](https://en.wikipedia.org/wiki/Rainbow_table). Rather than doing the work of guessing each password every time, they computed the password once and stored it in a lookup table.

To mitigate the effectiveness of Rainbow Tables, developers were encouraged to use salted passwords. Instead of using just the password as input to the hash function, random bytes (known as salt) would be generated for every user’s password. The salt and the user’s password would be run through the hash function to produce a unique hash. The salt would be stored alongside the user’s password in clear text. Then when a user tried to authenticate, the hashed password would be compared to the hash of the stored salt and the password that they typed. The unique salt meant that Rainbow Tables were no longer effective because the hash was different for every salt and password combination.

In modern times, we realize that cryptographic hashes (like SHA-256) are no longer secure. The reason is that with modern hardware we can perform billions of hash calculations a second. This means that we can crack each password individually with ease.

Developers are now encouraged to leverage adaptive one-way functions to store a password. Validation of passwords with adaptive one-way functions are intentionally resource-intensive (they intentionally use a lot of CPU, memory, or other resources). An adaptive one-way function allows configuring a “work factor” that can grow as hardware gets better. We recommend that the “work factor” be tuned to take about one second to verify a password on your system. This trade off is to make it difficult for attackers to crack the password, but not so costly that it puts excessive burden on your own system or irritates users. Spring Security has attempted to provide a good starting point for the “work factor”, but we encourage users to customize the “work factor” for their own system, since the performance varies drastically from system to system. Examples of adaptive one-way functions that should be used include [bcrypt](https://docs.spring.io/spring-security/reference/features/authentication/password-storage.html#authentication-password-storage-bcrypt), [PBKDF2](https://docs.spring.io/spring-security/reference/features/authentication/password-storage.html#authentication-password-storage-pbkdf2), [scrypt](https://docs.spring.io/spring-security/reference/features/authentication/password-storage.html#authentication-password-storage-scrypt), and [argon2](https://docs.spring.io/spring-security/reference/features/authentication/password-storage.html#authentication-password-storage-argon2).

Because adaptive one-way functions are intentionally resource intensive, validating a username and password for every request can significantly degrade the performance of an application. There is nothing Spring Security (or any other library) can do to speed up the validation of the password, since security is gained by making the validation resource intensive. Users are encouraged to exchange the long term credentials (that is, username and password) for a short term credential (such as a session, and OAuth Token, and so on). The short term credential can be validated quickly without any loss in security.

---

## DelegatingPasswordEncoder

Prior to Spring Security 5.0, the default `PasswordEncoder` was `NoOpPasswordEncoder`, which required plain-text passwords. Based on the [Password History] section, you might expect that the default `PasswordEncoder` would now be something like `BCryptPasswordEncoder`. However, this ignores three real world problems:

-   Many applications use old password encodings that cannot easily migrate.
    
-   The best practice for password storage will change again.
    
-   As a framework, Spring Security cannot make breaking changes frequently.
    

Instead Spring Security introduces `DelegatingPasswordEncoder`, which solves all of the problems by:

-   Ensuring that passwords are encoded by using the current password storage recommendations
    
-   Allowing for validating passwords in modern and legacy formats
    
-   Allowing for upgrading the encoding in the future
    

You can easily construct an instance of `DelegatingPasswordEncoder` by using `PasswordEncoderFactories`:

```kotlin
val passwordEncoder: PasswordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder()
```

Alternatively, you can create your own custom instance:

```kotlin
val idForEncode = "bcrypt"
val encoders: MutableMap<String, PasswordEncoder> = mutableMapOf()
encoders[idForEncode] = BCryptPasswordEncoder()
encoders["noop"] = NoOpPasswordEncoder.getInstance()
encoders["pbkdf2"] = Pbkdf2PasswordEncoder.defaultsForSpringSecurity_v5_5()
encoders["pbkdf2@SpringSecurity_v5_8"] = Pbkdf2PasswordEncoder.defaultsForSpringSecurity_v5_8()
encoders["scrypt"] = SCryptPasswordEncoder.defaultsForSpringSecurity_v4_1()
encoders["scrypt@SpringSecurity_v5_8"] = SCryptPasswordEncoder.defaultsForSpringSecurity_v5_8()
encoders["argon2"] = Argon2PasswordEncoder.defaultsForSpringSecurity_v5_2()
encoders["argon2@SpringSecurity_v5_8"] = Argon2PasswordEncoder.defaultsForSpringSecurity_v5_8()
encoders["sha256"] = StandardPasswordEncoder()

val passwordEncoder: PasswordEncoder = DelegatingPasswordEncoder(idForEncode, encoders)
```
