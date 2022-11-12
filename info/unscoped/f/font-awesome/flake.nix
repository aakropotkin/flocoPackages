{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/font-awesome?_rev=231-410b7573d2b4589d9e4baa72c2ff0fbd";
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
    ident = "font-awesome";
    ldir  = "info/unscoped/f/font-awesome";
    inherit packument fetchInfo;
  } // latest';

}
