{

  inputs.packument.url   = "https://registry.npmjs.org/readdir-glob?rev=4-1fee5cd537f484a9a84567ba252dbfe9";
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
    ident = "readdir-glob";
    ldir  = "info/unscoped/r/readdir-glob";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
