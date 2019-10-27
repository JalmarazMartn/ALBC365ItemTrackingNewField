pageextension 69003 "AFT Item Ledger Entries" extends "Item Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field(Grade; "AFT Grade")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }
}