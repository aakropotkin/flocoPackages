{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/react-fast-compare?_rev=71-6c5b8bcc138c27254b32ea2da8ab836b";
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
    ident = "react-fast-compare";
    ldir  = "info/unscoped/r/react-fast-compare";
    inherit packument fetchInfo;
  } // latest';

}
