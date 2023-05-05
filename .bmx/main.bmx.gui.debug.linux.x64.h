#ifndef BLITZMAX_BLITZKINGDOMS_MAIN_BMX_GUI_DEBUG_LINUX_X64_H
#define BLITZMAX_BLITZKINGDOMS_MAIN_BMX_GUI_DEBUG_LINUX_X64_H

#include <brl.mod/blitz.mod/.bmx/blitz.bmx.debug.linux.x64.h>
#include <openb3d.mod/b3dglgraphics.mod/.bmx/b3dglgraphics.bmx.debug.linux.x64.h>
int _bb_main();
extern BBINT _m_main_frame;
BBINT _m_main_orbitcamera(struct openb3d_openb3dcore_TEntity_obj* bbt_cam,struct openb3d_openb3dcore_TEntity_obj* bbt_ent,BBFLOAT bbt_dist);
BBINT _m_main_MouseLook(struct openb3d_openb3dcore_TMesh_obj* bbt_pivot,struct openb3d_openb3dcore_TCamera_obj* bbt_camera,BBLONG bbt_time);
BBINT _m_main_Move(struct openb3d_openb3dcore_TMesh_obj* bbt_ent);

#endif
