#include "camera.bmx.debug.linux.x64.h"
struct BBDebugScope_1{int kind; const char *name; BBDebugDecl decls[2]; };
static int _bb_blitzmax_kingdomrealms_camera_inited = 0;
int _bb_blitzmax_kingdomrealms_camera(){
	if (!_bb_blitzmax_kingdomrealms_camera_inited) {
		_bb_blitzmax_kingdomrealms_camera_inited = 1;
		__bb_brl_blitz_blitz();
		__bb_openb3d_b3dglgraphics_b3dglgraphics();
		bbRegisterSource(0x3b52510ea203857e, "/home/william/Documents/GitHub/blitzmax-kingdomrealms/camera.bmx");
		struct openb3d_openb3dcore_TCamera_obj* bbt_camera=(struct openb3d_openb3dcore_TCamera_obj*)((struct openb3d_openb3dcore_TCamera_obj*)&bbNullObject);
		struct BBDebugScope_1 __scope = {
			BBDEBUGSCOPE_FUNCTION,
			"camera",
			{
				{
					BBDEBUGDECL_LOCAL,
					"camera",
					":TCamera",
					.var_address=&bbt_camera
				},
				{
					BBDEBUGDECL_END
				}
			}
		};
		bbOnDebugEnterScope(&__scope);
		struct BBDebugStm __stmt_0 = {0x3b52510ea203857e, 4, 0};
		bbOnDebugEnterStm(&__stmt_0);
		bbt_camera=(struct openb3d_openb3dcore_TCamera_obj*)openb3d_openb3dcore_CreateCamera((struct openb3d_openb3dcore_TEntity_obj*)&bbNullObject);
		struct BBDebugStm __stmt_1 = {0x3b52510ea203857e, 5, 0};
		bbOnDebugEnterStm(&__stmt_1);
		openb3d_openb3dcore_PositionEntity((struct openb3d_openb3dcore_TEntity_obj*)((struct openb3d_openb3dcore_TEntity_obj*)bbObjectDowncast((BBOBJECT)bbt_camera,(BBClass*)&openb3d_openb3dcore_TEntity)),130.000000f,1.00000000f,-130.000000f,0);
		bbOnDebugLeaveScope();
		return 0;
	}
	return 0;
}