tableextension 69003 "AFT Item Ledger Entry" extends "Item Ledger Entry"
{
    fields
    {
        field(69001; "AFT Grade"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Grado';
            DecimalPlaces = 2 : 2;
        }
    }

}