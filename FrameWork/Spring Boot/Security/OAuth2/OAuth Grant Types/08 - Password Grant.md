#security 

[@Deprecated]

The Password grant type is a legacy way to exchange a user's credentials for an access token. Because the client application has to collect the user's password and send it to the authorization server, it is not recommended that this grant be used at all anymore.

This flow provides no mechanism for things like multifactor authentication or delegated accounts, so is quite limiting in practice.

The latest [OAuth 2.0 Security Best Current Practice](https://oauth.net/2/oauth-best-practice/) disallows the password grant entirely, and the grant is not defined in [OAuth 2.1](https://oauth.net/2.1/).