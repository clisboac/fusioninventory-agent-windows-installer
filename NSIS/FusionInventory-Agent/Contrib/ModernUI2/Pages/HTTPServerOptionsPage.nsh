/*
   ------------------------------------------------------------------------
   FusionInventory Agent Installer for Microsoft Windows
   Copyright (C) 2010-2013 by the FusionInventory Development Team.

   http://www.fusioninventory.org/ http://forge.fusioninventory.org/
   ------------------------------------------------------------------------

   LICENSE

   This file is part of FusionInventory project.

   FusionInventory Agent Installer for Microsoft Windows is free software;
   you can redistribute it and/or modify it under the terms of the GNU
   General Public License as published by the Free Software Foundation;
   either version 2 of the License, or (at your option) any later version.


   FusionInventory Agent Installer for Microsoft Windows is distributed in
   the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
   the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
   PURPOSE. See the GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software Foundation,
   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA,
   or see <http://www.gnu.org/licenses/>.

   ------------------------------------------------------------------------

   @package   FusionInventory Agent Installer for Microsoft Windows
   @file      .\FusionInventory Agent\Contrib\ModernUI2\Pages\HTTPServerOptionsPage.nsh
   @author    Tomas Abad <tabadgp@gmail.com>
   @copyright Copyright (c) 2010-2013 FusionInventory Team
   @license   GNU GPL version 2 or (at your option) any later version
              http://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html
   @link      http://www.fusioninventory.org/
   @link      http://forge.fusioninventory.org/projects/fusioninventory-agent
   @since     2012

   ------------------------------------------------------------------------
*/

/*
   ------------------------------------------------------------------------
   This file was generated with the help of NSISDialogDesigner 1.1.2.0
   http://coolsoft.altervista.org/nsisdialogdesigner
   ------------------------------------------------------------------------
*/


!include LogicLib.nsh
!include "${FIAI_DIR}\Include\INIFunc.nsh"
!include "${FIAI_DIR}\Include\StrFunc.nsh"
!include "${FIAI_DIR}\Include\OptionChecks.nsh"
!include "${FIAI_DIR}\Include\CommaUStrFunc.nsh"
!include "${FIAI_DIR}\Contrib\ModernUI2\Pages\HTTPServerOptionsPageLangStrings.nsh"


;--------------------------------
; Handle variables

Var hCtl_HTTPServerOptionsPage
Var hCtl_HTTPServerOptionsPage_GroupBox1
Var hCtl_HTTPServerOptionsPage_Label1
Var hCtl_HTTPServerOptionsPage_TextBox1
Var hCtl_HTTPServerOptionsPage_Label2
Var hCtl_HTTPServerOptionsPage_Number1
Var hCtl_HTTPServerOptionsPage_Label3
Var hCtl_HTTPServerOptionsPage_TextBox2
Var hCtl_HTTPServerOptionsPage_CheckBox1
Var hCtl_HTTPServerOptionsPage_CheckBox2


;--------------------------------
; HTTP Server Options Page Functions

Function HTTPServerOptionsPage_Back
   Call HTTPServerOptionsPage_Leave
FunctionEnd


