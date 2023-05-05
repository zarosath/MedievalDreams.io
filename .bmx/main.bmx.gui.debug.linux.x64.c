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
struct BBDebugScope_1{int kind; const char *name; BBDebugDecl decls[2]; };
struct BBDebugScope_4{int kind; const char *name; BBDebugDecl decls[5]; };
struct BBDebugScope_6{int kind; const char *name; BBDebugDecl decls[7]; };
struct BBDebugScope_7{int kind; const char *name; BBDebugDecl decls[8]; };
BBINT _m_main_frame=0;
BBINT _m_main_orbitcamera(struct openb3d_openb3dcore_TEntity_obj* bbt_cam,struct openb3d_openb3dcore_TEntity_obj* bbt_ent,BBFLOAT bbt_dist){
	struct openb3d_openb3dcore_TPivot_obj* bbt_piv=(struct openb3d_openb3dcore_TPivot_obj*)((struct openb3d_openb3dcore_TPivot_obj*)&bbNullObject);
	struct BBDebugScope_4 __scope = {
		BBDEBUGSCOPE_FUNCTION,
		"orbitcamera",
		{
			{
				BBDEBUGDECL_LOCAL,
				"cam",
				":TEntity",
				.var_address=&bbt_cam
			},
			{
				BBDEBUGDECL_LOCAL,
				"ent",
				":TEntity",
				.var_address=&bbt_ent
			},
			{
				BBDEBUGDECL_LOCAL,
				"dist",
				"f",
				.var_address=&bbt_dist
			},
			{
				BBDEBUGDECL_LOCAL,
				"piv",
				":TPivot",
				.var_address=&bbt_piv
			},
			{
				BBDEBUGDECL_END
			}
		}
	};
	bbOnDebugEnterScope(&__scope);
	struct BBDebugStm __stmt_0 = {0x402712429ee16003, 8, 0};
	bbOnDebugEnterStm(&__stmt_0);
	bbt_piv=(struct openb3d_openb3dcore_TPivot_obj*)openb3d_openb3dcore_CreatePivot((struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject);
	struct BBDebugStm __stmt_1 = {0x402712429ee16003, 9, 0};
	bbOnDebugEnterStm(&__stmt_1);
	openb3d_openb3dcore_PositionEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_piv,(BBClass*)&openb3d_openb3dcore_TEntity)),openb3d_openb3dcore_EntityX((struct openb3d_openb3dcore_TEntity_obj*)bbt_ent,0),openb3d_openb3dcore_EntityY((struct openb3d_openb3dcore_TEntity_obj*)bbt_ent,0),openb3d_openb3dcore_EntityZ((struct openb3d_openb3dcore_TEntity_obj*)bbt_ent,0),0);
	struct BBDebugStm __stmt_2 = {0x402712429ee16003, 10, 0};
	bbOnDebugEnterStm(&__stmt_2);
	openb3d_openb3dcore_PositionEntity((struct openb3d_openb3dcore_TEntity_obj*)bbt_cam,openb3d_openb3dcore_EntityX((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_piv,(BBClass*)&openb3d_openb3dcore_TEntity)),0),openb3d_openb3dcore_EntityY((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_piv,(BBClass*)&openb3d_openb3dcore_TEntity)),0),openb3d_openb3dcore_EntityZ((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_piv,(BBClass*)&openb3d_openb3dcore_TEntity)),0),0);
	struct BBDebugStm __stmt_3 = {0x402712429ee16003, 12, 0};
	bbOnDebugEnterStm(&__stmt_3);
	openb3d_openb3dcore_MoveEntity((struct openb3d_openb3dcore_TEntity_obj*)bbt_cam,0.00000000f,0.00000000f,-bbt_dist);
	struct BBDebugStm __stmt_4 = {0x402712429ee16003, 13, 0};
	bbOnDebugEnterStm(&__stmt_4);
	openb3d_openb3dcore_EntityParent((struct openb3d_openb3dcore_TEntity_obj*)bbt_cam,(struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_piv,(BBClass*)&openb3d_openb3dcore_TEntity)),1);
	struct BBDebugStm __stmt_5 = {0x402712429ee16003, 14, 0};
	bbOnDebugEnterStm(&__stmt_5);
	openb3d_openb3dcore_TurnEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_piv,(BBClass*)&openb3d_openb3dcore_TEntity)),(((BBFLOAT)brl_polledinput_MouseXSpeed())*0.6f),(((BBFLOAT)brl_polledinput_MouseYSpeed())*0.6f),(((BBFLOAT)brl_polledinput_MouseZSpeed())*0.6f),0);
	bbOnDebugLeaveScope();
	return 0;
}
BBINT _m_main_MouseLook(struct openb3d_openb3dcore_TMesh_obj* bbt_pivot,struct openb3d_openb3dcore_TCamera_obj* bbt_camera,BBLONG bbt_time){
	BBLONG bbt_elapsed=0;
	BBFLOAT bbt_dt=0;
	BBFLOAT bbt_x_speed=0;
	BBFLOAT bbt_y_speed=0;
	struct BBDebugScope_7 __scope = {
		BBDEBUGSCOPE_FUNCTION,
		"MouseLook",
		{
			{
				BBDEBUGDECL_LOCAL,
				"pivot",
				":TMesh",
				.var_address=&bbt_pivot
			},
			{
				BBDEBUGDECL_LOCAL,
				"camera",
				":TCamera",
				.var_address=&bbt_camera
			},
			{
				BBDEBUGDECL_LOCAL,
				"time",
				"l",
				.var_address=&bbt_time
			},
			{
				BBDEBUGDECL_LOCAL,
				"elapsed",
				"l",
				.var_address=&bbt_elapsed
			},
			{
				BBDEBUGDECL_LOCAL,
				"dt",
				"f",
				.var_address=&bbt_dt
			},
			{
				BBDEBUGDECL_LOCAL,
				"x_speed",
				"f",
				.var_address=&bbt_x_speed
			},
			{
				BBDEBUGDECL_LOCAL,
				"y_speed",
				"f",
				.var_address=&bbt_y_speed
			},
			{
				BBDEBUGDECL_END
			}
		}
	};
	bbOnDebugEnterScope(&__scope);
	struct BBDebugStm __stmt_0 = {0x995c000e25d05f08, 6, 0};
	bbOnDebugEnterStm(&__stmt_0);
	bbt_elapsed=0LL;
	struct BBDebugStm __stmt_1 = {0x995c000e25d05f08, 10, 0};
	bbOnDebugEnterStm(&__stmt_1);
	do{
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
		struct BBDebugStm __stmt_0 = {0x995c000e25d05f08, 9, 0};
		bbOnDebugEnterStm(&__stmt_0);
		bbt_elapsed=(((BBLONG)bbMilliSecs())-bbt_time);
		bbOnDebugLeaveScope();
	}while(!(bbt_elapsed>0LL));
	struct BBDebugStm __stmt_2 = {0x995c000e25d05f08, 12, 0};
	bbOnDebugEnterStm(&__stmt_2);
	bbt_time=(bbt_time+bbt_elapsed);
	struct BBDebugStm __stmt_3 = {0x995c000e25d05f08, 13, 0};
	bbOnDebugEnterStm(&__stmt_3);
	bbt_dt=((((BBFLOAT)bbt_elapsed)*60.0f)/1000.0f);
	struct BBDebugStm __stmt_4 = {0x995c000e25d05f08, 15, 0};
	bbOnDebugEnterStm(&__stmt_4);
	bbt_x_speed=.00000000f;
	struct BBDebugStm __stmt_5 = {0x995c000e25d05f08, 15, 0};
	bbOnDebugEnterStm(&__stmt_5);
	bbt_y_speed=.00000000f;
	struct BBDebugStm __stmt_6 = {0x995c000e25d05f08, 17, 0};
	bbOnDebugEnterStm(&__stmt_6);
	bbt_x_speed=(((((BBFLOAT)(brl_polledinput_MouseX()-320))-bbt_x_speed)/8.00000000f)+bbt_x_speed);
	struct BBDebugStm __stmt_7 = {0x995c000e25d05f08, 18, 0};
	bbOnDebugEnterStm(&__stmt_7);
	bbt_y_speed=(((((BBFLOAT)(brl_polledinput_MouseY()-240))-bbt_y_speed)/8.00000000f)+bbt_y_speed);
	struct BBDebugStm __stmt_8 = {0x995c000e25d05f08, 19, 0};
	bbOnDebugEnterStm(&__stmt_8);
	brl_system_MoveMouse(320,240);
	struct BBDebugStm __stmt_9 = {0x995c000e25d05f08, 21, 0};
	bbOnDebugEnterStm(&__stmt_9);
	openb3d_openb3dcore_TurnEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_pivot,(BBClass*)&openb3d_openb3dcore_TEntity)),0.00000000f,-bbt_x_speed,0.00000000f,0);
	struct BBDebugStm __stmt_10 = {0x995c000e25d05f08, 22, 0};
	bbOnDebugEnterStm(&__stmt_10);
	openb3d_openb3dcore_TurnEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),bbt_y_speed,0.00000000f,0.00000000f,0);
	bbOnDebugLeaveScope();
	return 0;
}
BBINT _m_main_Move(struct openb3d_openb3dcore_TMesh_obj* bbt_ent){
	struct BBDebugScope_1 __scope = {
		BBDEBUGSCOPE_FUNCTION,
		"Move",
		{
			{
				BBDEBUGDECL_LOCAL,
				"ent",
				":TMesh",
				.var_address=&bbt_ent
			},
			{
				BBDEBUGDECL_END
			}
		}
	};
	bbOnDebugEnterScope(&__scope);
	struct BBDebugStm __stmt_0 = {0x995c000e25d05f08, 27, 0};
	bbOnDebugEnterStm(&__stmt_0);
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
		struct BBDebugStm __stmt_0 = {0x995c000e25d05f08, 27, 0};
		bbOnDebugEnterStm(&__stmt_0);
		openb3d_openb3dcore_MoveEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_ent,(BBClass*)&openb3d_openb3dcore_TEntity)),0.00000000f,0.00000000f,0.05f);
		bbOnDebugLeaveScope();
	}
	struct BBDebugStm __stmt_1 = {0x995c000e25d05f08, 28, 0};
	bbOnDebugEnterStm(&__stmt_1);
	if(brl_polledinput_KeyDown(65)==1){
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
		struct BBDebugStm __stmt_0 = {0x995c000e25d05f08, 28, 0};
		bbOnDebugEnterStm(&__stmt_0);
		openb3d_openb3dcore_MoveEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_ent,(BBClass*)&openb3d_openb3dcore_TEntity)),-0.05f,0.00000000f,0.00000000f);
		bbOnDebugLeaveScope();
	}
	struct BBDebugStm __stmt_2 = {0x995c000e25d05f08, 29, 0};
	bbOnDebugEnterStm(&__stmt_2);
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
		struct BBDebugStm __stmt_0 = {0x995c000e25d05f08, 29, 0};
		bbOnDebugEnterStm(&__stmt_0);
		openb3d_openb3dcore_MoveEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_ent,(BBClass*)&openb3d_openb3dcore_TEntity)),0.00000000f,0.00000000f,-0.05f);
		bbOnDebugLeaveScope();
	}
	struct BBDebugStm __stmt_3 = {0x995c000e25d05f08, 30, 0};
	bbOnDebugEnterStm(&__stmt_3);
	if(brl_polledinput_KeyDown(68)==1){
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
		struct BBDebugStm __stmt_0 = {0x995c000e25d05f08, 30, 0};
		bbOnDebugEnterStm(&__stmt_0);
		openb3d_openb3dcore_MoveEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_ent,(BBClass*)&openb3d_openb3dcore_TEntity)),0.05f,0.00000000f,0.00000000f);
		bbOnDebugLeaveScope();
	}
	bbOnDebugLeaveScope();
	return 0;
}
static int _bb_main_inited = 0;
int _bb_main(){
	if (!_bb_main_inited) {
		_bb_main_inited = 1;
		GC_add_roots(&_m_main_frame, &_m_main_frame + 1);
		__bb_brl_blitz_blitz();
		__bb_openb3d_b3dglgraphics_b3dglgraphics();
		bbRegisterSource(0x402712429ee16003, "/home/william/Documents/GitHub/blitzmax-blitzKingdoms/camera.bmx");
		bbRegisterSource(0x74aa7cb1cd46bdc7, "/home/william/Documents/GitHub/blitzmax-blitzKingdoms/player.bmx");
		bbRegisterSource(0x995c000e25d05f08, "/home/william/Documents/GitHub/blitzmax-blitzKingdoms/CameraFunctions.bmx");
		bbRegisterSource(0xc6e67c9b4eba63c7, "/home/william/Documents/GitHub/blitzmax-blitzKingdoms/createTerrain.bmx");
		bbRegisterSource(0xdb9999205e9cd0a3, "/home/william/Documents/GitHub/blitzmax-blitzKingdoms/main.bmx");
		struct openb3d_openb3dcore_TMesh_obj* bbt_Player=(struct openb3d_openb3dcore_TMesh_obj*)((struct openb3d_openb3dcore_TMesh_obj*)&bbNullObject);
		struct openb3d_openb3dcore_TCamera_obj* bbt_camera=(struct openb3d_openb3dcore_TCamera_obj*)((struct openb3d_openb3dcore_TCamera_obj*)&bbNullObject);
		struct openb3d_openb3dcore_TTerrain_obj* bbt_terrain=(struct openb3d_openb3dcore_TTerrain_obj*)((struct openb3d_openb3dcore_TTerrain_obj*)&bbNullObject);
		struct openb3d_openb3dcore_TTexture_obj* bbt_grass_tex=(struct openb3d_openb3dcore_TTexture_obj*)((struct openb3d_openb3dcore_TTexture_obj*)&bbNullObject);
		struct openb3d_openb3dcore_TLight_obj* bbt_light=(struct openb3d_openb3dcore_TLight_obj*)((struct openb3d_openb3dcore_TLight_obj*)&bbNullObject);
		struct BBDebugScope_6 __scope = {
			BBDEBUGSCOPE_FUNCTION,
			"main",
			{
				{
					BBDEBUGDECL_GLOBAL,
					"frame",
					"i",
					.var_address=(void*)&_m_main_frame
				},
				{
					BBDEBUGDECL_LOCAL,
					"Player",
					":TMesh",
					.var_address=&bbt_Player
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
		struct BBDebugStm __stmt_0 = {0xdb9999205e9cd0a3, 7, 0};
		bbOnDebugEnterStm(&__stmt_0);
		openb3d_b3dglgraphics_Graphics3D(800,600,0,3,60,-1,0,-1,-1);
		struct BBDebugStm __stmt_1 = {0x74aa7cb1cd46bdc7, 2, 0};
		bbOnDebugEnterStm(&__stmt_1);
		bbt_Player=(struct openb3d_openb3dcore_TMesh_obj*)openb3d_openb3dcore_LoadAnimMesh((BBOBJECT)((BBString*)&_s0),(struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject,-1);
		struct BBDebugStm __stmt_2 = {0x74aa7cb1cd46bdc7, 3, 0};
		bbOnDebugEnterStm(&__stmt_2);
		openb3d_openb3dcore_ScaleEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_Player,(BBClass*)&openb3d_openb3dcore_TEntity)),1.00000000f,1.00000000f,1.00000000f,0);
		struct BBDebugStm __stmt_3 = {0x402712429ee16003, 4, 0};
		bbOnDebugEnterStm(&__stmt_3);
		bbt_camera=(struct openb3d_openb3dcore_TCamera_obj*)openb3d_openb3dcore_CreateCamera((struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject);
		struct BBDebugStm __stmt_4 = {0x402712429ee16003, 5, 0};
		bbOnDebugEnterStm(&__stmt_4);
		openb3d_openb3dcore_PositionEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),130.000000f,1.00000000f,-130.000000f,0);
		struct BBDebugStm __stmt_5 = {0xc6e67c9b4eba63c7, 6, 0};
		bbOnDebugEnterStm(&__stmt_5);
		bbt_terrain=(struct openb3d_openb3dcore_TTerrain_obj*)openb3d_openb3dcore_LoadTerrain(((BBString*)&_s1),(struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject);
		struct BBDebugStm __stmt_6 = {0xc6e67c9b4eba63c7, 13, 0};
		bbOnDebugEnterStm(&__stmt_6);
		openb3d_openb3dcore_ScaleEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3d_openb3dcore_TEntity)),1.00000000f,1.00000000f,1.00000000f,0);
		struct BBDebugStm __stmt_7 = {0xc6e67c9b4eba63c7, 16, 0};
		bbOnDebugEnterStm(&__stmt_7);
		bbt_grass_tex=(struct openb3d_openb3dcore_TTexture_obj*)openb3d_openb3dcore_LoadTexture(((BBString*)&_s2),9,(struct openb3d_openb3dcore_TTexture_obj*)&bbNullObject);
		struct BBDebugStm __stmt_8 = {0xc6e67c9b4eba63c7, 17, 0};
		bbOnDebugEnterStm(&__stmt_8);
		openb3d_openb3dcore_EntityTexture((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3d_openb3dcore_TEntity)),(struct openb3d_openb3dcore_TTexture_obj*)bbt_grass_tex,0,0);
		struct BBDebugStm __stmt_9 = {0xc6e67c9b4eba63c7, 18, 0};
		bbOnDebugEnterStm(&__stmt_9);
		openb3d_openb3dcore_ScaleTexture((struct openb3d_openb3dcore_TTexture_obj*)bbt_grass_tex,1.00000000f,1.00000000f);
		struct BBDebugStm __stmt_10 = {0xdb9999205e9cd0a3, 15, 0};
		bbOnDebugEnterStm(&__stmt_10);
		struct BBDebugStm __stmt_11 = {0xdb9999205e9cd0a3, 18, 0};
		bbOnDebugEnterStm(&__stmt_11);
		bbt_light=(struct openb3d_openb3dcore_TLight_obj*)openb3d_openb3dcore_CreateLight(1,(struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject);
		struct BBDebugStm __stmt_12 = {0xdb9999205e9cd0a3, 19, 0};
		bbOnDebugEnterStm(&__stmt_12);
		openb3d_openb3dcore_RotateEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_light,(BBClass*)&openb3d_openb3dcore_TEntity)),90.0000000f,0.00000000f,0.00000000f,0);
		struct BBDebugStm __stmt_13 = {0xdb9999205e9cd0a3, 22, 0};
		bbOnDebugEnterStm(&__stmt_13);
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
			struct BBDebugStm __stmt_0 = {0xdb9999205e9cd0a3, 23, 0};
			bbOnDebugEnterStm(&__stmt_0);
			_m_main_frame=(_m_main_frame+1);
			struct BBDebugStm __stmt_1 = {0xdb9999205e9cd0a3, 24, 0};
			bbOnDebugEnterStm(&__stmt_1);
			_m_main_orbitcamera((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),(struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_Player,(BBClass*)&openb3d_openb3dcore_TEntity)),1.00000000f);
			struct BBDebugStm __stmt_2 = {0xdb9999205e9cd0a3, 31, 0};
			bbOnDebugEnterStm(&__stmt_2);
			bbt_x=openb3d_openb3dcore_EntityX((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0);
			struct BBDebugStm __stmt_3 = {0xdb9999205e9cd0a3, 32, 0};
			bbOnDebugEnterStm(&__stmt_3);
			bbt_y=openb3d_openb3dcore_EntityY((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0);
			struct BBDebugStm __stmt_4 = {0xdb9999205e9cd0a3, 33, 0};
			bbOnDebugEnterStm(&__stmt_4);
			bbt_z=openb3d_openb3dcore_EntityZ((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),0);
			struct BBDebugStm __stmt_5 = {0xdb9999205e9cd0a3, 35, 0};
			bbOnDebugEnterStm(&__stmt_5);
			bbt_terra_y=(openb3d_openb3dcore_TerrainY((struct openb3d_openb3dcore_TTerrain_obj*)bbt_terrain,bbt_x,bbt_y,bbt_z)+5.00000000f);
			struct BBDebugStm __stmt_6 = {0xdb9999205e9cd0a3, 39, 0};
			bbOnDebugEnterStm(&__stmt_6);
			openb3d_openb3dcore_RenderWorld();
			struct BBDebugStm __stmt_7 = {0xdb9999205e9cd0a3, 41, 0};
			bbOnDebugEnterStm(&__stmt_7);
			openb3d_b3dglgraphics_Text(0,0,((BBString*)&_s3));
			struct BBDebugStm __stmt_8 = {0xdb9999205e9cd0a3, 43, 0};
			bbOnDebugEnterStm(&__stmt_8);
			brl_graphics_Flip(-1);
			bbOnDebugLeaveScope();
		}
		bbOnDebugLeaveScope();
		return 0;
	}
	return 0;
}