{

  inputs.packument.url   = "https://registry.npmjs.org/cacheable-request?rev=49-aea96df90c6b07a94df7dcf240289287";
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
    ident = "cacheable-request";
    ldir  = "info/unscoped/c/cacheable-request";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
