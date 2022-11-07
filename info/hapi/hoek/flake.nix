{

  inputs.packument.url   = "https://registry.npmjs.org/@hapi/hoek?rev=60-8ac076facc5ad4e21affc9eb6c5771c7";
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
    scope = "@hapi";
    ident = "@hapi/hoek";
    ldir  = "info/hapi/hoek";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
