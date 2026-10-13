Attribute VB_Name = "Module1"
Option Explicit

Sub StandardizePickupMaterials()

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim cell As Range
    
    Set ws = ThisWorkbook.Worksheets("Pickups")
    
    lastRow = ws.Cells(ws.Rows.Count, "D").End(xlUp).Row
    
    For Each cell In ws.Range("D2:D" & lastRow)
    
        cell.Value = UCase(Trim(cell.Value))
        
        If cell.Value = "LPDE" Then
            cell.Value = "LDPE"
        End If
        
    Next cell
    
    MsgBox "Pickup material data has been standardized."
End Sub

Sub StandardizePickupStatus()

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim cell As Range
    
    Set ws = ThisWorkbook.Worksheets("Pickups")
    
    lastRow = ws.Cells(ws.Rows.Count, "G").End(xlUp).Row
    
    For Each cell In ws.Range("G2:G" & lastRow)
     
        Select Case UCase(Trim(cell.Value))
        
            Case "ON TIME", "ONTIME", "ON-TIME"
                cell.Value = "On Time"
                
            Case "LATE"
                cell.Value = "Late"
                
            Case ""
                cell.Value = "Missing"
                
            Case Else
                cell.Value = Trim(cell.Value)
        
        End Select
    
    Next cell
    
    MsgBox "Pickup status data has been standardized."
    
End Sub

Sub CleanAllPickupData()

    Application.ScreenUpdating = False

    StandardizePickupMaterials
    StandardizePickupStatus

    Application.ScreenUpdating = True

    MsgBox "Pickup data cleaning completed successfully."

End Sub

Sub RefreshOperationsReport()

    Dim ws As Worksheet
    Dim pt As PivotTable

    On Error GoTo ErrorHandler

    Application.ScreenUpdating = False

    'Clean the pickup data
    StandardizePickupMaterials
    StandardizePickupStatus

    'Refresh every PivotTable in the workbook
    For Each ws In ThisWorkbook.Worksheets

        For Each pt In ws.PivotTables
            pt.RefreshTable
        Next pt

    Next ws

    'Recalculate all formulas
    Application.CalculateFull

    Application.ScreenUpdating = True

    MsgBox "Operations report refreshed successfully."

    Exit Sub

ErrorHandler:

    Application.ScreenUpdating = True

    MsgBox "An error occurred: " & Err.Description

End Sub

Sub ValidatePickupData()

    Dim ws As Worksheet
    Dim lastRow As Long
    Dim cell As Range
    Dim issueCount As Long

    Set ws = ThisWorkbook.Worksheets("Pickups")

    lastRow = ws.Cells(ws.Rows.Count, "D").End(xlUp).Row
    issueCount = 0

    'Check material values
    For Each cell In ws.Range("D2:D" & lastRow)

        Select Case UCase(Trim(cell.Value))

            Case "PET", "HDPE", "LDPE", "PP", "MIXED"
                cell.Interior.ColorIndex = xlNone

            Case Else
                cell.Interior.Color = RGB(255, 255, 0)
                issueCount = issueCount + 1

        End Select

    Next cell

    MsgBox issueCount & " potential data issues were found."

End Sub
