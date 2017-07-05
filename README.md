# Multi Architecture Linux System
## Make you linux system multi architecture
Multiarch is the term being used to refer to the capability of a system to install and run applications of multiple different binary targets on the same system. For example running a i386-linux-gnu application on an amd64-linux-gnu system. This example is the most common case, but many other working combinations are possible, such as armel and armhf.

Multiarch also simplifies cross-building, where foreign-architecture libraries and headers are needed on a system during building.

The existing proposals allow for the co-installation of libraries and headers for different architectures, but not (yet) binaries. So you can have either the i386 version of a binary, or the amd64 version, but not both (using conventional /bin paths). All the dependencies will be installed and available for the corresponding binary.

Multiarch is a significant and powerful development, and affects many processes and aspects of the system. The immediate practical effects are getting rid of the ia32-libs package, and allowing proper cross-architecture dependencies for cross-building. 

# Apache License
Copyright 2017 Chouaib Hm

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
