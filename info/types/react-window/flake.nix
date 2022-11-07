{

  inputs.packument.url   = "https://registry.npmjs.org/@types/react-window?rev=396-f8f4764cba4475c031bfae127441fed8";
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
    ident = "@types/react-window";
    ldir  = "info/types/react-window";
    inherit packument fetchInfo;
  } // latest';

}
