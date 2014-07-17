--------------------------------------------------------------------------------
--  Handler.......... : onKeyboardKeyUp
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsAI.onKeyboardKeyUp ( kKeyCode )
--------------------------------------------------------------------------------
	
    --If the ship handle is not null, call apporiate methods
    if(this.hPlayerShip ( ) ~= nil)then
        if(kKeyCode==input.kKeyLeft)then
            object.sendEvent ( this.hPlayerShip ( ), "SpaceFighterAI", "onSetRotation", 0 )
        elseif(kKeyCode==input.kKeyRight)then
            object.sendEvent ( this.hPlayerShip ( ), "SpaceFighterAI", "onSetRotation", 0 )
        elseif(kKeyCode==input.kKeyUp)then
            object.sendEvent ( this.hPlayerShip ( ), "SpaceFighterAI", "onSetThrust", false )
        elseif(kKeyCode==input.kKeySpace)then
            object.sendEvent ( this.hPlayerShip ( ), "SpaceFighterAI", "onShootBullet", false)
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
