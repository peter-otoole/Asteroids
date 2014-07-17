--------------------------------------------------------------------------------
--  Handler.......... : onSetup
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsBulletAI.onSetup ( hShip )
--------------------------------------------------------------------------------
	
    --Get the object handle
	local b = this.getObject ( )
    
    --Match the translation and rotation of the ship
    object.matchTranslation ( b, hShip, object.kGlobalSpace )
    object.matchRotation ( b, hShip, object.kGlobalSpace )
    --Set the size of the bullet
    object.setScale ( b, 0.3,0.3,0.3 )
    
    --Create a bounding shpere to ensure the bullet doesn't move out of plane
    local r = object.getBoundingSphereRadius ( b )
    dynamics.createSphereBody(b, r*0.5)
    dynamics.setGuardBox(b, -1000, 0, -1000, 1000, 0, 1000)
    dynamics.enableGuardBox ( b, true )
    dynamics.enableGravity ( b, false )
    dynamics.enableDynamics ( b, true )
    
    --Set the foward velocity of the bullet
    dynamics.setLinearVelocity ( b, 0, 40, 0, object.kLocalSpace )
    --Stop linear and angular damping
    dynamics.setAngularDamping ( b,0 )
    dynamics.setLinearDamping ( b,0 )
    
    --Start the bullet checking if it left the screnen or not
    this.postEvent ( 0.2, "onCheckScreenEdge" )
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
