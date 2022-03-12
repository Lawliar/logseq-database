## go get module from enterprise github
https://stackoverflow.com/questions/58305567/how-to-set-goprivate-environment-variable

basically, configure 1. GOPRIVATE and 2. ~/.gitconfig to make sure when go fetch the private repo, it uses ssh instead of http

## convert from C.char * (used in cgo)to golang string
https://gist.github.com/helinwang/2c7bd2867ea5110f70e6431a7c80cd9b


## GOPATH messes
https://maelvls.dev/go111module-everywhere/
for the heterotrust project, set GO111MODULE to on, it will force the go.mod to work, otherwise it won't find the enhanced-go-spire package
For me, since I mount my large ubuntu drive to my small WSL2, so I host all the code in the mounted drive, I tend to keep all the code there, as a result, I not only install GOROOT at the shared folder(which is automatically configured when I install go from the pre-built binary), GOPATH is by default point to the home dir, which is not shared, so I modify that to point to `gopath` folder in the shared drive as well, not my WSL and ubuntu shared the same GOROOT and GOPATH.
