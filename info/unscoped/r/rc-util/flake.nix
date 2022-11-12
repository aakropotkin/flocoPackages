{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-util?_rev=191-213b92c1ef4175c8b6638ece3fdf9468";
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
    ident = "rc-util";
    ldir  = "info/unscoped/r/rc-util";
    inherit packument fetchInfo;
  } // latest';

}
