--------------------------------------------------------------------------------
--  State............ : PLAYING
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsAI.PLAYING_onLeave ( )
--------------------------------------------------------------------------------
	
    this.nPlayingState ( false )
	local hUser = application.getCurrentUser ( )
	hud.destroyTemplateInstance(hUser, "PayingHud")
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
