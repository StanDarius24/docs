#security #springBoot 

---

OAuth 2.0 is the industry-standard protocol for authorization. OAuth 2.0 focuses on client developer simplicity while providing specific authorization flows for web applications, desktop applications, mobile phones, and living room devices.

---
General OAuth 2.0 outline:
![[Screenshot 2023-02-05 at 17.03.48.png]]
1.  The client requests authorization from the resource owner.
2.  The client receives an authorization grant.
3.  The client requests an access token through identity verification with the help of the authorization server and authorization grant provision.
4.  The authorization server verifies the client by checking the authorization grant and, if it’s valid, issues an access token and refresh token.
5.  The client requests a secure resource from the provider and authenticates by presenting the access token.
6.  The provider checks the access token and, if valid, serves the request.


---

Tables of content:

---

a)
1. OAuth 2.0 Framework: 
 - [[01 - Authorization Framework]]
 - [[02 - Access Tokens]] 
 - [[03 - Refresh Tokens]]
 - [[04 - Scopes]]
2. OAuth Grant Types:
 - [[01 - Grant Types]]
 - [[02 - Authorization Code Grant]]
 - [[03 - Proof Key for Code Exchange]]
 - [[04 - Client Credentials Grant]]
 - [[05 - Device Authorization Grant]]
 - [[06 - Refresh Token]]
3. [[OAuth 2.0 Client Types]]
4. [[OAuth 2.0 Client Authentication]]
5. [[OAuth 2.0 Bearer Token Usage]]
6. [[OAuth 2.0 Threat Model and Security Considerations]]
7. [[OAuth 2.0 Security Best Current Practice]]
8. [[ID Tokens vs Access Tokens]]

---

b)

