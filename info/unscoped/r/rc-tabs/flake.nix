{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-tabs?_rev=231-3268c9182827f557090f767b7e73f8ea";
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
    ident = "rc-tabs";
    ldir  = "info/unscoped/r/rc-tabs";
    inherit packument fetchInfo;
  } // latest';

}
