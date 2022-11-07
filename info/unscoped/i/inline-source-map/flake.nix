{

  inputs.packument.url   = "https://registry.npmjs.org/inline-source-map?rev=45-789975fcaf278ee3b76320006e5b0e9a";
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
    ident = "inline-source-map";
    ldir  = "info/unscoped/i/inline-source-map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
