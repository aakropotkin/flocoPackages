{

  inputs.packument.url   = "https://registry.npmjs.org/@types/enzyme?rev=740-eddbdff5ec7de19146f0eea45c488c0a";
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
    ident = "@types/enzyme";
    ldir  = "info/types/enzyme";
    inherit packument fetchInfo;
  } // latest';

}
