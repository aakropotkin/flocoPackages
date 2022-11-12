{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/minimist?_rev=577-da20d4c2feb54f9a874f8e85fa41bf4a";
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
    ident = "minimist";
    ldir  = "info/unscoped/m/minimist";
    inherit packument fetchInfo;
  } // latest';

}
