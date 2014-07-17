--------------------------------------------------------------------------------
--  Function......... : StartNextLevel
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsAI.StartNextLevel ( )
--------------------------------------------------------------------------------

    log.message("Next level started")
    --Incement level
    this.nCurrentGameLevel ( this.nCurrentGameLevel ( ) + 1 )
    
    --Get variables
    local s = application.getCurrentUserScene()
    local hUser = application.getCurrentUser ( )
    local levelnum = this.nCurrentGameLevel ( )
    
    --Update Level number on hud
    local hLevelNum = hud.getComponent ( hUser, "PayingHud.LevelLabel" )
    hud.setLabelText ( hLevelNum, string.format ( "Level Number: %d", levelnum ))
    
    --Update Lives on hud
    local initLives = this.nUserLives ( )
    local hLives = hud.getComponent ( hUser, "PayingHud.LivesLabel" )
    hud.setLabelText ( hLives, string.format ( "Lives: %d", initLives ) )
    
    --Update Score on hud
    local initScore = this.nUserScore ( )
    local hScore = hud.getComponent ( hUser,  "PayingHud.UserScore" )
    hud.setLabelText ( hScore, string.format ( "Score: %d", initScore) )
   
    --display center image, if the game is begining, display 'Begin' if else 'Next Level!'
    local hNextLevel = hud.getComponent ( hUser,  "PayingHud.nextLevel" )
    
    if(this.nCurrentGameLevel ( ) == 1 )then

        hud.setLabelText ( hNextLevel, "Begin!" )
    else
        hud.setLabelText ( hNextLevel, "Next Level!" )
    end
    
    --Hide centre text after one and a half seconds
    user.postEvent ( hUser, 1.5, "AsteroidsAI", "onHideText" )
    
    --Ensure the handle to the ship is not null, if it's not enable spawn protection, and then disable it after 1.5 seconds
    if(this.hPlayerShip ( ) ~= nil)then
        object.sendEvent ( this.hPlayerShip ( ), "SpaceFighterAI", "onEnableSpawnProtection" )
    end
    
    if(this.hPlayerShip ( ) ~= nil)then
        object.postEvent ( this.hPlayerShip ( ), 3, "SpaceFighterAI", "onDisableSpawnProtection" )
    end
    
    --Create a random number of asteroids, loads them and attach the asteroid AI
    local num = 1.5*(this.nCurrentGameLevel())
    for i = 0, num do
        
        this.numberOfAsteroids ( this.numberOfAsteroids ( ) + 1)
        
        local ast = scene.createRuntimeObject(s, "asteroid1")
        local x,z
        
        if(math.random(0,1)< 0.5)then
            x = math.random(this.nMinX() , this.nMinX()/2)
        else
            x = math.random(this.nMaxX() , this.nMaxX()/2)
        end
        
        if(math.random(0,1)< 0.5)then
            z = math.random(this.nMinZ() , this.nMinZ()/2)
        else
            z = math.random(this.nMaxZ() , this.nMaxZ()/2)
        end
        
        object.setTranslation(ast, x, 0, z, object.kGlobalSpace)
        object.setScale(ast, math.random(0.08, 0.12), math.random(0.08, 0.12), math.random(0.08, 0.12))
        object.addAIModel(ast, "AsteroidAI")
    end


    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
