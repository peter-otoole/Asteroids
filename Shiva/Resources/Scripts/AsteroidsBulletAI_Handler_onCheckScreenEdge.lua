--------------------------------------------------------------------------------
--  Handler.......... : onCheckScreenEdge
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsBulletAI.onCheckScreenEdge (  )
--------------------------------------------------------------------------------
	--Get object handle and objects position
	local b = this.getObject ( )
    local x,y,z = object.getTranslation ( b, object.kGlobalSpace )
    
    --Get eadge of screen size from main AI 
    local minX = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMinX" )
    local maxX = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMaxX" )
    local minZ = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMinZ" )
    local maxZ = application.getCurrentUserAIVariable ( "AsteroidsAI", "nMaxZ" )
    
    --If the bullet left the eadge of the screen, distroy it, if not check again a fraction of a second later.
	if(x<minX or x>maxX or z<minZ or z>maxZ )then
        scene.destroyRuntimeObject ( application.getCurrentUserScene ( ), b )
    else
        this.postEvent ( 0.2, "onCheckScreenEdge" )
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
