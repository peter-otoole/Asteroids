--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidAI.onInit (  )
--------------------------------------------------------------------------------
	
    --Get object handle and the current level
    local ast = this.getObject ( )
    local nGameLevel = application.getCurrentUserAIVariable ( "AsteroidsAI" , "nCurrentGameLevel")
    --Enable collisions and set bounding box to keep the asteroid on the right plane
    local r = object.getBoundingSphereRadius ( ast )
    dynamics.createSphereBody(ast, r*0.5)
    dynamics.enableCollisions ( ast, true )
    dynamics.setMass ( ast, r*r*r )
    dynamics.setGuardBox ( ast, -1000, 0, -1000, 1000, 0, 1000 )
    dynamics.enableGuardBox ( ast, true )    
    dynamics.enableGravity(ast, false)
    dynamics.enableDynamics(ast, true)    
    
    --Set the asteroid to a random velocity based on the game level
    local vx = 5*math.random(-nGameLevel, nGameLevel)
    local vz = 5*math.random(-nGameLevel, nGameLevel)
    dynamics.setLinearVelocity(ast, vx, 0, vz, object.kGlobalSpace)
    --Set speed limit
    dynamics.setLinearSpeedLimit (ast, 10*nGameLevel)
    dynamics.setAngularSpeedLimit ( ast, 10 )
    
    --Setting angular velocity 
    local avx = math.random ( -2, 2 )
    local avy = math.random ( -2, 2 )
    local avz = math.random ( -2, 2 )
    dynamics.setAngularVelocity ( ast, avx, avy, avz, object.kGlobalSpace)
    dynamics.setLinearDamping(ast, 0)
    dynamics.setAngularDamping(ast, 0)

    --Check if the ateroid has left the screen and check if the game is over.
    this.postEvent ( math.random ( 0.02, 0.2 ), "onCheckScreenEdge" )
    this.postEvent (0.05, "onCheckForEndGame" )
	
-------------------------------------------------------------------
end
--------------------------------------------------------------------------------
