function init()
  --Power
  self.powerModifier = config.getParameter("powerModifier", 0)
  effect.addStatModifierGroup({{stat = "powerMultiplier", effectiveMultiplier = self.powerModifier}})

  --Colour
  effect.setParentDirectives("fade="..config.getParameter("color").."=0.5")
  script.setUpdateDelta(0)

  animator.setParticleEmitterOffsetRegion("embers", mcontroller.boundBox())
  animator.setParticleEmitterActive("embers", true)
  
  effect.addStatModifierGroup({
    {stat = "jumpModifier", amount = -0.80}
  })
end


function update(dt)
mcontroller.controlModifiers({
      groundMovementModifier = 0.5,
      speedModifier = 0.3,
      airJumpModifier = 0.3
    })
end

function uninit()

end
