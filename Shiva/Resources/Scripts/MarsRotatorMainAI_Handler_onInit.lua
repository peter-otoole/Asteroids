--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MarsRotatorMainAI.onInit (  )
--------------------------------------------------------------------------------
	
	application.setCurrentUserScene("MarsRotatorScene", "")
	
    local s = application.getCurrentUserScene()
    local m = scene.createRuntimeObject (s, "mars1")
    
    local hcam = application.getCurrentUserActiveCamera( )
    
    object.setTranslation (hcam, 0, 20, 30, object.kGlobalSpace)
    object.lookAt (hcam, 0, 0, 0, object.kGlobalSpace, 1)
    object.setScale ( m, 0.1,0.1,0.1 )
    
    object.setRotation ( m, -90, 0, 0, object.kGlobalSpace )
    dynamics.createSphereBody(m,1)
    dynamics.setAngularVelocity(m,0,4,0,object.kGlobalSpace)
    dynamics.enableDynamics(m, true)
    dynamics.enableGravity(m, false)
    
    local d = scene.createRuntimeObject (s, "deimos2")
    object.setTranslation(d, -20, -1, 0, object.kGlobalSpace)
    --object.setScale ( d, 0.01,0.01,0.01 )
    scene.setRuntimeObjectTag(s, d, "deimos")
    
    local p = scene.createRuntimeObject (s, "phobos2") 
    object.setTranslation (p, -8, 1, 0, object.kGlobalSpace)
    --object.setScale ( p, 0.006,0.006,0.006)
    scene.setRuntimeObjectTag ( s, p, "phobos" )
       
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
