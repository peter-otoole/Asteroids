--------------------------------------------------------------------------------
--  State............ : GameOver
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsAI.GameOver_onLeave ( )
--------------------------------------------------------------------------------
	

    local hUser = application.getCurrentUser ( )
	hud.destroyTemplateInstance(hUser, "GameOverHud")
    
    this.nEndGameState ( true )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