Function HTTPServerOptionsPage_Create
   ; === HTTPServerOptionsPage (type: Dialog) ===
   nsDialogs::Create 1018
   Pop $hCtl_HTTPServerOptionsPage
   ${If} $hCtl_HTTPServerOptionsPage == error
     Abort
   ${EndIf}
   !insertmacro MUI_HEADER_TEXT "$(HTTPServerOptionsPage_Text)" "$(HTTPServerOptionsPage_SubText)"

   ; === GroupBox1 (type: GroupBox) ===
   ${NSD_CreateGroupBox} 3u 18u 289u 65u "$(HTTPServerOptionsPage_GroupBox1_Text)"
   Pop $hCtl_HTTPServerOptionsPage_GroupBox1

   ; === Label1 (type: Label) ===
   ${NSD_CreateLabel} 16u 32u 81u 8u "$(HTTPServerOptionsPage_Label1_Text)"
   Pop $hCtl_HTTPServerOptionsPage_Label1

   ; === TextBox1 (type: Text) ===
   ${NSD_CreateText} 13u 41u 84u 11u ""
   Pop $hCtl_HTTPServerOptionsPage_TextBox1

   ; === Label2 (type: Label) ===
   ${NSD_CreateLabel} 105u 32u 39u 8u "$(HTTPServerOptionsPage_Label2_Text)"
   Pop $hCtl_HTTPServerOptionsPage_Label2

   ; === Number1 (type: Number) ===
   ${NSD_CreateNumber} 102u 41u 42u 11u ""
   Pop $hCtl_HTTPServerOptionsPage_Number1
   ${NSD_SetTextLimit} $hCtl_HTTPServerOptionsPage_Number1 "5"

   ; === Label3 (type: Label) ===
   ${NSD_CreateLabel} 16u 54u 265u 8u "$(HTTPServerOptionsPage_Label3_Text)"
   Pop $hCtl_HTTPServerOptionsPage_Label3

   ; === TextBox2 (type: Text) ===
   ${NSD_CreateText} 13u 63u 268u 11u ""
   Pop $hCtl_HTTPServerOptionsPage_TextBox2

   ; === CheckBox1 (type: Checkbox) ===
   ${NSD_CreateCheckbox} 16u 90u 263u 11u "$(HTTPServerOptionsPage_CheckBox1_Text)"
   Pop $hCtl_HTTPServerOptionsPage_CheckBox1
   ${NSD_AddStyle} $hCtl_HTTPServerOptionsPage_CheckBox1 ${BS_RIGHT}|${BS_RIGHTBUTTON}

   ; === CheckBox2 (type: Checkbox) ===
   ${NSD_CreateCheckbox} 16u 104u 263u 11u "$(HTTPServerOptionsPage_CheckBox2_Text)"
   Pop $hCtl_HTTPServerOptionsPage_CheckBox2
   ${NSD_AddStyle} $hCtl_HTTPServerOptionsPage_CheckBox2 ${BS_RIGHT}|${BS_RIGHTBUTTON}

   ; OnBack Function
   ${NSD_OnBack} HTTPServerOptionsPage_Back

   ; Push $R0 & $R1 onto the stack
   Push $R0
   Push $R1

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Set TextBox1 Text
   ${ReadINIOption} $R1 "$R0" "${IO_HTTPD-IP}"
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_TextBox1 "$R1"

   ; Set Number1 Text
   ${ReadINIOption} $R1 "$R0" "${IO_HTTPD-PORT}"
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_Number1 "$R1"

   ; Set TextBox2 Text
   ${ReadINIOption} $R1 "$R0" "${IO_HTTPD-TRUST}"
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_TextBox2 "$R1"

   ; Set CheckBox1 Check
   ${ReadINIOption} $R1 "$R0" "${IO_ADD-FIREWALL-EXCEPTION}"
   ${If} "$R1" != "0"
      ${NSD_Check} $hCtl_HTTPServerOptionsPage_CheckBox1
   ${Else}
      ${NSD_Uncheck} $hCtl_HTTPServerOptionsPage_CheckBox1
   ${EndIf}

   ; Set CheckBox2 Check
   ${ReadINIOption} $R1 "$R0" "${IO_NO-HTTPD}"
   ${If} "$R1" != "0"
      ${NSD_UnCheck} $hCtl_HTTPServerOptionsPage_CheckBox2
   ${Else}
      ${NSD_Check} $hCtl_HTTPServerOptionsPage_CheckBox2
   ${EndIf}

   ; Pop $R1 & $R0 off of the stack
   Pop $R1
   Pop $R0
FunctionEnd


Function HTTPServerOptionsPage_Leave
   ; Push $R0, $R1 & $R2 onto the stack
   Push $R0
   Push $R1
   Push $R2

   ; Set default section
   StrCpy $R0 "${IOS_GUI}"

   ; Initialize $R1
   StrCpy $R1 1

   ; Save TextBox1 Text
   ${NSD_GetText} $hCtl_HTTPServerOptionsPage_TextBox1 $R2
   ${Trim} "$R2" $R2
   ${If} ${IsValidOptionHttpdIpValue} "$R2"
      ${WriteINIOption} "$R0" "${IO_HTTPD-IP}" "$R2"
   ${Else}
      ; Invalid value
      ; Show warning message
      Push "$R0"
      Call HTTPServerOptionsPage_TextBox1_ShowWarning
      ; Mark for abort
      StrCpy $R1 0
   ${EndIf}

   ; Save Number1 Text
   ${NSD_GetText} $hCtl_HTTPServerOptionsPage_Number1 $R2
   ${Trim} "$R2" $R2
   ${If} ${IsValidOptionHttpdPortValue} "$R2"
      ${WriteINIOption} "$R0" "${IO_HTTPD-PORT}" "$R2"
   ${Else}
      ; Invalid value
      ; Show warning message
      Push "$R0"
      Call HTTPServerOptionsPage_Number1_ShowWarning
      ; Mark for abort
      StrCpy $R1 0
   ${EndIf}

   ; Save TextBox2 Text
   ${NSD_GetText} $hCtl_HTTPServerOptionsPage_TextBox2 $R2
   ${AddCommaStrCommaUStr} "" "$R2" $R2
   ${If} ${IsValidOptionHttpdTrustValue} "$R2"
      ${WriteINIOption} "$R0" "${IO_HTTPD-TRUST}" "$R2"
   ${Else}
      ; Invalid value
      ; Show warning message
      Push "$R0"
      Call HTTPServerOptionsPage_TextBox2_ShowWarning
      ; Mark for abort
      StrCpy $R1 0
   ${EndIf}

   ; Save CheckBox1 Check
   ${NSD_GetState} $hCtl_HTTPServerOptionsPage_CheckBox1 $R2
   ${If} $R2 = ${BST_CHECKED}
      ${WriteINIOption} "$R0" "${IO_ADD-FIREWALL-EXCEPTION}" "1"
   ${Else}
      ${WriteINIOption} "$R0" "${IO_ADD-FIREWALL-EXCEPTION}" "0"
   ${EndIf}

   ; Save CheckBox2 Check
   ${NSD_GetState} $hCtl_HTTPServerOptionsPage_CheckBox2 $R2
   ${If} $R2 = ${BST_CHECKED}
      ${WriteINIOption} "$R0" "${IO_NO-HTTPD}" "0"
   ${Else}
      ${WriteINIOption} "$R0" "${IO_NO-HTTPD}" "1"
   ${EndIf}

   ; Is it necessary to abort?
   ${If} $R1 = 0
      ; Pop $R2, $R1 & $R0 off of the stack
      Pop $R2
      Pop $R1
      Pop $R0
      ; Abort
      Abort
   ${Else}
      ; Pop $R2, $R1 & $R0 off of the stack
      Pop $R2
      Pop $R1
      Pop $R0
   ${EndIf}
