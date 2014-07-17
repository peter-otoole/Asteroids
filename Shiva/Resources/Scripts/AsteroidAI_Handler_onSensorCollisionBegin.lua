--------------------------------------------------------------------------------
--  Handler.......... : onSensorCollisionBegin
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidAI.onSensorCollisionBegin ( nSensorID, hTargetObject, nTargetSensorID )
--------------------------------------------------------------------------------
	
    --Get object handle, current user, possition, linear velocity, user scene, calculate size and get varible from User Main AI
    local o = this.getObject ( )
    local hUser = application.getCurrentUser ( )
    local x, y, z = object.getTranslation ( o, object.kGlobalSpace )
    local vx,vy,vz = dynamics.getLinearVelocity ( o, object.kGlobalSpace )
    local hScene = application.getCurrentUserScene()
    local sx, sy, sz = object.getScale ( o )
    local size = (sx+sy+sz )/3
    local numberAsteroids = application.getCurrentUserAIVariable ( "AsteroidsAI", "numberOfAsteroids")
    
    
    --If the object that comes in contact with the asteriod is a bullet, do the following.
    if( nTargetSensorID == 10 ) then
        
        log.message ( numberAsteroids )
        
        --Destroy the bullet
        object.sendEvent ( hTargetObject, "AsteroidsBulletAI", "onDelete" )
        
        --Increase the score
        local score = application.getCurrentUserAIVariable ( "AsteroidsAI", "nUserScore")
        score = (score + 50)
        application.setCurrentUserAIVariable ("AsteroidsAI", "nUserScore", score )
        
        --update the current hud
        local hUser = application.getCurrentUser ( )
        local hScore = hud.getComponent ( hUser, "PayingHud.UserScore" )
        hud.setLabelText ( hScore, string.format ( "Score: %d", score ))
        
        --If the object is big enough split it into pieces, otherwise destory the entire thing.
        if(size>0.07)then
            local numPieces
            
            if(size>1.1)then
                numPieces = 3
            else
                numPieces = 2
            end
            
            --Calculate Piece size
            local pieceSize = size/numPieces
            
            --Create that number of pieces
            for i=1, numPieces do
                
                --Update the number of asteroids
                numberAsteroids = (numberAsteroids + 1)
                --Create the asteroid
                local a = scene.createRuntimeObject ( hScene, "asteroid1" )
                local localVelX = math.random(-1, 1)
                local localVelZ = math.random(-1, 1)
                --set the possition, scale, AI model 
                object.setTranslation ( a, x+localVelX, 0, z+localVelZ, object.kGlobalSpace )
                object.setScale (a, math.random(pieceSize*0.8, pieceSize*1.2), math.random(pieceSize*0.8, pieceSize*1.2), 
                math.random(pieceSize*0.8, pieceSize*1.2) )
                
                object.addAIModel (a, "AsteroidAI")
                object.postEvent (a, 0.05, "AsteroidAI", "onSetVelocity", vx+localVelX, vz+localVelZ)
            end
            --destroy the current asteroid
            scene.destroyRuntimeObject (hScene, o )
        else    
            --tell the asteroid to delete itself in half a second
            this.postEvent (.5, "onDeleteSelf" )
            --set it's speed and size to more or less zero, start particale emmiter.
            --the particles start straight away, after half a second, it is deleted and the emitter stops
            dynamics.setLinearVelocity(o, 0, 0, 0, object.kGlobalSpace)
            dynamics.setAngularVelocity ( o, 0, 0, 0, object.kGlobalSpace)
            object.setScale ( o, 0.00001, 0.00001, 0.00001)
            sfx.startParticleEmitterAt (o, 0 )
        end
        
        
        --Decrease the number of asteroids and send the update to the user Main AI
        numberAsteroids = (numberAsteroids - 1)
        application.setCurrentUserAIVariable ( "AsteroidsAI", "numberOfAsteroids", numberAsteroids)
        
        --if the number of asteroids is equal to zero, we want to start the next level
        if(numberAsteroids == 0)then
            local var = application.getCurrentUser ( )
            user.postEvent ( var , 2, "AsteroidsAI", "onStartNextLevel" )
        end
    end
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
