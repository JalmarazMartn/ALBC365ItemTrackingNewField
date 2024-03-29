codeunit 69001 "AFT Grade Posting"
{
    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnRegisterChangeOnAfterCreateReservEntry', '', false, false)]
    local procedure ItemTrackingLinesOnRegisterChangeOnAfterCreateReservEntry(var ReservEntry: Record "Reservation Entry"; OldTrackingSpecification: Record "Tracking Specification")
    begin
        ReservEntry."AFT Grade" := OldTrackingSpecification."AFT Grade";
        ReservEntry.Modify();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterCopyTrackingSpec', '', false, false)]
    local procedure ItemTrackingLinesOnAfterCopyTrackingSpec(var DestTrkgSpec: Record "Tracking Specification"; var SourceTrackingSpec: Record "Tracking Specification")
    begin
        DestTrkgSpec."AFT Grade" := SourceTrackingSpec."AFT Grade";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterEntriesAreIdentical', '', false, false)]
    local procedure ItemTrackingLinesOnAfterEntriesAreIdentical(ReservEntry1: Record "Reservation Entry"; ReservEntry2: Record "Reservation Entry"; var IdenticalArray: array[2] of Boolean)
    begin

        IdenticalArray[2] := IdenticalArray[2] and (ReservEntry1."AFT Grade" = ReservEntry2."AFT Grade");
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterMoveFields', '', false, false)]
    local procedure ItemTrackingLinesOnAfterMoveFields(var ReservEntry: Record "Reservation Entry"; var TrkgSpec: Record "Tracking Specification")
    begin
        ReservEntry."AFT Grade" := TrkgSpec."AFT Grade";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertSetupTempSplitItemJnlLine', '', false, false)]
    local procedure ItemJnlPostLineOnBeforeInsertSetupTempSplitItemJnlLine(var TempTrackingSpecification: Record "Tracking Specification"; var TempItemJournalLine: Record "Item Journal Line")
    begin
        TempItemJournalLine."AFT Grade" := TempTrackingSpecification."AFT Grade"
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure ItemJnlPostLineOnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        NewItemLedgEntry."AFT Grade" := ItemJournalLine."AFT Grade";
    end;

    [EventSubscriber(ObjectType::table, database::"Tracking Specification", 'OnAfterValidateEvent', 'Lot No.', false, false)]
    local procedure TrackingSpecificationLotNoOnAfterValidateEvent(var Rec: Record "Tracking Specification")
    begin
        rec."AFT Grade" := GetGradeFirst(Rec);
    end;

    local procedure GetGradeFirst(TrackingSpecication: Record "Tracking Specification"): Decimal
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        with ItemLedgerEntry do begin
            SetCurrentKey("Item No.", "Lot No.", "Posting Date", "Entry No.");
            SetRange("Item No.", TrackingSpecication."Item No.");
            SetRange("Lot No.", TrackingSpecication."Lot No.");
            if FindLast() then
                exit("AFT Grade");
        end;

    end;
}