require "/scripts/vec2.lua"

function init()
  storage.timer =  0
  
  storage.active = active
    
  self.fireTime = config.getParameter("fireTime", 1)
  self.fireTimeVariance = config.getParameter("fireTimeVariance", 0)
  self.projectile = config.getParameter("projectile")
  self.projectileConfig = config.getParameter("projectileConfig", {})
  self.projectilePosition = config.getParameter("projectilePosition", {0, 0})
  self.projectileDirection = config.getParameter("projectileDirection", {1, 0})
  self.inaccuracy = config.getParameter("inaccuracy", 0)

  self.projectilePosition = object.toAbsolutePosition(self.projectilePosition)
end

function update(dt)
  if storage.active then
    storage.timer = storage.timer - dt
    if storage.timer <= 0 then
      storage.timer = self.fireTime + (self.fireTimeVariance * math.random() - self.fireTimeVariance / 2)
      shoot()
    end
  end
end



function shoot()
  
  local projectileDirection = vec2.rotate(self.projectileDirection, sb.nrand(self.inaccuracy, 0))
  world.spawnProjectile(self.projectile, self.projectilePosition, entity.id(), projectileDirection, false, self.projectileConfig)
end


