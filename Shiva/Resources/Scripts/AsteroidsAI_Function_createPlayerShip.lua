--------------------------------------------------------------------------------
--  Function......... : createPlayerShip
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsAI.createPlayerShip ( )
--------------------------------------------------------------------------------
	

    local s = application.getCurrentUserScene()
    
    --Load players ship to game and attach the AI
    local ship = scene.createRuntimeObject (s, "spacefighter01")
    object.addAIModel (ship, "SpaceFighterAI")
    object.setTranslation (ship, 0, 0, 0, object.kGlobalSpace)
    object.setRotation (ship, 90, 0, 0, object.kGlobalSpace)
    object.setScale (ship, 0.3,0.3,0.3 )
    this.hPlayerShip(ship)
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
