--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SpaceFighterAI.onInit (  )
--------------------------------------------------------------------------------
	
    --Get ship handle
    local ship = this.getObject ( )
    
    --stop all the particle emitters
    sfx.stopParticleEmitterAt( ship, 0 )
    sfx.stopParticleEmitterAt( ship, 1 )
    sfx.stopParticleEmitterAt( ship, 2 )
    --Start the shield particle emitters
    sfx.startParticleEmitterAt( ship, 2 )
    --Enable dynamics and ensure the ship stays in the right planes
    dynamics.createSphereBody(ship, 1)
    dynamics.enableGravity(ship, false)
    dynamics.enableDynamics(ship, true)
    dynamics.enableGravity(ship, false)
    dynamics.setGuardBox ( ship, -1000, 0, -1000, 1000, 0, 1000 )
    dynamics.enableGuardBox ( ship, true ) 
    
    --Check if the player's ship has left the screen
    this.postEvent ( math.random ( 0.02, 0.2 ), "onCheckScreenEdge" )
    --Send a delayed event to stop the spawn protection
    this.postEvent ( 4, "onDisableSpawnProtection")
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
