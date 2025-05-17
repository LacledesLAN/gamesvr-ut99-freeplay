//=============================================================================
// MoreGoreModMenuItem.
//=============================================================================
class MoreGoreModMenuItem expands UMenuModMenuItem;

function Execute()
{ 
	MenuItem.Owner.Root.CreateWindow(class'MoreGore2ConfigWindow',10,10,150,100);
}

defaultproperties
{
     MenuCaption="&MoreGore Plus 2 Setup"
     MenuHelp="Set Gore Level and DigDug Mode"
}
