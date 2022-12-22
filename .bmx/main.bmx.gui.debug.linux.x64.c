#include "main.bmx.gui.debug.linux.x64.h"
struct BBString_31{BBClass_String* clas;BBULONG hash;int length;BBChar buf[31];};
struct BBString_27{BBClass_String* clas;BBULONG hash;int length;BBChar buf[27];};
struct BBString_30{BBClass_String* clas;BBULONG hash;int length;BBChar buf[30];};
struct BBString_41{BBClass_String* clas;BBULONG hash;int length;BBChar buf[41];};
static struct BBString_31 _s2={
	&bbStringClass,
	0x3fd48e98285af976,
	31,
	{77,101,100,105,97,47,90,111,110,101,47,116,101,114,114,97,105
	,110,95,99,111,108,111,114,109,97,112,46,98,109,112}
};
static struct BBString_27 _s1={
	&bbStringClass,
	0xb3ddd9e019a7f66d,
	27,
	{77,101,100,105,97,47,90,111,110,101,47,116,101,114,114,97,105
	,110,95,104,109,97,112,46,98,109,112}
};
static struct BBString_30 _s0={
	&bbStringClass,
	0x21c2befef37cda5f,
	30,
	{77,101,100,105,97,47,109,111,100,101,108,115,47,80,108,97,121
	,101,114,47,112,108,97,121,101,114,46,98,51,100}
};
static struct BBString_41 _s3={
	&bbStringClass,
	0xe975fccc5c402ebb,
	41,
	{85,115,101,32,99,117,114,115,111,114,32,107,101,121,115,32,116
	,111,32,109,111,118,101,32,97,98,111,117,116,32,116,104,101
	,32,116,101,114,114,97,105,110}
};
struct BBDebugScope_4{int kind; const char *name; BBDebugDecl decls[5]; };
struct BBDebugScope_5{int kind; const char *name; BBDebugDecl decls[6]; };
static int _bb_main_inited = 0;
int _bb_main(){
	if (!_bb_main_inited) {
		_bb_main_inited = 1;
		__bb_brl_blitz_blitz();
		__bb_openb3d_b3dglgraphics_b3dglgraphics();
		bbRegisterSource(0x1302e4b9354befcf, "/home/william/Documents/GitHub/blitzmax-kingdomrealms/createTerrain.bmx");
		bbRegisterSource(0x228d8a4ebbee2001, "/home/william/Documents/GitHub/blitzmax-kingdomrealms/main.bmx");
		bbRegisterSource(0x3b52510ea203857e, "/home/william/Documents/GitHub/blitzmax-kingdomrealms/camera.bmx");
		bbRegisterSource(0xe2109a77ed38beaa, "/home/william/Documents/GitHub/blitzmax-kingdomrealms/player.bmx");
		struct openb3d_openb3dcore_TMesh_obj* bbt_player=(struct openb3d_openb3dcore_TMesh_obj*)((struct openb3d_openb3dcore_TMesh_obj*)&bbNullObject);
		struct openb3d_openb3dcore_TCamera_obj* bbt_camera=(struct openb3d_openb3dcore_TCamera_obj*)((struct openb3d_openb3dcore_TCamera_obj*)&bbNullObject);
		struct openb3d_openb3dcore_TTerrain_obj* bbt_terrain=(struct openb3d_openb3dcore_TTerrain_obj*)((struct openb3d_openb3dcore_TTerrain_obj*)&bbNullObject);
		struct openb3d_openb3dcore_TTexture_obj* bbt_grass_tex=(struct openb3d_openb3dcore_TTexture_obj*)((struct openb3d_openb3dcore_TTexture_obj*)&bbNullObject);
		struct openb3d_openb3dcore_TLight_obj* bbt_light=(struct openb3d_openb3dcore_TLight_obj*)((struct openb3d_openb3dcore_TLight_obj*)&bbNullObject);
		struct BBDebugScope_5 __scope = {
			BBDEBUGSCOPE_FUNCTION,
			"main",
			{
				{
					BBDEBUGDECL_LOCAL,
					"player",
					":TMesh",
					.var_address=&bbt_player
				},
				{
					BBDEBUGDECL_LOCAL,
					"camera",
					":TCamera",
					.var_address=&bbt_camera
				},
				{
					BBDEBUGDECL_LOCAL,
					"terrain",
					":TTerrain",
					.var_address=&bbt_terrain
				},
				{
					BBDEBUGDECL_LOCAL,
					"grass_tex",
					":TTexture",
					.var_address=&bbt_grass_tex
				},
				{
					BBDEBUGDECL_LOCAL,
					"light",
					":TLight",
					.var_address=&bbt_light
				},
				{
					BBDEBUGDECL_END
				}
			}
		};
		bbOnDebugEnterScope(&__scope);
		struct BBDebugStm __stmt_0 = {0x228d8a4ebbee2001, 7, 0};
		bbOnDebugEnterStm(&__stmt_0);
		openb3d_b3dglgraphics_Graphics3D(800,600,0,3,60,-1,0,-1,-1);
		struct BBDebugStm __stmt_1 = {0xe2109a77ed38beaa, 2, 0};
		bbOnDebugEnterStm(&__stmt_1);
		bbt_player=(struct openb3d_openb3dcore_TMesh_obj*)openb3d_openb3dcore_LoadAnimMesh((BBOBJECT)((BBString*)&_s0),(struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject,-1);
		struct BBDebugStm __stmt_2 = {0xe2109a77ed38beaa, 3, 0};
		bbOnDebugEnterStm(&__stmt_2);
		openb3d_openb3dcore_ScaleEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_player,(BBClass*)&openb3d_openb3dcore_TEntity)),1.00000000f,1.00000000f,1.00000000f,0);
		struct BBDebugStm __stmt_3 = {0x3b52510ea203857e, 4, 0};
		bbOnDebugEnterStm(&__stmt_3);
		bbt_camera=(struct openb3d_openb3dcore_TCamera_obj*)openb3d_openb3dcore_CreateCamera((struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject);
		struct BBDebugStm __stmt_4 = {0x3b52510ea203857e, 5, 0};
		bbOnDebugEnterStm(&__stmt_4);
		openb3d_openb3dcore_PositionEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),130.000000f,1.00000000f,-130.000000f,0);
		struct BBDebugStm __stmt_5 = {0x1302e4b9354befcf, 6, 0};
		bbOnDebugEnterStm(&__stmt_5);
		bbt_terrain=(struct openb3d_openb3dcore_TTerrain_obj*)openb3d_openb3dcore_LoadTerrain(((BBString*)&_s1),(struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject);
		struct BBDebugStm __stmt_6 = {0x1302e4b9354befcf, 13, 0};
		bbOnDebugEnterStm(&__stmt_6);
		openb3d_openb3dcore_ScaleEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3d_openb3dcore_TEntity)),1.00000000f,1.00000000f,1.00000000f,0);
		struct BBDebugStm __stmt_7 = {0x1302e4b9354befcf, 16, 0};
		bbOnDebugEnterStm(&__stmt_7);
		bbt_grass_tex=(struct openb3d_openb3dcore_TTexture_obj*)openb3d_openb3dcore_LoadTexture(((BBString*)&_s2),9,(struct openb3d_openb3dcore_TTexture_obj*)&bbNullObject);
		struct BBDebugStm __stmt_8 = {0x1302e4b9354befcf, 17, 0};
		bbOnDebugEnterStm(&__stmt_8);
		openb3d_openb3dcore_EntityTexture((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3d_openb3dcore_TEntity)),(struct openb3d_openb3dcore_TTexture_obj*)bbt_grass_tex,0,0);
		struct BBDebugStm __stmt_9 = {0x1302e4b9354befcf, 18, 0};
		bbOnDebugEnterStm(&__stmt_9);
		openb3d_openb3dcore_ScaleTexture((struct openb3d_openb3dcore_TTexture_obj*)bbt_grass_tex,1.00000000f,1.00000000f);
		struct BBDebugStm __stmt_10 = {0x228d8a4ebbee2001, 14, 0};
		bbOnDebugEnterStm(&__stmt_10);
		bbt_light=(struct openb3d_openb3dcore_TLight_obj*)openb3d_openb3dcore_CreateLight(1,(struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject);
		struct BBDebugStm __stmt_11 = {0x228d8a4ebbee2001, 15, 0};
		bbOnDebugEnterStm(&__stmt_11);
		openb3d_openb3dcore_RotateEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_light,(BBClass*)&openb3d_openb3dcore_TEntity)),90.0000000f,0.00000000f,0.00000000f,0);
		struct BBDebugStm __stmt_12 = {0x228d8a4ebbee2001, 17, 0};
		bbOnDebugEnterStm(&__stmt_12);
		while(!(brl_polledinput_KeyDown(27)!=0)){
			BBFLOAT bbt_x=0;
			BBFLOAT bbt_y=0;
			BBFLOAT bbt_z=0;
			BBFLOAT bbt_terra_y=0;
			struct BBDebugScope_4 __scope = {
				BBDEBUGSCOPE_LOCALBLOCK,
				0,
				{
					{
						BBDEBUGDECL_LOCAL,
						"x",
						"f",
						.var_address=&bbt_x
					},
					{
						BBDEBUGDECL_LOCAL,
						"y",
						"f",
						.var_address=&bbt_y
					},
					{
						BBDEBUGDECL_LOCAL,
						"z",
						"f",
						.var_address=&bbt_z
					},
					{
						BBDEBUGDECL_LOCAL,
						"terra_y",
						"f",
						.var_address=&bbt_terra_y
					},
					{
						BBDEBUGDECL_END
					}
				}
			};
			bbOnDebugEnterScope(&__scope);
			struct BBDebugStm __stmt_0 = {0x228d8a4ebbee2001, 19, 0};
			bbOnDebugEnterStm(&__stmt_0);
			if(brl_polledinput_KeyDown(39)==1){
				struct BBDebugScope __scope = {
					BBDEBUGSCOPE_LOCALBLOCK,
					0,
					{
						{
							BBDEBUGDECL_END
						}
					}
				};
				bbOnDebugEnterScope(&__scope);
				struct BBDebugStm __stmt_0 = {0x228d8a4ebbee2001, 19, 0};
				bbOnDebugEnterStm(&__stmt_0);
				openb3d_openb3dcore_TurnEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0.00000000f,-1.00000000f,0.00000000f,0);
				bbOnDebugLeaveScope();
			}
			struct BBDebugStm __stmt_1 = {0x228d8a4ebbee2001, 20, 0};
			bbOnDebugEnterStm(&__stmt_1);
			if(brl_polledinput_KeyDown(37)==1){
				struct BBDebugScope __scope = {
					BBDEBUGSCOPE_LOCALBLOCK,
					0,
					{
						{
							BBDEBUGDECL_END
						}
					}
				};
				bbOnDebugEnterScope(&__scope);
				struct BBDebugStm __stmt_0 = {0x228d8a4ebbee2001, 20, 0};
				bbOnDebugEnterStm(&__stmt_0);
				openb3d_openb3dcore_TurnEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0.00000000f,1.00000000f,0.00000000f,0);
				bbOnDebugLeaveScope();
			}
			struct BBDebugStm __stmt_2 = {0x228d8a4ebbee2001, 21, 0};
			bbOnDebugEnterStm(&__stmt_2);
			if(brl_polledinput_KeyDown(40)==1){
				struct BBDebugScope __scope = {
					BBDEBUGSCOPE_LOCALBLOCK,
					0,
					{
						{
							BBDEBUGDECL_END
						}
					}
				};
				bbOnDebugEnterScope(&__scope);
				struct BBDebugStm __stmt_0 = {0x228d8a4ebbee2001, 21, 0};
				bbOnDebugEnterStm(&__stmt_0);
				openb3d_openb3dcore_MoveEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0.00000000f,0.00000000f,-1.00000000f);
				bbOnDebugLeaveScope();
			}
			struct BBDebugStm __stmt_3 = {0x228d8a4ebbee2001, 22, 0};
			bbOnDebugEnterStm(&__stmt_3);
			if(brl_polledinput_KeyDown(38)==1){
				struct BBDebugScope __scope = {
					BBDEBUGSCOPE_LOCALBLOCK,
					0,
					{
						{
							BBDEBUGDECL_END
						}
					}
				};
				bbOnDebugEnterScope(&__scope);
				struct BBDebugStm __stmt_0 = {0x228d8a4ebbee2001, 22, 0};
				bbOnDebugEnterStm(&__stmt_0);
				openb3d_openb3dcore_MoveEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0.00000000f,0.00000000f,1.00000000f);
				bbOnDebugLeaveScope();
			}
			struct BBDebugStm __stmt_4 = {0x228d8a4ebbee2001, 23, 0};
			bbOnDebugEnterStm(&__stmt_4);
			if(brl_polledinput_KeyDown(87)==1){
				struct BBDebugScope __scope = {
					BBDEBUGSCOPE_LOCALBLOCK,
					0,
					{
						{
							BBDEBUGDECL_END
						}
					}
				};
				bbOnDebugEnterScope(&__scope);
				struct BBDebugStm __stmt_0 = {0x228d8a4ebbee2001, 23, 0};
				bbOnDebugEnterStm(&__stmt_0);
				openb3d_openb3dcore_MoveEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0.00000000f,1.00000000f,0.00000000f);
				bbOnDebugLeaveScope();
			}
			struct BBDebugStm __stmt_5 = {0x228d8a4ebbee2001, 24, 0};
			bbOnDebugEnterStm(&__stmt_5);
			if(brl_polledinput_KeyDown(83)==1){
				struct BBDebugScope __scope = {
					BBDEBUGSCOPE_LOCALBLOCK,
					0,
					{
						{
							BBDEBUGDECL_END
						}
					}
				};
				bbOnDebugEnterScope(&__scope);
				struct BBDebugStm __stmt_0 = {0x228d8a4ebbee2001, 24, 0};
				bbOnDebugEnterStm(&__stmt_0);
				openb3d_openb3dcore_MoveEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0.00000000f,-1.00000000f,0.00000000f);
				bbOnDebugLeaveScope();
			}
			struct BBDebugStm __stmt_6 = {0x228d8a4ebbee2001, 25, 0};
			bbOnDebugEnterStm(&__stmt_6);
			bbt_x=openb3d_openb3dcore_EntityX((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0);
			struct BBDebugStm __stmt_7 = {0x228d8a4ebbee2001, 26, 0};
			bbOnDebugEnterStm(&__stmt_7);
			bbt_y=openb3d_openb3dcore_EntityY((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0);
			struct BBDebugStm __stmt_8 = {0x228d8a4ebbee2001, 27, 0};
			bbOnDebugEnterStm(&__stmt_8);
			bbt_z=openb3d_openb3dcore_EntityZ((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0);
			struct BBDebugStm __stmt_9 = {0x228d8a4ebbee2001, 29, 0};
			bbOnDebugEnterStm(&__stmt_9);
			bbt_terra_y=(openb3d_openb3dcore_TerrainY((struct openb3d_openb3dcore_TTerrain_obj*)bbt_terrain,bbt_x,bbt_y,bbt_z)+5.00000000f);
			struct BBDebugStm __stmt_10 = {0x228d8a4ebbee2001, 31, 0};
			bbOnDebugEnterStm(&__stmt_10);
			openb3d_openb3dcore_PositionEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),bbt_x,bbt_terra_y,bbt_z,0);
			struct BBDebugStm __stmt_11 = {0x228d8a4ebbee2001, 33, 0};
			bbOnDebugEnterStm(&__stmt_11);
			openb3d_openb3dcore_RenderWorld();
			struct BBDebugStm __stmt_12 = {0x228d8a4ebbee2001, 35, 0};
			bbOnDebugEnterStm(&__stmt_12);
			openb3d_b3dglgraphics_Text(0,0,((BBString*)&_s3));
			struct BBDebugStm __stmt_13 = {0x228d8a4ebbee2001, 37, 0};
			bbOnDebugEnterStm(&__stmt_13);
			brl_graphics_Flip(-1);
			bbOnDebugLeaveScope();
		}
		bbOnDebugLeaveScope();
		return 0;
	}
	return 0;
}