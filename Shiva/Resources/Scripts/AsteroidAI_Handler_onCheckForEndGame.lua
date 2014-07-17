--------------------------------------------------------------------------------
--  Handler.......... : onCheckForEndGame
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidAI.onCheckForEndGame (  )
--------------------------------------------------------------------------------
	
    --Get value from Main AI
	local isEndOfGame = application.getCurrentUserAIVariable ( "AsteroidsAI", "nEndGameState" )
    
    --If it is the end of the game, all asteroids should delete themselfs
    if(isEndOfGame)then
        scene.destroyRuntimeObject (application.getCurrentUserScene ( ) , this.getObject ( ) )
    end
    
    --Check again in one second
    this.postEvent (1, "onCheckForEndGame" )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
