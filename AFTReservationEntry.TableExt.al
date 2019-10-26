tableextension 69002 "AFT Reservation Entry" extends "Reservation Entry"
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