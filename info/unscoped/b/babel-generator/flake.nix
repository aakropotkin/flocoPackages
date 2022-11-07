{

  inputs.packument.url   = "https://registry.npmjs.org/babel-generator?rev=240-f8886136473a4f4ff1427a15b60d09e5";
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
    ident = "babel-generator";
    ldir  = "info/unscoped/b/babel-generator";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
