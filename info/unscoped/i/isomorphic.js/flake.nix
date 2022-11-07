{

  inputs.packument.url   = "https://registry.npmjs.org/isomorphic.js?rev=12-4a34f427ea684fd78c1ef00d50740e4b";
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
    ident = "isomorphic.js";
    ldir  = "info/unscoped/i/isomorphic.js";
    inherit packument fetchInfo;
  } // latest';

}
