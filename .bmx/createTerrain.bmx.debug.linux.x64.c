#include "createTerrain.bmx.debug.linux.x64.h"
struct BBString_31{BBClass_String* clas;BBULONG hash;int length;BBChar buf[31];};
struct BBString_27{BBClass_String* clas;BBULONG hash;int length;BBChar buf[27];};
static struct BBString_31 _s1={
	&bbStringClass,
	0x3fd48e98285af976,
	31,
	{77,101,100,105,97,47,90,111,110,101,47,116,101,114,114,97,105
	,110,95,99,111,108,111,114,109,97,112,46,98,109,112}
};
static struct BBString_27 _s0={
	&bbStringClass,
	0xb3ddd9e019a7f66d,
	27,
	{77,101,100,105,97,47,90,111,110,101,47,116,101,114,114,97,105
	,110,95,104,109,97,112,46,98,109,112}
};
struct BBDebugScope_2{int kind; const char *name; BBDebugDecl decls[3]; };
static int _bb_blitzmax_kingdomrealms_createterrain_inited = 0;
int _bb_blitzmax_kingdomrealms_createterrain(){
	if (!_bb_blitzmax_kingdomrealms_createterrain_inited) {
		_bb_blitzmax_kingdomrealms_createterrain_inited = 1;
		__bb_brl_blitz_blitz();
		__bb_openb3d_b3dglgraphics_b3dglgraphics();
		bbRegisterSource(0x1302e4b9354befcf, "/home/william/Documents/GitHub/blitzmax-kingdomrealms/createTerrain.bmx");
		struct openb3d_openb3dcore_TTerrain_obj* bbt_terrain=(struct openb3d_openb3dcore_TTerrain_obj*)((struct openb3d_openb3dcore_TTerrain_obj*)&bbNullObject);
		struct openb3d_openb3dcore_TTexture_obj* bbt_grass_tex=(struct openb3d_openb3dcore_TTexture_obj*)((struct openb3d_openb3dcore_TTexture_obj*)&bbNullObject);
		struct BBDebugScope_2 __scope = {
			BBDEBUGSCOPE_FUNCTION,
			"createTerrain",
			{
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
					BBDEBUGDECL_END
				}
			}
		};
		bbOnDebugEnterScope(&__scope);
		struct BBDebugStm __stmt_0 = {0x1302e4b9354befcf, 6, 0};
		bbOnDebugEnterStm(&__stmt_0);
		bbt_terrain=(struct openb3d_openb3dcore_TTerrain_obj*)openb3d_openb3dcore_LoadTerrain(((BBString*)&_s0),(struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject);
		struct BBDebugStm __stmt_1 = {0x1302e4b9354befcf, 13, 0};
		bbOnDebugEnterStm(&__stmt_1);
		openb3d_openb3dcore_ScaleEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3d_openb3dcore_TEntity)),1.00000000f,1.00000000f,1.00000000f,0);
		struct BBDebugStm __stmt_2 = {0x1302e4b9354befcf, 16, 0};
		bbOnDebugEnterStm(&__stmt_2);
		bbt_grass_tex=(struct openb3d_openb3dcore_TTexture_obj*)openb3d_openb3dcore_LoadTexture(((BBString*)&_s1),9,(struct openb3d_openb3dcore_TTexture_obj*)&bbNullObject);
		struct BBDebugStm __stmt_3 = {0x1302e4b9354befcf, 17, 0};
		bbOnDebugEnterStm(&__stmt_3);
		openb3d_openb3dcore_EntityTexture((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_terrain,(BBClass*)&openb3d_openb3dcore_TEntity)),(struct openb3d_openb3dcore_TTexture_obj*)bbt_grass_tex,0,0);
		struct BBDebugStm __stmt_4 = {0x1302e4b9354befcf, 18, 0};
		bbOnDebugEnterStm(&__stmt_4);
		openb3d_openb3dcore_ScaleTexture((struct openb3d_openb3dcore_TTexture_obj*)bbt_grass_tex,1.00000000f,1.00000000f);
		bbOnDebugLeaveScope();
		return 0;
	}
	return 0;
}