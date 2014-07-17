--------------------------------------------------------------------------------
--  Handler.......... : onEnterFrame
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SpaceFighterAI.onEnterFrame (  )
--------------------------------------------------------------------------------
	
    --Get Ship Handler
    local ship = this.getObject ( )
    
    --check if the ship is destroyed
    if(not this.nShipDieing ( ))then
        --If the forward thrust is off and its greater than zero, decrement the speed 
        if( (this.thrustOff()) and (this.forwardThrust()>0) )then
            this.forwardThrust ( this.forwardThrust ( ) - 0.003)
        end
        
        if( this.forwardThrust()>0)then
            --update position of ship
            object.translate ( ship, 0, .3, 0, object.kLocalSpace )
        end
        
        --update rotational position of the ship
        object.rotate ( ship, 0, this.RotationPosition ( )*1.5, 0, object.kGlobalSpace )
    end
    
    --local chance = math.random ( 9, 20 )
    
    if(this.nFiring ( ))then
    
    --create bullet
	local s = application.getCurrentUserScene ( )
    local b = scene.createRuntimeObject ( s, "Bullet" )

    
    --Add the AI, set up the bullet
    object.addAIModel ( b, "AsteroidsBulletAI" )
    object.sendEvent ( b, "AsteroidsBulletAI", "onSetup", this.getObject ( ))
    
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
