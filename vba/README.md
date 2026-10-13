# VBA Automation

This folder contains the VBA source used to automate recurring Excel reporting tasks in the recycling-operations workbook.

## Automation included

- Standardizes pickup material names and known data-entry inconsistencies
- Standardizes pickup-status values
- Validates material categories and flags unexpected values for review
- Refreshes PivotTables across the workbook
- Recalculates workbook formulas and KPI outputs
- Uses basic error handling so Excel settings are restored if the refresh fails
- Supports a user-facing **Refresh Operations Report** button in the macro-enabled workbook

[View the VBA source](Module1.bas)
