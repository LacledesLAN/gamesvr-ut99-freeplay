//=============================================================================
// MoreGore2ConfigWindow.
//=============================================================================
class MoreGore2ConfigWindow expands UWindowFramedWindow;

function BeginPlay()
{
Super.BeginPlay();
//Set the title of the Framed Window
WindowTitle = "Configure MoreGore Plus 2";

//The class of the content
ClientClass = class'MoreGore2ClientWindow';
//Make the Framed Window resizable
bSizable = true;
}

function Created()
{
	Super.Created();
	SetSize(380, 220);
	WinLeft = (Root.WinWidth - WinWidth) / 2;
	WinTop = (Root.WinHeight - WinHeight) / 2;
}

defaultproperties
{
}
