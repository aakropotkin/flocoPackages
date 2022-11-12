{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mitt?_rev=40-186e18251edd6f946ec6d23825a3fe11";
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
    ident = "mitt";
    ldir  = "info/unscoped/m/mitt";
    inherit packument fetchInfo;
  } // latest';

}
