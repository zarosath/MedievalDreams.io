#include "Terrain.bmx.gui.release.win32.x64.h"
static BBString _s12={
	&bbStringClass,
	0xfd3b9ffd685f7886,
	1,
	{32}
};
static BBString _s11={
	&bbStringClass,
	0xe975fccc5c402ebb,
	41,
	{85,115,101,32,99,117,114,115,111,114,32,107,101,121,115,32,116
	,111,32,109,111,118,101,32,97,98,111,117,116,32,116,104,101
	,32,116,101,114,114,97,105,110}
};
static BBString _s7={
	&bbStringClass,
	0x1c46236bb8a91dc,
	8,
	{99,111,108,111,114,77,97,112}
};
static BBString _s13={
	&bbStringClass,
	0x82295b15933d91be,
	5,
	{102,112,115,58,32}
};
static BBString _s10={
	&bbStringClass,
	0xb78638fc4c4eea17,
	9,
	{105,110,118,82,97,100,105,117,115}
};
static BBString _s8={
	&bbStringClass,
	0x396920e365c03716,
	9,
	{110,111,114,109,97,108,77,97,112}
};
static BBString _s6={
	&bbStringClass,
	0x81a9c35f536ff1d,
	25,
	{115,104,97,100,101,114,115,47,98,117,109,112,109,97,112,46,102
	,114,97,103,46,103,108,115,108}
};
static BBString _s5={
	&bbStringClass,
	0xb15787a2768f9c29,
	25,
	{115,104,97,100,101,114,115,47,98,117,109,112,109,97,112,46,118
	,101,114,116,46,103,108,115,108}
};
static BBString _s0={
	&bbStringClass,
	0x26782cb09c8a1c05,
	7,
	{115,107,121,46,98,109,112}
};
static BBString _s4={
	&bbStringClass,
	0xe8dd90c25a896a10,
	11,
	{115,112,101,99,109,97,112,46,112,110,103}
};
static BBString _s1={
	&bbStringClass,
	0x7daebba64764e34,
	11,
	{116,101,114,114,97,105,110,46,98,109,112}
};
static BBString _s2={
	&bbStringClass,
	0xf6a58b475de0d995,
	11,
	{116,101,120,116,117,114,101,46,106,112,103}
};
static BBString _s3={
	&bbStringClass,
	0x891dd04dd1e4e1db,
	12,
	{116,110,111,114,109,97,108,115,46,112,110,103}
};
static BBString _s9={
	&bbStringClass,
	0x6c23c124fef8a0f5,
	8,
	{118,84,97,110,103,101,110,116}
};
BBINT _m_Terrain_MouseLook(struct openb3dmax_openb3dmax_TPivot_obj* bbt_pivot,struct openb3dmax_openb3dmax_TCamera_obj* bbt_camera,BBINT bbt_time,BBINT bbt_elapsed){
	do{
		bbt_elapsed=(bbMilliSecs()-bbt_time);
	}while(!(bbt_elapsed>0));
	bbt_time=(bbt_time+bbt_elapsed);
	BBFLOAT bbt_dt=((((BBFLOAT)bbt_elapsed)*60.0f)/1000.0f);
	BBFLOAT bbt_x_speed=.00000000f;
	BBFLOAT bbt_y_speed=.00000000f;
	bbt_x_speed=(((((BBFLOAT)(brl_polledinput_MouseX()-320))-bbt_x_speed)/4.00000000f)+bbt_x_speed);
	bbt_y_speed=(((((BBFLOAT)(brl_polledinput_MouseY()-240))-bbt_y_speed)/4.00000000f)+bbt_y_speed);
	brl_system_MoveMouse(320,240);
	openb3dmax_openb3dmax_TurnEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_pivot,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0.000000000f,-bbt_x_speed,0.000000000f,0);
	openb3dmax_openb3dmax_TurnEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),bbt_y_speed,0.000000000f,0.000000000f,0);
	return 0;
}
static int _bb_main_inited = 0;
int _bb_main(){
	if (!_bb_main_inited) {
		_bb_main_inited = 1;
		__bb_brl_blitz_blitz();
		__bb_openb3dmax_b3dglsdlgraphics_b3dglsdlgraphics();
		openb3dmax_b3dglsdlgraphics_Graphics3D(800,600,0,0,60,-1,0);
		BBINT bbt_FpsTimer=0;
		BBINT bbt_FpsTicks=0;
		BBINT bbt_fps=0;
		struct openb3dmax_openb3dmax_TCamera_obj* bbt_camera=(struct openb3dmax_openb3dmax_TCamera_obj*)openb3dmax_openb3dmax_CreateCamera((struct openb3dmax_openb3dmax_TEntity_obj*)&bbNullObject);
		openb3dmax_openb3dmax_PositionEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),130.000000f,1.00000000f,-130.000000f,0);
		openb3dmax_openb3dmax_TurnEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0.000000000f,50.0000000f,0.000000000f,0);
		struct openb3dmax_openb3dmax_TLight_obj* bbt_light=(struct openb3dmax_openb3dmax_TLight_obj*)openb3dmax_openb3dmax_CreateLight(1,(struct openb3dmax_openb3dmax_TEntity_obj*)&bbNullObject);
		openb3dmax_openb3dmax_RotateEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_light,(BBClass*)&openb3dmax_openb3dmax_TEntity)),90.0000000f,0.000000000f,0.000000000f,0);
		struct openb3dmax_openb3dmax_TMesh_obj* bbt_sky=(struct openb3dmax_openb3dmax_TMesh_obj*)openb3dmax_openb3dmax_CreateSphere(32,(struct openb3dmax_openb3dmax_TEntity_obj*)&bbNullObject);
		struct openb3dmax_openb3dmax_TTexture_obj* bbt_tex=(struct openb3dmax_openb3dmax_TTexture_obj*)openb3dmax_openb3dmax_LoadTexture(&_s0,9,(struct openb3dmax_openb3dmax_TTexture_obj*)&bbNullObject);
		openb3dmax_openb3dmax_ScaleTexture((struct openb3dmax_openb3dmax_TTexture_obj*)bbt_tex,0.5f,0.5f);
		openb3dmax_openb3dmax_EntityTexture((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_sky,(BBClass*)&openb3dmax_openb3dmax_TEntity)),(struct openb3dmax_openb3dmax_TTexture_obj*)bbt_tex,0,0);
		openb3dmax_openb3dmax_ScaleEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_sky,(BBClass*)&openb3dmax_openb3dmax_TEntity)),500.000000f,500.000000f,500.000000f,0);
		openb3dmax_openb3dmax_EntityFX((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_sky,(BBClass*)&openb3dmax_openb3dmax_TEntity)),1);
		openb3dmax_openb3dmax_FlipMesh((struct openb3dmax_openb3dmax_TMesh_obj*)bbt_sky);
		struct openb3dmax_openb3dmax_TTerrain_obj* bbt_terrain=(struct openb3dmax_openb3dmax_TTerrain_obj*)openb3dmax_openb3dmax_LoadTerrain(&_s1,(struct openb3dmax_openb3dmax_TEntity_obj*)&bbNullObject);
		struct openb3dmax_openb3dmax_TTexture_obj* bbt_grass_tex=(struct openb3dmax_openb3dmax_TTexture_obj*)openb3dmax_openb3dmax_LoadTexture(&_s2,9,(struct openb3dmax_openb3dmax_TTexture_obj*)&bbNullObject);
		struct openb3dmax_openb3dmax_TTexture_obj* bbt_colortex=(struct openb3dmax_openb3dmax_TTexture_obj*)openb3dmax_openb3dmax_LoadTexture(&_s2,9,(struct openb3dmax_openb3dmax_TTexture_obj*)&bbNullObject);
		struct openb3dmax_openb3dmax_TTexture_obj* bbt_normaltex=(struct openb3dmax_openb3dmax_TTexture_obj*)openb3dmax_openb3dmax_LoadTexture(&_s3,9,(struct openb3dmax_openb3dmax_TTexture_obj*)&bbNullObject);
		struct openb3dmax_openb3dmax_TTexture_obj* bbt_spectex=(struct openb3dmax_openb3dmax_TTexture_obj*)openb3dmax_openb3dmax_LoadTexture(&_s4,9,(struct openb3dmax_openb3dmax_TTexture_obj*)&bbNullObject);
		struct openb3dmax_openb3dmax_TShader_obj* bbt_shader=(struct openb3dmax_openb3dmax_TShader_obj*)openb3dmax_openb3dmax_LoadShader(&bbEmptyString,&_s5,&_s6);
		BBFLOAT bbt_es=0.2f;
		openb3dmax_openb3dmax_EntityShininess((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3dmax_openb3dmax_TEntity)),bbt_es);
		openb3dmax_openb3dmax_ShaderTexture((struct openb3dmax_openb3dmax_TShader_obj*)bbt_shader,(struct openb3dmax_openb3dmax_TTexture_obj*)bbt_colortex,&_s7,0);
		openb3dmax_openb3dmax_ShaderTexture((struct openb3dmax_openb3dmax_TShader_obj*)bbt_shader,(struct openb3dmax_openb3dmax_TTexture_obj*)bbt_normaltex,&_s8,1);
		openb3dmax_openb3dmax_SetFloat3((struct openb3dmax_openb3dmax_TShader_obj*)bbt_shader,&_s9,0.1f,0.1f,0.1f);
		openb3dmax_openb3dmax_SetFloat((struct openb3dmax_openb3dmax_TShader_obj*)bbt_shader,&_s10,0.01f);
		openb3dmax_openb3dmax_ShadeEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3dmax_openb3dmax_TEntity)),(struct openb3dmax_openb3dmax_TShader_obj*)bbt_shader);
		openb3dmax_openb3dmax_EntityTexture((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3dmax_openb3dmax_TEntity)),(struct openb3dmax_openb3dmax_TTexture_obj*)bbt_grass_tex,0,0);
		openb3dmax_openb3dmax_ScaleEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3dmax_openb3dmax_TEntity)),1.00000000f,1.00000000f,1.00000000f,0);
		openb3dmax_openb3dmax_ScaleEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0.1f,0.1f,0.1f,0);
		openb3dmax_openb3dmax_RenderWorld();
		openb3dmax_openb3dmax_TLight_GetLightValues_i();
		BBUINT* bbt_=((BBARRAY)openb3dmax_openb3dmax_TLight_specular)->scales + 1;
		((BBFLOAT*)BBARRAYDATA(openb3dmax_openb3dmax_TLight_specular,1))[(*(bbt_)) * 1U + 0U]=0.784313738f;
		BBUINT* bbt_2=((BBARRAY)openb3dmax_openb3dmax_TLight_specular)->scales + 1;
		((BBFLOAT*)BBARRAYDATA(openb3dmax_openb3dmax_TLight_specular,1))[(*(bbt_2)) * 1U + 1U]=0.392156869f;
		BBUINT* bbt_3=((BBARRAY)openb3dmax_openb3dmax_TLight_specular)->scales + 1;
		((BBFLOAT*)BBARRAYDATA(openb3dmax_openb3dmax_TLight_specular,1))[(*(bbt_3)) * 1U + 2U]=0.392156869f;
		BBINT bbt_elapsed=0;
		BBINT bbt_time=bbMilliSecs();
		brl_system_HideMouse();
		brl_system_MoveMouse(0,0);
		while(!(brl_polledinput_KeyDown(27)!=0)){
			if((bbMilliSecs()-bbt_FpsTimer)>1000){
				bbt_FpsTimer=bbMilliSecs();
				bbt_fps=bbt_FpsTicks;
				bbt_FpsTicks=0;
			}else{
				bbt_FpsTicks=(bbt_FpsTicks+1);
			}
			if(brl_polledinput_KeyDown(39)==1){
				openb3dmax_openb3dmax_TurnEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0.000000000f,-1.00000000f,0.000000000f,0);
			}
			if(brl_polledinput_KeyDown(37)==1){
				openb3dmax_openb3dmax_TurnEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0.000000000f,1.00000000f,0.000000000f,0);
			}
			if(brl_polledinput_KeyDown(40)==1){
				openb3dmax_openb3dmax_MoveEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0.000000000f,0.000000000f,-1.00000000f);
			}
			if(brl_polledinput_KeyDown(38)==1){
				openb3dmax_openb3dmax_MoveEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0.000000000f,0.000000000f,1.00000000f);
			}
			if(brl_polledinput_KeyDown(87)==1){
				openb3dmax_openb3dmax_MoveEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0.000000000f,1.00000000f,0.000000000f);
			}
			if(brl_polledinput_KeyDown(83)==1){
				openb3dmax_openb3dmax_MoveEntity((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0.000000000f,-1.00000000f,0.000000000f);
			}
			openb3dmax_openb3dmax_RenderWorld();
			openb3dmax_b3dglsdlgraphics_Text(0,0,bbStringConcat(bbStringConcat(bbStringConcat(&_s11,bbStringFromFloat(openb3dmax_openb3dmax_EntityX((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0))),&_s12),bbStringFromFloat(openb3dmax_openb3dmax_EntityZ((struct openb3dmax_openb3dmax_TEntity_obj*)((struct openb3dmax_openb3dmax_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3dmax_openb3dmax_TEntity)),0))));
			openb3dmax_b3dglsdlgraphics_Text(0,10,bbStringConcat(&_s13,bbStringFromInt(bbt_fps)));
			brl_graphics_Flip(-1);
		}
		bbEnd();
		return 0;
	}
	return 0;
}