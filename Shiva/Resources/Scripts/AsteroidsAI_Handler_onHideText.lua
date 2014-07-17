--------------------------------------------------------------------------------
--  Handler.......... : onHideText
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsAI.onHideText (  )
--------------------------------------------------------------------------------

    if( this.nPlayingState ( ))then
        --Hide the centre text
        local hUser = application.getCurrentUser ( )
        local hNextLevel = hud.getComponent ( hUser,  "PayingHud.nextLevel" )
        hud.setLabelText ( hNextLevel, "" )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
