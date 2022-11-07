{

  inputs.packument.url   = "https://registry.npmjs.org/resolve?rev=186-c19115a4017a81e703ce88b7d36699dc";
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
    ident = "resolve";
    ldir  = "info/unscoped/r/resolve";
    inherit packument fetchInfo;
  } // latest';

}
