Before anyone asks, no this cannot be used from a roblox game without changes, read below.

This is a tool that allows you to interact with the roblox web api using https://luvit.io
To use this, create a deps folder in your current directory, and run 

This was made to heavely immitate discordia in the way it logs events, and handle errors, when a function fail, it will return the full error from the function, and it will log it in the terminal, so that it doesn't look out of place when using it with discordia (will be able to be turned off in another update)
```
git clone https://github.com/justdie386/rolua
```
Deps needed from lit are

- creationix/coro-http
- luvit/secure-socket

To use this, please refer to the example folder


Please refer to the TODO for the list of features and other improvements that will be made
The TODO list has been made in order of priority.



You could port this to roblox, but it would probably not be worth it, you'd have to make it work with the funky require system of roblox, change the threading methods from luvit to the roblox one, and edit the Roblox http function which handles the http requests. AND, there seems to be ways to do this from roblox itself with the new opencloud api, which i think allows you to basically do whatever this library does, from straight roblox, which is pretty sick ngl

Now beware, i am not gonna do this, if you wanna do it, do it, but don't except much support when doing so, i haven't touched roblox studio ever and don't plan on doing so.
