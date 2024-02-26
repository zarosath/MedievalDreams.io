ModuleInfo "Author: ziggy"
ModuleInfo "Version: 0.0.1 - First Release!"
import brl.blitz
import brl.hook
import brl.basic
import brl.graphics
DefaultMinimumTimeFactor!=0.25!
DefaultMaximumTimeFactor!=5.0000000000000000!
Delta^Object{
-New()="_blide_deltatiming_Delta_New"
+Factor!()="blide_deltatiming_Delta_Factor_d"
+SetMinimumTimeFactor%(Factor!=0.25!)="blide_deltatiming_Delta_SetMinimumTimeFactor_i_d"
+GetMinimumTimeFactor!()="blide_deltatiming_Delta_GetMinimumTimeFactor_d"
+SetMaximumTimeFactor%(Factor!=5.0000000000000000!)="blide_deltatiming_Delta_SetMaximumTimeFactor_i_d"
+GetMaximumTimeFactor!()="blide_deltatiming_Delta_GetMaximumTimeFactor_d"
+IsComputerSlow%()="blide_deltatiming_Delta_IsComputerSlow_i"
+GetFPS%()="blide_deltatiming_Delta_GetFPS_i"
+PauseDeltaTiming%()="blide_deltatiming_Delta_PauseDeltaTiming_i"
+ResumeDeltaTiming%()="blide_deltatiming_Delta_ResumeDeltaTiming_i"
+FlushTiming%()="blide_deltatiming_Delta_FlushTiming_i"
+IsPaused%()="blide_deltatiming_Delta_IsPaused_i"
+DebugString$()="blide_deltatiming_Delta_DebugString_S"
}A="blide_deltatiming_Delta"