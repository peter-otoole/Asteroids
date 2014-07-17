--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsAI.onInit (  )
--------------------------------------------------------------------------------

    --Set current user scene
    application.setCurrentUserScene("AsteroidsScene1", "")
	local s = application.getCurrentUserScene()
    local hcam = application.getCurrentUserActiveCamera( )
    
    --Set cameras position
    object.setTranslation (hcam, 0, 100, 0, object.kGlobalSpace)
    object.lookAtWithUp (hcam, 0, 0, 0, 0, 0, 1, object.kGlobalSpace, 1)
    local notUsed, notUsed2,targetPlane = camera.projectPoint(hcam, 0,0,0)
    local x1, y1, z1 =camera.unprojectPoint(hcam, -1, -1, targetPlane )
    local x2, y2, z2 =camera.unprojectPoint(hcam, 1, 1, targetPlane )
    
    if(x1>x2)then
        local temp=x1
        x1=x2
        x2 = temp
    end
    if(z1>z2) then
        local temp = z1
        z1 = z2
        z2 = temp
    end
    
     --Multiply all values by 1.08 to get a small offScreen value
    this.nMinX(x1*1.08)
    this.nMaxX(x2*1.08)
    this.nMinZ(z1*1.08)
    this.nMaxZ(z2*1.08)
    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
