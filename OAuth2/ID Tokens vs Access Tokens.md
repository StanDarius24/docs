#security 

What's the difference between an ID Token and an Access Token? Access tokens are defined in OAuth, ID tokens are defined in OpenID Connect.

[Access tokens](https://oauth.net/2/access-tokens/) are what the OAuth client uses to make requests to an API. The access token is meant to be read and validated by the API. An ID token contains information about what happened when a user authenticated, and is intended to be read by the OAuth client. The ID token may also contain information about the user such as their name or email address, although that is not a requirement of an ID token.

Here are some further differences between ID tokens and access tokens:

-   ID tokens are meant to be read by the OAuth client. Access tokens are meant to be read by the resource server.
-   ID tokens are [JWTs](https://oauth.net/2/jwt/). Access tokens [can be JWTs](https://oauth.net/2/jwt-access-tokens/) but may also be a random string.
-   ID tokens should _never_ be sent to an API. Access tokens should _never_ be read by the client.

Related:

-   [Access Tokens](https://oauth.net/2/access-tokens/)
-   [Refresh Tokens](https://oauth.net/2/refresh-tokens/)