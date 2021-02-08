<#
.SYNPOSIS

Commands to maintain a local code singing cert.

#>
$certName = "Local Code Sign Cert"

function New-CodeSignCert {

$cert = New-SelfSignedCertificate -CertStoreLocation Cert:\CurrentUser\My -Type CodeSigningCert -Subject "$certName"

}

function Get-CodeSignCert {
	return Get-ChildItem -Path Cert:\CurrentUser\My | ? Subject -EQ "CN=$certName"
}

function Set-CodeSignCert {

	$cert = Get-CodeSignCert
	Move-Item -Path $cert.PSPath -Destination "Cert:\CurrentUser\Root"
}

function Invoke-SignScript {
	param(
		[string]$Path
	)
	$cert = Get-CodeSignCert
	Set-AuthenticodeSignature -FilePath $Path -Certificate $cert
}


New-CodeSignCert
Set-CodeSignCert
