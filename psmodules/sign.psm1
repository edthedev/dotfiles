<#
.SYNPOSIS

Commands to maintain a local code singing cert.

#>
$certName = "Local Code Sign Cert"
$codeSigning = ""

function New-CodeSignCert {
	$cert = New-SelfSignedCertificate -CertStoreLocation Cert:\CurrentUser\My -Type CodeSigningCert -Subject $certName -KeyAlgorithm RSA -KeyLength 2048 -Provider "Microsoft Enhanced RSA and AES Cryptographic Provider" -KeyUsage "DigitalSignature"

}

function Get-CodeSignCert {
	$certName = "Local Code Sign Cert"
	return Get-ChildItem -Path Cert:\CurrentUser\My | Select-Object -First 1
# 	| ? Subject -EQ "CN=$certName"
}

function Install-CodeSignCert {

	$cert = Get-CodeSignCert
	Move-Item -Path $cert.PSPath -Destination "Cert:\CurrentUser\Root"
}

function Invoke-CodeSign {
	param(
		[string]$Path
	)
	$cert = Get-CodeSignCert
	Set-AuthenticodeSignature -FilePath $Path -Certificate $cert
}

Invoke-CodeSignProfile {
	Invoke-CodeSign -Path $profile
}

Export-ModuleMember -Function New-CodeSignCert
Export-ModuleMember -Function Get-CodeSignCert
Export-ModuleMember -Function Install-CodeSignCert
Export-ModuleMember -Function Invoke-CodeSign
Export-ModuleMember -Function Invoke-CodeSignProfile
