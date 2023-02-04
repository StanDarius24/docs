#security 

An OAuth Refresh Token is a string that the OAuth client can use to get a new access token without the user's interaction.

A refresh token must not allow the client to gain any access beyond the scope of the original grant. The refresh token exists to enable authorization servers to use short lifetimes for access tokens without needing to involve the user when the token expires.