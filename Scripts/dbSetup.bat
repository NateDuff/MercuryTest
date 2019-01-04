ECHO Set Custom Variables
set group=%~1
set plan=%~2
set app=%~3

ECHO Set Azure Defaults
call az configure --defaults group=%group%
call az configure --defaults location=centralus

ECHO Create Sql Server and set Firewall Rule
call az sql server create -n $servername --admin-user $adminlogin --admin-password $password
call az sql server firewall-rule create --server $servername -n MercuryRule --start-ip-address $startip --end-ip-address $endip
call az sql db create --server $servername --name mySampleDatabase --sample-name AdventureWorksLT --service-objective S0 --zone-redundant
call az sql db update --resource-group myResourceGroup --server $servername --name mySampleDatabase --zone-redundant false