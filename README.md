# SNES Hello World Example Nim

This is a simple "Hello World" example for the Super Nintendo Entertainment System (SNES) using the Nim programming language. It demonstrates how to set up a basic SNES project and display text on the screen.

<img width="932" height="684" alt="Screenshot 2025-12-29 at 16 58 31" src="https://github.com/user-attachments/assets/9f4ca80d-8a5f-4bcb-8dc8-7b69256117f5" />

## Prerequisites

- `Nim` programming language installed.

- `PVSNESLIB` library for SNES development.
  - You need to replace `tcc` compiler with my patched version <https://github.com/anosatsuk124/tcc>.

## Building the Project

1. Install Nim.

2. Clone the PVSNESLIB repository. And set the `PVSNESLIB_HOME` environment variable to point to the cloned directory.

3. In this directory, run `make`.


## License

```
   Copyright 2025 Satsuki Akiba <anosatsuk124@gmail.com>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

```
