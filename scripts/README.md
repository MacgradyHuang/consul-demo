# Box-building script

This script is meant to be invoked in an existing Vagrant environent to create a new box. It will provision a box as described in the existing Vagrant file, then package it and add to the list of boxes on the current machine. This is handy for building a hierarchy of images.
Packer could also be used for the task, however, it works with `OVF`/`OVA` files as sources, wherease this script avoids exporting boxes to files (except when packaging, but those files are cleaned up after build).