FunctionEnd


Function HTTPServerOptionsPage_Number1_ShowWarning
   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get Label2 Text
   ${NSD_GetText} $hCtl_HTTPServerOptionsPage_Label2 $R1

   ; Get Number1 Text
   ${NSD_GetText} $hCtl_HTTPServerOptionsPage_Number1 $R2

   ; Mark invalid value
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_Number1 ""
   SetCtlColors $hCtl_HTTPServerOptionsPage_Number1 0x000000 0xffcc33
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_Number1 "$R2"

   ; Show warning message
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(HTTPServerOptionsPage_TextBox_Warning)"

   ; Reset Number1 Text
   ${ReadINIOption} $R2 "$R0" "${IO_HTTPD-PORT}"
   SetCtlColors $hCtl_HTTPServerOptionsPage_Number1 0x000000 0xffffff
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_Number1 "$R2"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function HTTPServerOptionsPage_Show
   ; Push $R0 onto the stack
   Push $R0

   ; Don't show the screen unless quick installation is disabled
   ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_QUICK-INSTALL}"
   ${If} "$R0" == "0"
      ; Don't show the screen unless "Execution Mode" is "Windows Service"
      ${ReadINIOption} $R0 "${IOS_GUI}" "${IO_EXECMODE}"
      ${If} "$R0" == "${EXECMODE_SERVICE}"
         Call HTTPServerOptionsPage_Create
         nsDialogs::Show $hCtl_HTTPServerOptionsPage
      ${EndIf}
   ${EndIf}

   ; Pop $R0 off of the stack
   Pop $R0
FunctionEnd


Function HTTPServerOptionsPage_TextBox1_ShowWarning
   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get Label1 Text
   ${NSD_GetText} $hCtl_HTTPServerOptionsPage_Label1 $R1

   ; Get TextBox1 Text
   ${NSD_GetText} $hCtl_HTTPServerOptionsPage_TextBox1 $R2

   ; Mark invalid value
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_TextBox1 ""
   SetCtlColors $hCtl_HTTPServerOptionsPage_TextBox1 0x000000 0xffcc33
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_TextBox1 "$R2"

   ; Show warning message
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(HTTPServerOptionsPage_TextBox_Warning)"

   ; Reset TextBox1 Text
   ${ReadINIOption} $R2 "$R0" "${IO_HTTPD-IP}"
   SetCtlColors $hCtl_HTTPServerOptionsPage_TextBox1 0x000000 0xffffff
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_TextBox1 "$R2"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd


Function HTTPServerOptionsPage_TextBox2_ShowWarning
   ; Get parameter
   Exch $R0

   ; Push $R1 & $R2 onto the stack
   Push $R1
   Push $R2

   ; Get Label3 Text
   ${NSD_GetText} $hCtl_HTTPServerOptionsPage_Label3 $R1

   ; Get TextBox2 Text
   ${NSD_GetText} $hCtl_HTTPServerOptionsPage_TextBox2 $R2

   ; Mark invalid value
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_TextBox2 ""
   SetCtlColors $hCtl_HTTPServerOptionsPage_TextBox2 0x000000 0xffcc33
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_TextBox2 "$R2"

   ; Show warning message
   MessageBox MB_OK|MB_ICONEXCLAMATION "$(HTTPServerOptionsPage_TextBox_Warning)"

   ; Reset TextBox2 Text
   ${ReadINIOption} $R2 "$R0" "${IO_HTTPD-TRUST}"
   SetCtlColors $hCtl_HTTPServerOptionsPage_TextBox2 0x000000 0xffffff
   ${NSD_SetText} $hCtl_HTTPServerOptionsPage_TextBox2 "$R2"

   ; Pop $R2, $R1 & $R0 off of the stack
   Pop $R2
   Pop $R1
   Pop $R0
FunctionEnd
