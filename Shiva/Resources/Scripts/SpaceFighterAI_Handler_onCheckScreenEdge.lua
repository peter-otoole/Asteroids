--------------------------------------------------------------------------------
--  Handler.......... : onCheckScreenEdge
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SpaceFighterAI.onCheckScreenEdge (  )
--------------------------------------------------------------------------------
	
    --Get object handle and possition
    local ship = this.getObject ( )
    local x,y,z = object.getTranslation ( ship, object.kGlobalSpace )
    
    --Get variables from user Main AI
    local minX = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMinX" )
    local maxX = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMaxX" )
    local minZ = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMinZ" )
    local maxZ = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMaxZ" )
    
    --If the player's ship left the screen, we want to bring it back to the other side
	if(x<minX)then
        object.setTranslation ( ship, x+(maxX-minX), 0,z, object.kGlobalSpace )
    elseif(x>maxX)then
        object.setTranslation ( ship, x-(maxX-minX), 0,z, object.kGlobalSpace )
    end 
    if(z<minZ)then
        object.setTranslation ( ship, x, 0, z+(maxZ-minZ), object.kGlobalSpace )
    elseif(z>maxZ)then
        object.setTranslation ( ship, x, 0, z-(maxZ-minZ), object.kGlobalSpace )
    end
    
    --Check again in a fraction of a second
    this.postEvent (0.2, "onCheckScreenEdge" )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
