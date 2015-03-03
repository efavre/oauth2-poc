Client.create(client_id:"clientA", client_secret:"passwordA123", redirect_uri:"http://localhost:3001/callback")
Client.create(client_id:"clientB", client_secret:"passwordB123", redirect_uri:"http://localhost:3002/callback")

User.create(login:"user1",password:"password")
User.create(login:"user2",password:"password")

ProtectedResource.create(name:"Resource1")
ProtectedResource.create(name:"Resource2")
