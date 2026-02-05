# How to incorporate the NDI library for development

OpenSong relies on the NDI® library for the NDI functionality. These files are part of the NDI SDK distributed by the copyright owner, Vizrt NDI AB. (NDI® is a registered trademark of Vizrt NDI AB)

In order to avoid conflicts with the NDI SDK license and third-party licenses included by reference from that SDK, OpenSong does not include the library files in our repository. These must be added manually by each developer on their local copy of the sources.

The OpenSong build process expects to find the files in Frameworks/<OS name>. In the case of the Linux builds, an additional level is required to distinguish between the different Linux build targets such as x86-64 and ARM 32-bit. The build process assumes these folder names:

* **x86-64:** x86_64-linux-gnu
* **ARM 32-bit for Raspberry Pi:** arm-rpi4-linux-gnueabihf
* **ARM 64-bit for Raspberry Pi **(planned)**:** aarch64-rpi4-linux-gnueabi

To obtain the SDK, register for the SDK link from https://ndi.video. The NDI SDK is distributed by platform, so a full OpenSong build requires the Windows, macOS, and Linux SDK downloads. Unfortunately, the installers are native to the platform, so you will first install the SDK on the target platform, then copy the libraries from those targets to your development system. The macOS version will install to ```/Library/NDI SDK for Apple```. You only need to copy the dylib file from ```lib/macOS```.

The NDI SDK license states that any release we make should use the latest version of the SDK libraries. Before releasing a build, verify that you have the latest SDK version and that the SDK version is backward-compatible with the calls used by OpenSong. The NDI functionality was originally added to OpenSong with SDK version 4.5. 