--------------------------------------------------------------------------------
--  Handler.......... : onKeyboardKeyDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MarsRotatorMainAI.onKeyboardKeyDown ( kKeyCode )
--------------------------------------------------------------------------------
	
	if(kKeyCode==input.kKeyUp)then
    this.nCamYVolocity (0.1)
    
    elseif(kKeyCode==input.kKeyDown)then
    this.nCamYVolocity (-0.1)
    
    elseif(kKeyCode==input.kKeyLeft)then
    this.nCamXVolocity (-0.1)
    
    elseif(kKeyCode==input.kKeyRight)then
    this.nCamXVolocity (0.1)
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
