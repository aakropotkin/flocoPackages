{

  inputs.packument.url   = "https://registry.npmjs.org/continuable-cache?rev=9-d69ff4e236baad9856346bae52a8f53f";
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
    ident = "continuable-cache";
    ldir  = "info/unscoped/c/continuable-cache";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
