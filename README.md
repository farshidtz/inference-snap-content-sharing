# Inference snap default provider

Content sharing from the inference manager snap to inference snaps.

Inference manager installs inference snaps via the snapd-control interface.
It provides a command such as below for the installation of inference snaps:

```bash
snapctl install gemma3-jane --engine intel-gpu --model gemma3-270m
```

Snaps don't support configurations at install time on classic systems.
Instead, these snaps rely on a content interface to exchange the configurations.
For this to work, the content interface must auto connect. 
In this case, the auto connection is performed because both snaps are from the same publisher.

At connection time, the inference manager sets the engine and model configurations as interface attributes.
The inference snap reads these attributes and stores them as snap options.
The inference snap then reads the snap options and uses them to configure itself from the default-configure hook.

The default-configure hook consumes the snap options set from the connect hook, the same way a gadget snap would set them, and can use them to configure the snap.

## Try

Build, upload and install using the provided scripts.
Install `inference` snap first, then `gemma3-jane` snap.

## Debug
```console
sudo journalctl -f -n 100 --no-hostname | grep gemma3-jane | grep -v kernel
```


## FAQ

* Why isn't an install hook used to configure the snap at install time?
  * The install hook runs after the connection takes place. However, the install hook does not have access to configurations seeded from a gadget on Ubuntu Core. The design here is to make the configurations shared from another snap similar to those seeded from a gadget.
* Why aren't the configuration shared via a file in the content interface?
  * A file could be used and then converted to snap options in the connect hook. The design tries to make the configurations shared from another snap similar to those seeded from a gadget. To satisfy this, the configurations must be received by the default configure as snap options.
* Why isn't the configurations consumed by the connect hook directly instead of the default-configure hook?
  * The configurations must be applied only once and at install time. This leaves us with the install and default-configure hooks.

