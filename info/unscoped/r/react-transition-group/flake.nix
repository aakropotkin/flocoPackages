{

  inputs.packument.url   = "https://registry.npmjs.org/react-transition-group?rev=76-bcfe1fa595c970669c68078b946cc31d";
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
    ident = "react-transition-group";
    ldir  = "info/unscoped/r/react-transition-group";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
