--------------------------------------------------------------------------------
--  Handler.......... : onEnableSpawnProtection
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SpaceFighterAI.onEnableSpawnProtection (  )
--------------------------------------------------------------------------------
	
    --Start the spawn protection and start particle emmiter.
    this.vunerable ( false )
    sfx.startParticleEmitterAt ( this.getObject ( ), 2 )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------