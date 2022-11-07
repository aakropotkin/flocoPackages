{

  inputs.packument.url   = "https://registry.npmjs.org/@types/react-animations?rev=16-e2bf90a428a9660277ae862e801fc36a";
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
    ident = "@types/react-animations";
    ldir  = "info/types/react-animations";
    inherit packument fetchInfo;
  } // latest';

}
