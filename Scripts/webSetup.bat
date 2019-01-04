ECHO Set Custom Variables
set group=%~1
set plan=%~2
set app=%~3

ECHO Set Azure Defaults
call az configure --defaults group=%group%
call az configure --defaults location=centralus

ECHO Create Resource Group, App Plan, and App
call az group create -n %group%
call az appservice plan create -n %plan%
call az webapp create -n %app% -p %plan%