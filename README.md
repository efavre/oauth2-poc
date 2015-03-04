# Simple OAuth usage sample

## Roles : 
- Authorization Server (http://localhost:3003)
- Resource Server (http://localhost:3003)
- Clients (http://localhost:3001)

## Implemented OAuth flow :
- Resource Owner Password Credentials Grant

## Start server
```
vagrant up
````

## Usage 
- Access to either client http://localhost:3001/protected_resources
- If not already authenticated, you are redirected to http://localhost:3001/sessions/new 
- If authentication success ("user1", "password" or "user2", "password"), redirected to http://localhost:3001/protected_resources
- http://localhost:3001/protected_resources displays resource server resources ("Resource1" and "Resource2")

