# Windows RDP URL Opener
This is an implementation of the rdp:// URL scheme for Windows to help it catch up to all the other operating systems where this is a standard feature for RDP clients.
To be able to actually use rdp:// links in practice, it needs to be supported on all operating systems. While even Microsoft themselves have implemented this for their own RDP client on macOS, iOS/iPadOS, and Android, they have not done so on Windows, which prevents rdp:// from being used in practice, as support on all operating systems is needed for that to make any sense.

So this is a small script (.bat) that simply takes the address from rdp://[address], creates a temporary .rdp file for connecting to that address, and opens that file in the application that is associated with .rdp files.

There are also some registry changes to make sure that Windows understands that it can open rdp:// links with the RDP URL Opener script. These changes are applied when you install the MSI file, which installs locally for the current user and not machine-wide, which makes this possible to use even if you don't have admin permissions as long as you still have permissions to install an MSI.

With this installed, you will be able to click on rdp:// links in any browser, which will then open a new connection in the application that is associated with .rdp files. This gives you some flexibility to decide which RDP client you prefer by changing the file association for .rdp files.

The rdp:// URL scheme can also, in theory, be used to pass configuration options to be used when making a connection, but that is entirely ignored for now, and links that use that feature will not currently work.

If you would like to change the default settings that are used to make RDP connections from rdp:// links, you can do so by editing rdp-url.bat, which by default is found in AppData\Local\RDP URL Opener.
You will find the settings that are used towards the end of that file, where the temporary .rdp file is created.