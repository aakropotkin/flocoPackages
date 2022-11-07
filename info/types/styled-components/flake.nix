{

  inputs.packument.url   = "https://registry.npmjs.org/@types/styled-components?rev=886-9ad96e218208fc8c42f288fe5cbde476";
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
    ident = "@types/styled-components";
    ldir  = "info/types/styled-components";
    inherit packument fetchInfo;
  } // latest';

}
