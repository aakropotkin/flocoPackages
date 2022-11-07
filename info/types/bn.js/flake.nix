{

  inputs.packument.url   = "https://registry.npmjs.org/@types/bn.js?rev=597-80985ab3cd6b72bc0bf2a6a058252aad";
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
    scope = "@types";
    ident = "@types/bn.js";
    ldir  = "info/types/bn.js";
    inherit packument fetchInfo;
  } // latest';

}
