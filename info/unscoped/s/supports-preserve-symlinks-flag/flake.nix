{

  inputs.packument.url   = "https://registry.npmjs.org/supports-preserve-symlinks-flag?rev=1-8d7a0b792ab19d51365d64228ea32493";
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
    ident = "supports-preserve-symlinks-flag";
    ldir  = "info/unscoped/s/supports-preserve-symlinks-flag";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
