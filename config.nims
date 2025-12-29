import os

let p = getEnv("PVSNESLIB_HOME", "")
if p.len > 0:
  switch("path", p.joinPath("pvsneslib/include"))

switch("os", "standalone")
switch("app", "staticLib")
switch("gc", "refc")
switch("compileOnly", "on")
switch("noMain", "on")
switch("noLinking", "on")
switch("header", "hello_world_nim.h")
