' CreateTerrain.bmx



' Load terrain
Global terrain:TTerrain=LoadTerrain( "Media/Zone/terrain_hmap.bmp" )

'PositionEntity(terrain,14,0,-15)
' Set terrain detail, enable vertex morphing
'TerrainDetail terrain,4000

' Scale terrain
ScaleEntity terrain,1,1,1
EntityPickMode(terrain,2)
NameEntity(terrain, "terrain")

' Texture terrain
Local grass_tex:TTexture=LoadTexture( "Media/Zone/terrain_colormap.bmp" )
EntityTexture terrain,grass_tex
ScaleTexture grass_tex,1,1

EntityType(terrain,GroupEnvironment)