{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-addons-shallow-compare?_rev=114-4fc6d4e5432aa24a7a6ff0d667f41123";
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
    ident = "react-addons-shallow-compare";
    ldir  = "info/unscoped/r/react-addons-shallow-compare";
    inherit packument fetchInfo;
  } // latest';

}
