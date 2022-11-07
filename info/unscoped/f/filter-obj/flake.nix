{

  inputs.packument.url   = "https://registry.npmjs.org/filter-obj?rev=14-7c6065581403ebdc75f97489f97cccf1";
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
    ident = "filter-obj";
    ldir  = "info/unscoped/f/filter-obj";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
