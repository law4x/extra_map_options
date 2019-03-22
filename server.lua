giant_map = {}
print("Extra Map Options version 19.3.21")

function giant_map:_on_required_loaded()
	local game_creation_service = radiant.mods.require('stonehearth.services.server.game_creation.game_creation_service')
	local custom = require('services.server.game_creation.game_creation_service')
	radiant.mixin(game_creation_service, custom)

	local world_generation_service = radiant.mods.require('stonehearth.services.server.world_generation.world_generation_service')
	local custom = require('services.server.world_generation.world_generation_service')
	radiant.mixin(world_generation_service, custom)

	local micro_map_generator = radiant.mods.require('stonehearth.services.server.world_generation.micro_map_generator')
	local custom = require('services.server.world_generation.micro_map_generator')
	radiant.mixin(micro_map_generator, custom)

	local landscaper = radiant.mods.require('stonehearth.services.server.world_generation.landscaper')
	local custom = require('services.server.world_generation.landscaper')
	radiant.mixin(landscaper, custom)

	local custom_height_map_renderer = require('services.server.world_generation.height_map_renderer')
	local height_map_renderer = radiant.mods.require('stonehearth.services.server.world_generation.height_map_renderer')
	radiant.mixin(height_map_renderer, custom_height_map_renderer)

	local custom_overview_map = require('services.server.world_generation.overview_map')
	local overview_map = radiant.mods.require('stonehearth.services.server.world_generation.overview_map')
	radiant.mixin(overview_map, custom_overview_map)

	local custom_physics_service = require('services.server.physics.physics_service')
	local physics_service = radiant.mods.require('stonehearth.services.server.physics.physics_service')
	radiant.mixin(physics_service, custom_physics_service)

	local custom_qb_to_terrain = require('scenarios.static.landmarks.qb_to_terrain')
	local qb_to_terrain = radiant.mods.require('stonehearth.scenarios.static.landmarks.qb_to_terrain')
	radiant.mixin(qb_to_terrain, custom_qb_to_terrain)
end

radiant.events.listen_once(radiant, 'radiant:required_loaded', giant_map, giant_map._on_required_loaded)

return giant_map