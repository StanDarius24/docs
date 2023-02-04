#security 

Confidential clients authenticate when making requests to the OAuth authorization server.

The core OAuth 2.0 specification defines the "client password" client authentication type, which defines the `client_secret` parameter as well as the method of including the client password in the HTTP `Authorization` header.

There are additional forms of client authentication defined in extensions.

-   [Mutual TLS](https://oauth.net/2/mtls/) (RFC 8705)

-   [Private Key JWT](https://oauth.net/private-key-jwt/) (RFC 7521, RFC 7521, OpenID)
