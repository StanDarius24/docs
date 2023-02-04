#security 

An OAuth Access Token is a string that the OAuth client uses to make requests to the resource server.

Access tokens do not have to be in any particular format, and in practice, various OAuth servers have chosen many different formats for their access tokens.

Access tokens may be either "[bearer tokens](https://oauth.net/2/bearer-tokens/)" or "sender-constrained" tokens. Sender-constrained tokens require the OAuth client to prove possession of a private key in some way in order to use the access token, such that the access token by itself would not be usable.

There are a number of properties of access tokens that are fundamental to the security model of OAuth:

-   Access tokens must not be read or interpreted by the OAuth client. The OAuth client is not the intended audience of the token.
-   Access tokens do not convey user identity or any other information about the user to the OAuth client.
-   Access tokens should _only_ be used to make requests to the resource server. Additionally, [ID tokens](https://oauth.net/id-tokens-vs-access-tokens/) must _not_ be used to make requests to the resource server.