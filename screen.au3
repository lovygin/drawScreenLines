#include <GDIPlus.au3>
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
HotKeySet("{esc}", "_EXIT")
$hGUI=WinGetHandle("My GUI", "")
 
$i=20 ;кол-во столбцов
$j=20 ;кол-во строк
 
$hGUI = GUICreate("My GUI",@DesktopWidth,@DesktopHeight,0,0,$WS_POPUP,BitOR($WS_EX_TRANSPARENT,$WS_EX_TOPMOST),$WS_EX_TOOLWINDOW) 
GUISetState() 
WinSetTrans($hGUI,"",90) ; прозрачность окна от 0 до 255
 
_GDIPlus_Startup ()
$hGraphic = _GDIPlus_GraphicsCreateFromHWND ($hGUI)
$hPen = _GDIPlus_PenCreate(0x9911190C, 2) ; второй параметр - толщина линий
 
While 1
For $n = 1 To $j
_GDIPlus_GraphicsDrawLine ($hGraphic, 0, (0+@DesktopHeight/($j))*$n, @DesktopWidth, (0+@DesktopHeight/($j))*$n, $hPen)         
Next
 
For $s = 1 To $i
_GDIPlus_GraphicsDrawLine ($hGraphic, (0+@DesktopWidth/($i))*$s, 0, (0+@DesktopWidth/($i))*$s, @DesktopHeight, $hPen)         
Next
sleep(50)   
WEnd
 
Func _EXIT()
_WinAPI_RedrawWindow($hGUI, 0, 0, $RDW_INVALIDATE + $RDW_ALLCHILDREN)
_GDIPlus_GraphicsDispose($hGraphic)
_GDIPlus_PenDispose($hPen)
_GDIPlus_ShutDown ()
Exit
EndFunc
