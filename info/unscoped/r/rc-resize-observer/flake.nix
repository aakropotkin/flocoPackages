{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-resize-observer?_rev=19-086561c54e9efada3e1dfb97015ad7a0";
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
    ident = "rc-resize-observer";
    ldir  = "info/unscoped/r/rc-resize-observer";
    inherit packument fetchInfo;
  } // latest';

}
