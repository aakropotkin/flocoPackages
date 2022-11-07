{

  inputs.packument.url   = "https://registry.npmjs.org/pullstream?rev=38-3e647aa8ba4aac85cb310e49c8b0ef85";
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
    ident = "pullstream";
    ldir  = "info/unscoped/p/pullstream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
