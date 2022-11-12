{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/node-pre-gyp?_rev=210-2552a0c8ee36801193c468cc9df27790";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "node-pre-gyp";
    ldir  = "info/unscoped/n/node-pre-gyp";
    inherit packument fetchInfo;
  } // latest';

}
