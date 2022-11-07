{

  inputs.packument.url   = "https://registry.npmjs.org/passthrough-counter?rev=9-2b7d31bfb41ac6d48bf8c607d13b60e3";
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
    ident = "passthrough-counter";
    ldir  = "info/unscoped/p/passthrough-counter";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
