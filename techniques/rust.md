## tracing
run with env var `RUST_LOG`=<different tracing level> cargo run
## ffi generate c header file automatically
https://michael-f-bryan.github.io/rust-ffi-guide/cbindgen.html
remember to use `--lang c` to generate C style header

## 
>> error: Unable to update registry `crates-io`
>> 
>> Caused by:
>>   failed to fetch `https://github.com/rust-lang/crates.io-index`
>> 
>> Caused by:
>>   failed to authenticate when downloading repository: git@github.com:rust-lang/crates.io-index
>> 
>>   * attempted ssh-agent authentication, but no usernames succeeded: `git`
>> 
>>   if the git CLI succeeds then `net.git-fetch-with-cli` may help here
>>   https://doc.rust-lang.org/cargo/reference/config.html#netgit-fetch-with-cli
>> 
>> Caused by:
>>   error authenticating: no auth sock variable; class=Ssh (23)


https://github.com/ropensci/git2r/issues/296#issuecomment-375786523