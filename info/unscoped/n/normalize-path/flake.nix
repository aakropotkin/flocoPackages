{

  inputs.packument.url   = "https://registry.npmjs.org/normalize-path?rev=30-cc8c99cc131583bb8bc74ca7ca763cd9";
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
    ident = "normalize-path";
    ldir  = "info/unscoped/n/normalize-path";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
