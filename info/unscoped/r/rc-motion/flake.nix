{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-motion?_rev=35-68a8c59670098d96804a228a74ea7ad5";
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
    ident = "rc-motion";
    ldir  = "info/unscoped/r/rc-motion";
    inherit packument fetchInfo;
  } // latest';

}
