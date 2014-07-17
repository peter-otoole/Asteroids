--------------------------------------------------------------------------------
--  Handler.......... : onSetThrust
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SpaceFighterAI.onSetThrust ( thrustValue )
--------------------------------------------------------------------------------

    local ship = this.getObject ( )
    
    --Setting the ships thrust, starting and stopping the particle emitter 
    
    if(not this.nShipDieing ( ))then
        --change ship velocity
        if(thrustValue)then
            this.forwardThrust(0.2)
            this.thrustOff ( false )
            sfx.startParticleEmitterAt (ship, 0 )
        else
            this.thrustOff ( true )
            sfx.stopParticleEmitterAt ( ship, 0 )
        end
	end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
