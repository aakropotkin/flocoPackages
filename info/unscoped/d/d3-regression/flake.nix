{

  inputs.packument.url   = "https://registry.npmjs.org/d3-regression?rev=37-a56c4c42187b199ebf2366618defce22";
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
    ident = "d3-regression";
    ldir  = "info/unscoped/d/d3-regression";
    inherit packument fetchInfo;
  } // latest';

}
