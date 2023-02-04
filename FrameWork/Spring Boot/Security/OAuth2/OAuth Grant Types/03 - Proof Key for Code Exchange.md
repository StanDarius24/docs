#security 

PKCE ([RFC 7636](http://tools.ietf.org/html/rfc7636)) is an extension to the [[02 - Authorization Code Grant]] to prevent CSRF and authorization code injection attacks.

PKCE is _not_ a replacement for a client secret, and PKCE is recommended even if a client is using a client secret.

Note: Because PKCE is not a replacement for client authentication, it does _not_ allow treating a public client as a confidential client.

PKCE was originally designed to protect the authorization code flow in mobile apps, but its ability to prevent authorization code injection makes it useful for every type of OAuth client, even web apps that use a client secret.

### Videos

-   [What's New With OAuth and OIDC? (8:22)](https://www.youtube.com/watch?v=g_aVPdwBTfw&t=500s)
-   [What's the Difference between Confidential and Public Clients?](https://www.youtube.com/watch?v=5cQNwifDq1U)
-   [What's Going On with the Implicit Flow?](https://www.youtube.com/watch?v=CHzERullHe8)