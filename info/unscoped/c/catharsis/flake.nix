{

  inputs.packument.url   = "https://registry.npmjs.org/catharsis?rev=71-69ab3a6ebb0b623475fe7166df0cd748";
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
    ident = "catharsis";
    ldir  = "info/unscoped/c/catharsis";
    inherit packument fetchInfo;
  } // latest';

}
