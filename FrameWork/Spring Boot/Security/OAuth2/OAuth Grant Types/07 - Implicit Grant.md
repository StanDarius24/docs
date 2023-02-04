#security 

[@Deprecated]

The Implicit flow was a simplified OAuth flow previously recommended for native apps and JavaScript apps where the access token was returned immediately without an extra authorization code exchange step.

It is not recommended to use the implicit flow (and some servers prohibit this flow entirely) due to the inherent risks of returning access tokens in an HTTP redirect without any confirmation that it has been received by the client.

Public clients such as native apps and JavaScript apps should now use the [authorization code](https://oauth.net/2/grant-types/authorization-code/) flow with the [PKCE](https://oauth.net/2/pkce/) extension instead.

The [OAuth 2.0 Security Best Current Practice](https://tools.ietf.org/html/draft-ietf-oauth-security-topics) document recommends against using the Implicit flow entirely, and [OAuth 2.0 for Browser-Based Apps](https://tools.ietf.org/html/draft-ietf-oauth-browser-based-apps) describes the technique of using the authorization code flow with PKCE instead.

https://www.youtube.com/watch?v=CHzERullHe8&embeds_euri=https%3A%2F%2Foauth.net%2F&source_ve_path=MjM4NTE&feature=emb_title
