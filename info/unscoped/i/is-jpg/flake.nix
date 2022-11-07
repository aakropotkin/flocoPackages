{

  inputs.packument.url   = "https://registry.npmjs.org/is-jpg?rev=18-5906b99c19b732637ce2d6450d00876e";
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
    ident = "is-jpg";
    ldir  = "info/unscoped/i/is-jpg";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
