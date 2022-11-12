{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/rc-table?_rev=405-88e398ab4824758c6a4dc37e00951a0b";
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
    ident = "rc-table";
    ldir  = "info/unscoped/r/rc-table";
    inherit packument fetchInfo;
  } // latest';

}
