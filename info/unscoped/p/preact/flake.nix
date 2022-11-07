{

  inputs.packument.url   = "https://registry.npmjs.org/preact?rev=288-547b8c7a848f875e04858a7abc9a66de";
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
    ident = "preact";
    ldir  = "info/unscoped/p/preact";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
