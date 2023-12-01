## Setup

1. Install

	`choco install openshift-cli`

2. Authenticate

	1.  Select `Developer` view.
	2.  Click your own name.
	3.  Select `Copy Login Command`
    4. Follow prompts and then copy and paste the provided `oc` command.

3. Confirm you're connected

	`oc projects`

4. Install `kompose` to support `docker-compose` to `openshift`

	https://kompose.io/installation/

	`go install github.com/kubernetes/kompose@latest`

## Deployment

1. Create a Docker compose file

	Example: `files/openshift/calibre-web/compose.yml`

2. Create a route file

	Example: `files/openshift/calibre-web/route.yml`

4. Use Create K8S files, from `compose.yml`

	```powershell
	cd files/openshift/calibre-web/
	`kompose convert`
	```

3. Deploy
 
	```powershell
	oc apply -f *.yml
	```

