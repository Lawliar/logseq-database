## go get module from enterprise github
https://stackoverflow.com/questions/58305567/how-to-set-goprivate-environment-variable

basically, configure 1. GOPRIVATE and 2. ~/.gitconfig to make sure when go fetch the private repo, it uses ssh instead of http
