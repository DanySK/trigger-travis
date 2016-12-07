# trigger-travis
A simple shell script that triggers your travis builds, configurable with a plain text file

## Configuration
Edit the `travis_tokens` file. This file lists, one per line, an entry formatted as folows:
`username projectname travistoken branches`
where:
* `username` is (oh, really?) the user name of the repository owner. In my case, for instance, `DanySK`
* `projectname` is the name of the project whose build should be triggered. In case of this project (that does not require any Travis build, but anyway...) it would be `trigger-travis`
* `travistoken` is the Travis CI token, used for authentication. This code is project specific, it's used for authentication purposes and as such I recommend not to diffuse it publicly. To obtain the token for your projects, please refer to the [Travis CI documentation](https://docs.travis-ci.com/user/triggering-builds).
* `branches` is a space separated list of the branches you want to build. No branches listed, no build triggered. What you probably want to do is to write in there something like `master` or `master develop`, depending on wether or not you are using git flow.

## Execution
* Make sure you configured `trigger_tokens` appropriately
* Make sure `trigger_tokens` is in the same folder of `trigger-travis.sh`
* Issue `sh trigger-travis.sh`
