Config = {}
Config.Locale = 'fr'

Config.Price = 250

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 0.06}
Config.MarkerColor  = {r = 0, g = 0, b = 0}
Config.MarkerType   = 1

Config.Zones = {}

Config.Shops = {
	{x=72.254,    y=-1399.102, z=28.395},
	{x=-703.776,  y=-152.258,  z=36.415},
	{x=-167.863,  y=-298.969,  z=38.737},
	{x=428.694,   y=-800.106,  z=28.4995},
	{x=-829.413,  y=-1073.710, z=10.3305},
	{x=-1447.797, y=-242.461,  z=48.822},
	{x=11.632,    y=6514.224,  z=30.879},
	{x=123.646,   y=-219.440,  z=53.559},
	{x=1696.291,  y=4829.312,  z=41.066},
	{x=618.093,   y=2759.629,  z=41.090},
	{x=1190.550,  y=2713.441,  z=37.225},
	{x=-1193.429, y=-772.262,  z=16.330},
	{x=-3172.496, y=1048.133,  z=19.866},
	{x=462.89, y=-996.42,  z=29.7}
}	

for i=1, #Config.Shops, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Shops[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
