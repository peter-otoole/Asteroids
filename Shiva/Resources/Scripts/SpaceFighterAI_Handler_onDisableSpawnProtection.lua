--------------------------------------------------------------------------------
--  Handler.......... : onDisableSpawnProtection
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SpaceFighterAI.onDisableSpawnProtection (  )
--------------------------------------------------------------------------------
	
    --Disable spawn protection and stop particle effects
	this.vunerable ( true )
    sfx.stopParticleEmitterAt( this.getObject ( ), 2 )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
