{

  inputs.packument.url   = "https://registry.npmjs.org/minipass-fetch?rev=31-d203176acb1df789264ee89438709dbe";
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
    ident = "minipass-fetch";
    ldir  = "info/unscoped/m/minipass-fetch";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
