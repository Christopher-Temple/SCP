function activate(fireMode, shiftHeld)
   if fireMode == "primary" then
		activeItem.interact("ScriptPane", "/interface/windowconfig/questList.config")
		animator.playSound("activate")
    end
    
end


function update()
	if mcontroller.crouching() then
		activeItem.setArmAngle(-0.15)
	else
		activeItem.setArmAngle(-0.5)
	end
end
