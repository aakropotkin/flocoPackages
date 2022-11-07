{

  inputs.packument.url   = "https://registry.npmjs.org/to-through?rev=9-1c590916c823e4a6df945709916d7cfd";
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
    ident = "to-through";
    ldir  = "info/unscoped/t/to-through";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
