--------------------------------------------------------------------------------
--  Handler.......... : onKeyboardKeyDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function AsteroidsAI.onKeyboardKeyDown ( kKeyCode )
--------------------------------------------------------------------------------
	
    --ensure the handle is not null, when keys are pressed, call approperate methods inside ship AI
    if(this.hPlayerShip ( ) ~= nil)then
        if(kKeyCode==input.kKeyLeft)then
            object.sendEvent ( this.hPlayerShip ( ), "SpaceFighterAI", "onSetRotation", 3 )
        elseif(kKeyCode==input.kKeyRight)then
            object.sendEvent ( this.hPlayerShip ( ), "SpaceFighterAI", "onSetRotation", -3 )
        elseif(kKeyCode==input.kKeyUp)then
            object.sendEvent ( this.hPlayerShip ( ), "SpaceFighterAI", "onSetThrust", true )
        elseif(kKeyCode==input.kKeySpace)then
            object.sendEvent ( this.hPlayerShip ( ), "SpaceFighterAI", "onShootBullet", true)
        end
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
