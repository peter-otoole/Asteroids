--------------------------------------------------------------------------------
--  Handler.......... : onCheckScreenEdge
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidAI.onCheckScreenEdge (  )
--------------------------------------------------------------------------------
	
    --Get the objects handle and get its translation
	local ast = this.getObject ( )
    local x,y,z = object.getTranslation ( ast, object.kGlobalSpace )
    --Get the edge of the screen varibles
    local minX = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMinX" )
    local maxX = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMaxX" )
    local minZ = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMinZ" )
    local maxZ = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMaxZ" )
    --If the object leaves the screen, bring it to the other side of the screen
	if(x<minX)then
        object.setTranslation ( ast, x+(maxX-minX), 0,z, object.kGlobalSpace )
    elseif(x>maxX)then
        object.setTranslation ( ast, x-(maxX-minX), 0,z, object.kGlobalSpace )
    end
    if(z<minZ)then
        object.setTranslation ( ast, x, 0, z+(maxZ-minZ), object.kGlobalSpace )
    elseif(z>maxZ)then
        object.setTranslation ( ast, x, 0, z-(maxZ-minZ), object.kGlobalSpace )
    end
    --Check again in a fraction of a second
    this.postEvent (0.2, "onCheckScreenEdge" )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
