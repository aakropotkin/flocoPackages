{

  inputs.packument.url   = "https://registry.npmjs.org/@types/react-transition-group?rev=615-e5ca8edcc3f6d4a724d113088888d93d";
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
    ident = "@types/react-transition-group";
    ldir  = "info/types/react-transition-group";
    inherit packument fetchInfo;
  } // latest';

}
