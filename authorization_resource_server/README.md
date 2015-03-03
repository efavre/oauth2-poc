# Simple OAuth usage sample

## Roles : 
- Authorization Server 
- Resource Server

## Implemented OAuth flow :
- Resource Owner Password Credentials Grant

## Usage 
- Access to http://localhost:3003/protected_resources requires Authorization: Bearer <TOKEN> http header.
- <TOKEN> is retrieved by POSTing client_id, user[login] and user[password] to http://localhost:3003/tokens (if success, will redirect to #{client.redirect_uri}/access_token=#{ERB::Util.url_encode(user.tokens.first.token)}&expires_in=900&token_type=bearer)

## Defined clients 
``
Client.create(client_id:"clientA",client_secret:"secretA123",redirect_uri:"http://localhost:3001")
Client.create(client_id:"clientB",client_secret:"secretB123",redirect_uri:"http://localhost:3002")

## Defined users
``
User.create(login:"user1",password:"password")
User.create(login:"user2",password:"password")

