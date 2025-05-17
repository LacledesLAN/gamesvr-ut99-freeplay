//=============================================================================
// MoreGore2ClientWindow.
//=============================================================================
class MoreGore2ClientWindow expands UWindowDialogClientWindow;

var UWindowHSliderControl slider, slider2, slider3;
var UWindowSmallButton CloseButton;
var UWindowSmallCloseButton CancelButton;
var UWindowEditControl goreEditBox, SRateEditBox, GRateEditBox;

//MoreGore setup variables
var() config int goreLevel;
var() config float SpawnRate;
var() config float GibRate;

function Created()
{	
	Super.Created();

	if (goreLevel <1)
		goreLevel = 1;
				
	slider = UWindowHSliderControl(CreateControl(class'UWindowHSliderControl', 10, 35, 350, 1));
	slider.SetText("Gore Level:");
	slider.SetRange(1,40,1);
	if (goreLevel>40)
		slider.SetValue(40);
	else
		slider.SetValue(goreLevel);
	
	goreEditBox = UWindowEditControl(CreateWindow(class'UWindowEditControl', 10, 50, 160, WinHeight-30));
	goreEditBox.Align = TA_Left;
	goreEditBox.SetValue(string(goreLevel));
	goreEditBox.SetNumericOnly(true);
	goreEditBox.EditBoxWidth = 15;

	slider2 = UWindowHSliderControl(CreateControl(class'UWindowHSliderControl', 10, 68, 350, 1));
	slider2.SetText("SpawnRate: ");
	slider2.SetRange(0.05,2.0,0.01);
	if (SpawnRate > 2)
		slider2.SetValue(2);
	else
		slider2.SetValue(SpawnRate);
	
	SRateEditBox = UWindowEditControl(CreateWindow(class'UWindowEditControl', 10, 88, 170, WinHeight-30));
	SRateEditBox.Align = TA_Left;
	SRateEditBox.SetText("Drag to adjust by fractions.");
	SRateEditBox.SetNumericOnly(False);
	SRateEditBox.EditBoxWidth = 25;
	SRateEditBox.SetValue(Left(string(SpawnRate), 4));

	slider3 = UWindowHSliderControl(CreateControl(class'UWindowHSliderControl', 10, 118, 350, 1));
	slider3.SetText("GibRate: ");
	slider3.SetRange(0.05,2.0,0.01);
	if (GibRate > 2)
		slider3.SetValue(2);
	else
		slider3.SetValue(GibRate);
	
	GRateEditBox = UWindowEditControl(CreateWindow(class'UWindowEditControl', 10, 138, 170, WinHeight-30));
	GRateEditBox.Align = TA_Left;
	GRateEditBox.SetText("Drag to adjust by fractions.");
	GRateEditBox.SetNumericOnly(False);
	GRateEditBox.EditBoxWidth = 25;
	GRateEditBox.SetValue(Left(string(GibRate), 4));

	// Update button 
	CloseButton = UWindowSmallButton(CreateWindow(class'UWindowSmallButton', 54 , 173, 48, 16));
	CloseButton.SetText( "Update" );
	CloseButton.NotifyWindow = Self; // doesn't seem to work otherwise.

	// Cancel button
	CancelButton = UWindowSmallCloseButton(CreateWindow(class'UWindowSmallCloseButton', 128, 173, 48, 16));
	CancelButton.SetText( "Cancel" );	
}

//when a control changes, Notify is called with the changed control
function Notify(UWindowDialogControl C, byte E)
{
	local int sval; 
	local float rval;

	Super.Notify( C, E );
	
	switch(E)
	{
	case DE_Change: // the message sent by sliders and checkboxes 
	switch(C)
	{	
		case slider:
			sval =  slider.GetValue();
			goreEditBox.SetValue(Left(string(sval), 2));
			goreLevel = sval;
			break;		
		case slider2:
			rval =  slider2.GetValue();
			SRateEditBox.SetValue(Left(string(rval), 4));
			SpawnRate = rval;
			break;		
		case slider3:
			rval =  slider3.GetValue();
			GRateEditBox.SetValue(Left(string(rval), 4));
			GibRate = rval;
			break;		
	}
	case DE_Click:
	switch(C)
		{		
			case CloseButton:
				rval = float(goreEditBox.GetValue());
				goreLevel = rval;
				rval = float(SRateEditBox.GetValue());
				SpawnRate = rval;
				rval = float(GRateEditBox.GetValue());
				GibRate = rval;
				SaveConfig();
				ParentWindow.Close();
			break;
		}
	break;
	}
}

defaultproperties
{
     goreLevel=4
     SpawnRate=0.50
     GibRate=0.25
}
