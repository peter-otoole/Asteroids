--------------------------------------------------------------------------------
--  State............ : GameOver
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsAI.GameOver_onEnter ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    hud.newTemplateInstance(hUser, "GameOverHud", "GameOverHud")

    local totalScore = this.nUserScore ( )
    local hUser = application.getCurrentUser ( )
    
    local hTotalScore = hud.getComponent ( hUser, "GameOverHud.endScoreLabel" )
    hud.setLabelText ( hTotalScore, string.format ( "Your Score: %d", totalScore ))
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
