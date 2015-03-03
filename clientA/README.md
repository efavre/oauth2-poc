# Simple OAuth usage sample

## Roles : 
- Client

## Implemented OAuth flow :
- Resource Owner Password Credentials Grant

## Usage 
- Access to http://localhost:3001/protected_resources requires previous authenticatioj
- Authenticate on http://localhost:3001/sessions/new
- Authentication requests authorization server. If success, access token is stored in session and http://localhost:3001/protected_resources displays resource server resources

## Client details
``
Client.create(client_id:"clientA",client_secret:"secretA123",redirect_uri:"http://localhost:3001")

## Available users
``
User.create(login:"user1",password:"password")
User.create(login:"user2",password:"password")
