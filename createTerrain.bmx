' CreateTerrain.bmx



' Load terrain
Local terrain:TTerrain=LoadTerrain( "Media/Zone/terrain_hmap.bmp" )

PositionEntity(terrain,0,0,0)
' Set terrain detail, enable vertex morphing
'TerrainDetail terrain,4000,True

' Scale terrain
ScaleEntity terrain,1,1,1

' Texture terrain
Local grass_tex:TTexture=LoadTexture( "Media/Zone/terrain_colormap.bmp" )
EntityTexture terrain,grass_tex
ScaleTexture grass_tex,1,1