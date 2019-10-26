pageextension 69001 "AFT Item Tracking Lines" extends "Item Tracking Lines"
{
    layout
    {
        addlast(Control1)
        {
            field(Grade; "AFT Grade")
            {
                ApplicationArea = All;
            }
        }
    }
}