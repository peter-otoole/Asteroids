--------------------------------------------------------------------------------
--  Handler.......... : onSensorCollisionBegin
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SpaceFighterAI.onSensorCollisionBegin ( nSensorID, hTargetObject, nTargetSensorID )
--------------------------------------------------------------------------------
    
    local hShip = this.getObject ( )
    
    if(this.vunerable ( ) and ( not this.nShipDieing ( )))then
        
        if(nTargetSensorID==0)then
            this.nShipDieing ( true )
        
            local lives = application.getCurrentUserAIVariable ( "AsteroidsAI", "nUserLives")
            lives = (lives - 1)
            
            local hUser = application.getCurrentUser ( )
            local hLives = hud.getComponent ( hUser, "PayingHud.LivesLabel" )
            hud.setLabelText ( hLives, string.format ( "Lives: %d", lives ))
            
            if(lives>0)then
                
                sfx.startParticleEmitterAt (hShip,  1 )
                object.setScale ( hShip, 0.00001, 0.00001, 0.00001)
                this.postEvent ( .7, "onDeleteSelf" )
                
                user.postEvent ( application.getCurrentUser ( ), 4, "AsteroidsAI", "onRespawnPlayerShip" )
                application.setCurrentUserAIVariable ( "AsteroidsAI", "nUserLives", lives )
                
            else
                
                sfx.startParticleEmitterAt (hShip,  1 )
                object.setScale ( hShip, 0.00001, 0.00001, 0.00001)
                this.postEvent ( .7, "onDeleteSelf" )
                
                user.postEvent ( application.getCurrentUser ( ), 3, "AsteroidsAI", "onGoToGameOver" )
            end
        end
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
