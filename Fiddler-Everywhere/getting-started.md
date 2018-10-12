# Getting Started

## Windows

    On Windows Fiddler starts with double-click on the executable in the extracted folder.

## Mac

    When first starting the application you should right click on the executable and then press "Open".
    When asked you should select "Open" again.
    This would allow Fiddler to start without any popup messages from that moment on.

## Linux

To start Fiddler on Linux follow the steps below:

    1. Make sure you have "libgconf2-4" package installed on your system. For Debian based systems execute the following command to install the package.
        "sudo apt -y install libgconf2-4"
    
    Note that you might need to add the "universe" repository in order for your system to locate the libgconf2-4 package.

    2. Navigate to the root of the unzipped folder

    2. Execute the following commands:
        - chmod +x Fiddler
        - cd resources/app/WebServer
        - chmod +x Fiddler.WebUi
    
    3. Return to the root of the unzipped folder

    4. Open the Fiddler executable ( by typing "./Fiddler" )