tableextension 69004 "AFT Item Journal Line" extends "Item Journal Line"
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