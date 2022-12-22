#include "player.bmx.debug.linux.x64.h"
struct BBString_30{BBClass_String* clas;BBULONG hash;int length;BBChar buf[30];};
static struct BBString_30 _s0={
	&bbStringClass,
	0x21c2befef37cda5f,
	30,
	{77,101,100,105,97,47,109,111,100,101,108,115,47,80,108,97,121
	,101,114,47,112,108,97,121,101,114,46,98,51,100}
};
struct BBDebugScope_1{int kind; const char *name; BBDebugDecl decls[2]; };
static int _bb_blitzmax_kingdomrealms_player_inited = 0;
int _bb_blitzmax_kingdomrealms_player(){
	if (!_bb_blitzmax_kingdomrealms_player_inited) {
		_bb_blitzmax_kingdomrealms_player_inited = 1;
		__bb_brl_blitz_blitz();
		__bb_openb3d_b3dglgraphics_b3dglgraphics();
		bbRegisterSource(0xe2109a77ed38beaa, "/home/william/Documents/GitHub/blitzmax-kingdomrealms/player.bmx");
		struct openb3d_openb3dcore_TMesh_obj* bbt_player=(struct openb3d_openb3dcore_TMesh_obj*)((struct openb3d_openb3dcore_TMesh_obj*)&bbNullObject);
		struct BBDebugScope_1 __scope = {
			BBDEBUGSCOPE_FUNCTION,
			"player",
			{
				{
					BBDEBUGDECL_LOCAL,
					"player",
					":TMesh",
					.var_address=&bbt_player
				},
				{
					BBDEBUGDECL_END
				}
			}
		};
		bbOnDebugEnterScope(&__scope);
		struct BBDebugStm __stmt_0 = {0xe2109a77ed38beaa, 2, 0};
		bbOnDebugEnterStm(&__stmt_0);
		bbt_player=(struct openb3d_openb3dcore_TMesh_obj*)openb3d_openb3dcore_LoadAnimMesh((BBOBJECT)((BBString*)&_s0),(struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject,-1);
		struct BBDebugStm __stmt_1 = {0xe2109a77ed38beaa, 3, 0};
		bbOnDebugEnterStm(&__stmt_1);
		openb3d_openb3dcore_ScaleEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_player,(BBClass*)&openb3d_openb3dcore_TEntity)),1.00000000f,1.00000000f,1.00000000f,0);
		bbOnDebugLeaveScope();
		return 0;
	}
	return 0;
}