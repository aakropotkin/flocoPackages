{

  inputs.packument.url   = "https://registry.npmjs.org/react-icons?rev=106-0597e0813bbe2931284a8d7224d53c2b";
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
    ident = "react-icons";
    ldir  = "info/unscoped/r/react-icons";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
